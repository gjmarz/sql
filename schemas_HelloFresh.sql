CREATE DATABASE John_Smith;
USE John_Smith;


DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription 
(
  id_subscription INT AUTO_INCREMENT PRIMARY KEY, 
  status VARCHAR(45), created_at DATETIME, 
  updated_at DATETIME, 
  fk_customer INT REFERENCES customer (id_customer), 
  fk_product_subscriped_to INT REFERENCES product (id_product)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders 
(
  id_order INT AUTO_INCREMENT PRIMARY KEY, 
  order_number VARCHAR(45), 
  delivery_date DATE, 
  purchase_price DECIMAL(8,2), 
  created_at DATETIME, 
  updated_at DATETIME, 
  fk_subscription INT REFERENCES subscription (id_subscription), 
  fk_product INT REFERENCES product (id_product)
);


DROP TABLE IF EXISTS product_family;
CREATE TABLE product_family 
(
    id_product_family INT AUTO_INCREMENT PRIMARY KEY, 
    product_family_handle VARCHAR(45) UNIQUE
);
    
    
DROP TABLE IF EXISTS product;

CREATE TABLE product 
(
    id_product INT AUTO_INCREMENT PRIMARY KEY, 
    product_sku VARCHAR(45) UNIQUE, 
    number_of_recipes TINYINT(1), 
    number_of_meals TINYINT(1), 
    fk_product_family INT REFERENCES product_family (id_product_family)
);
    
    
DROP TABLE IF EXISTS customer;
CREATE TABLE customer 
(
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    email VARCHAR(45),
    password VARCHAR(45),
    created_at DATETIME,
    updated_at DATETIME
);
    
DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription
	(
    id_subscription INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(45),
    created_at DATETIME,
    updated_at DATETIME,
    fk_customer INT REFERENCES customer (id_customer),
    fk_product_subscribed_to INT REFERENCES product (id_product)
    );
DROP TABLE IF EXISTS orders;
CREATE TABLE orders 
(
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    order_number VARCHAR(45), 
    delivery_date DATE, 
    purchase_price DECIMAL(8,2), 
    created_at DATETIME,
    updated_at DATETIME,
    fk_subscription INT REFERENCES subscription (id_subscription),
    fk_product INT REFERENCES product (id_product)
);
    
    
INSERT INTO product_family (product_family_handle) VALUES ('meat');
INSERT INTO product_family (product_family_handle) VALUES ('veggie');
INSERT INTO product_family (product_family_handle) VALUES ('family_friendly');
INSERT INTO product_family (product_family_handle) VALUES ('low_calorie');
INSERT INTO product_family (product_family_handle) VALUES ('classic-box');

INSERT INTO product (product_sku, number_of_recipes, number_of_meals, fk_product_family) VALUES ('Unique_Value1', 2, 3, 1);
INSERT INTO product (product_sku, number_of_recipes, number_of_meals, fk_product_family) VALUES ('Unique_Value2', 3, 3, 2);
INSERT INTO product (product_sku, number_of_recipes, number_of_meals, fk_product_family) VALUES ('Unique_Value3', 4, 3, 3);
INSERT INTO product (product_sku, number_of_recipes, number_of_meals, fk_product_family) VALUES ('Unique_Value4', 4, 3, 3);
INSERT INTO product (product_sku, number_of_recipes, number_of_meals, fk_product_family) VALUES ('Unique_Value5', 4, 3, 3);


INSERT INTO customer (first_name, last_name, email, password, created_at, updated_at ) VALUES ('Joe', 'Peanut', 'JoeRPeanut@aohel.com', 'ABCDE', current_timestamp, current_timestamp);
INSERT INTO customer (first_name, last_name, email, password, created_at, updated_at ) VALUES ('Jason', 'Butter', 'JasonAButter@aohel.com', 'BCDEA', current_timestamp, current_timestamp);
INSERT INTO customer (first_name, last_name, email, password, created_at, updated_at ) VALUES ('Lily', 'Cauli', 'LilyPCauli@aohel.com', 'CDEAB', current_timestamp, current_timestamp);
INSERT INTO customer (first_name, last_name, email, password, created_at, updated_at) VALUES ('Wendy', 'Flower', 'WendyHFlower@aohel.com', 'DEABC', current_timestamp, current_timestamp);
INSERT INTO customer (first_name, last_name, email, password, created_at, updated_at ) VALUES ('John', 'Smith', 'JohnJSmith07074@aohel.com', 'EABCD', current_timestamp, current_timestamp);

INSERT INTO subscription (status, created_at, updated_at, fk_customer, fk_product_subscribed_to) VALUES ('Active', current_timestamp, current_timestamp, 1, 1);
INSERT INTO subscription (status, created_at, updated_at, fk_customer, fk_product_subscribed_to) VALUES ('Paused', current_timestamp, current_timestamp, 2, 2);
INSERT INTO subscription (status, created_at, updated_at, fk_customer, fk_product_subscribed_to) VALUES ('Cancelled', current_timestamp, current_timestamp, 3, 3);
INSERT INTO subscription (status, created_at, updated_at, fk_customer, fk_product_subscribed_to) VALUES ('Active', current_timestamp, current_timestamp, 4, 4);
INSERT INTO subscription (status, created_at, updated_at, fk_customer, fk_product_subscribed_to) VALUES ('Active', current_timestamp, current_timestamp, 5, 5);

INSERT INTO orders (order_number, delivery_date, purchase_price, created_at, updated_at, fk_subscription, fk_product ) VALUES ('4', current_timestamp, 10.99, current_timestamp, current_timestamp,  1, 1);
INSERT INTO orders (order_number, delivery_date, purchase_price, created_at, updated_at, fk_subscription, fk_product ) VALUES ('1', current_timestamp, 12.99, current_timestamp, current_timestamp, 2, 2);
INSERT INTO orders (order_number, delivery_date, purchase_price, created_at, updated_at, fk_subscription, fk_product) VALUES ('15', current_timestamp, 15.99, current_timestamp, current_timestamp, 3, 3);
INSERT INTO orders (order_number, delivery_date, purchase_price, created_at, updated_at, fk_subscription, fk_product ) VALUES ('20', current_timestamp, 16.99, current_timestamp, current_timestamp, 4, 4);
INSERT INTO orders (order_number, delivery_date, purchase_price, created_at, updated_at, fk_subscription, fk_product ) VALUES ('25', current_timestamp, 17.99, current_timestamp, current_timestamp,  5, 5);


SELECT product_sku FROM product 
INNER JOIN subscription 
ON subscription.id_subscription = product.id_product 
INNER JOIN customer 
ON subscription.id_subscription = customer.id_customer 
WHERE email = 'JohnJSmith07074@aohel.com'
and status = 'active';

SELECT id_customer, first_name, last_name 
FROM customer 
INNER JOIN subscription 
	ON customer.id_customer = subscription.id_subscription 
INNER JOIN product 
	ON subscription.id_subscription = product.id_product 
INNER JOIN product_family 
	ON product.fk_product_family = product_family.id_product_family 
Where product_family_handle = 'classic-box';



SELECT status
FROM subscription
INNER JOIN orders
	ON subscription.id_subscription = orders.id_order
WHERE STATUS = 'Paused' AND order_number = '1'; 



SELECT AVG (id_subscription) FROM subscription WHERE status = 'active';

SELECT COUNT (id_customer) AS customer_count FROM customer 
INNER JOIN subscription 
	ON customer.id_customer = subscription.id_subscription
INNER JOIN product 
	ON subscription.id_subscription = product.id_product 
INNER JOIN orders 
	ON product.id_product = orders.id_order WHERE COUNT (id_order) = ! '1';


SELECT COUNT (id_customer) AS customer_count 
FROM customer 
INNER JOIN subscription 
	ON customer.id_customer = subscription.id_subscription
INNER JOIN product 
	ON subscription.id_subscription = product.id_product 
INNER JOIN orders 
	ON product.id_product = orders.id_order WHERE COUNT (id_order) =! '1';


SELECT id_customer, first_name, last_name 
FROM customer 
INNER JOIN subscription 
	ON customer.id_customer = subscription.fk_customer
INNER JOIN orders
	ON subscription.fk_product_subscribed_to = orders.fk_subscription;
          
	  
SELECT COUNT(id_customer) AS customer_count
FROM customer 
INNER JOIN subscription 
	ON customer.id_customer = subscription.fk_customer
INNER JOIN product 
	ON subscription.id_subscription = product.id_product
INNER JOIN orders 
	ON product.id_product = orders.id_order;
                    
                    
                    
                    
                    
