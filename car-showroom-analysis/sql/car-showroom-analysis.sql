-- Schema is showroom and it has three tables Cars, Customers, sales
-- all the tables
SELECT *
FROM cars;

SELECT *
FROM customers;

SELECT *
FROM sales;

-- total no of cars
SELECT COUNT(*) AS total_cars 
FROM Cars;

-- distinct car brands
SELECT DISTINCT brand 
FROM Cars;

-- cars priced above average
SELECT *
FROM Cars
WHERE price > (SELECT AVG(price) FROM Cars);

-- no customers from a specific city
SELECT City, Count(*)
FROM customers
GROUP BY City
ORDER BY Count(*) DESC;

-- Total sales revenue
SELECT round(SUM(Sale_Price),2) AS total_revenue
FROM Sales;

-- Total cars sold
SELECT SUM(Quantity) AS total_cars_sold
FROM Sales;

-- Revenue by car brand
SELECT cars.Brand , round(sum(sales.Sale_Price),0) AS Revenue
FROM cars
JOIN sales ON cars.Car_ID = sales.Car_ID
GROUP  BY cars.Brand
ORDER BY Revenue DESC;

-- top 5 expensive cars sold
SELECT brand, model, price
FROM Cars
ORDER BY price DESC
LIMIT 5;

-- Top 5 best-selling cars
SELECT cars.brand, cars.model, SUM(sales.quantity) AS total_sold
FROM sales 
JOIN cars ON cars.car_id = sales.car_id
GROUP BY cars.brand, cars.model
ORDER BY total_sold DESC
LIMIT 5;

-- Customers with more than one purchase
SELECT customer_id, COUNT(*) AS purchases
FROM sales
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Total spending per customer
SELECT customers.name, round(SUM(sales.Sale_Price),2) AS total_spent
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC;

-- Average sale value
SELECT round(AVG(sale_price),2) AS avg_sale_value
FROM Sales;

-- Customers who bought luxury cars (price > 50,000)
SELECT customers.name, cars.Price
FROM customers
JOIN sales ON customers.Customer_ID = sales.Customer_ID
JOIN cars ON cars.Car_ID = sales.Car_ID
WHERE sales.Sale_Price > 50000;

-- Percentage contribution of each brand to total revenue
SELECT cars.brand, ROUND(SUM(sales.Sale_Price) * 100 / 
          (SELECT SUM(Sale_Price) FROM Sales), 2) AS revenue_percentage
FROM Sales
JOIN Cars ON sales.car_id = cars.car_id
GROUP BY cars.brand
ORDER BY revenue_percentage DESC;

-- Ranking cars by sales revenue
SELECT 
    cars.brand,
    cars.model,
    ROUND(SUM(sales.Sale_Price),0) AS revenue,
    RANK() OVER (ORDER BY SUM(sales.Sale_Price) DESC) AS revenue_rank
FROM Sales
JOIN Cars ON sales.car_id = cars.car_id
GROUP BY cars.brand, cars.model
ORDER BY revenue_rank DESC;

-- Customers who never made a purchase
SELECT customers.*
FROM Customers
LEFT JOIN Sales ON customers.customer_id = sales.customer_id
WHERE sales.sale_id IS NULL;

-- Cars never sold
SELECT cars.*
FROM cars
LEFT JOIN sales ON cars.car_id = sales.car_id
WHERE sales.sale_id IS NULL;

-- Most popular fuel type
SELECT Engine_Type, COUNT(*) AS count
FROM Cars
GROUP BY Engine_Type
ORDER BY count DESC;

-- Average car price by brand
SELECT brand, round(AVG(price),2) AS avg_price
FROM Cars
GROUP BY brand
ORDER BY avg_price DESC;

-- Repeat customers rate
SELECT 
    COUNT(DISTINCT customer_id) AS repeat_customers
FROM Sales
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Top customer per city
SELECT city, name, total_spent
FROM (
    SELECT 
        customers.city,
        customers.name,
        SUM(sales.Sale_Price) AS total_spent,
        RANK() OVER (PARTITION BY customers.city ORDER BY SUM(sales.Sale_Price) DESC) AS rnk
    FROM Sales
    JOIN Customers ON sales.customer_id = customers.customer_id
    GROUP BY customers.city, customers.name
) t
WHERE rnk = 1;

-- Sales contribution by gender
SELECT customers.gender, Round(SUM(sales.Sale_Price),0) AS revenue
FROM Sales
JOIN Customers ON sales.customer_id = customers.customer_id
GROUP BY customers.gender
ORDER BY revenue DESC;

-- Average quantity per sale
SELECT AVG(quantity) AS avg_quantity
FROM Sales;

-- Most loyal customer (by purchase count)
SELECT customers.name, COUNT(*) AS purchases
FROM Sales
JOIN Customers ON sales.customer_id = customers.customer_id
GROUP BY customers.name
ORDER BY purchases DESC
LIMIT 1;




















