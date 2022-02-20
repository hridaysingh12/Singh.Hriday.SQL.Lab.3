#CREATE DATABASE `northwind_dw` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
#USE northwind;

-- Parts 1 and 2


#DROP TABLE dim_customers; 
CREATE TABLE `dim_customers` (
  `customer_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  #`email_address` varchar(50) DEFAULT NULL, commented out bc mostly null
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  #`home_phone` varchar(25) DEFAULT NULL, commented out bc mostly null
  #`mobile_phone` varchar(25) DEFAULT NULL, commented out bc mostly null
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,

  PRIMARY KEY (`customer_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

INSERT INTO `northwind_dw`.`dim_customers`
(`customer_key`,
`company`,
`last_name`,
`first_name`,
`job_title`,
`business_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`)
SELECT `id`,
`company`,
`last_name`,
`first_name`,
`job_title`,
`business_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`
FROM northwind.customers;

#SELECT * FROM northwind_dw.dim_customers;





#DROP TABLE dim_employees; 
CREATE TABLE `dim_employees` (
  `employee_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  #`mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page`  longtext,
  
  PRIMARY KEY (`employee_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;



INSERT INTO `northwind_dw`.`dim_employees`
(`employee_key`,
`company`,
`last_name`,
`first_name`,
`email_address`,
`job_title`,
`business_phone`,
`home_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`,
`web_page`)
SELECT `employees`.`id`,
    `employees`.`company`,
    `employees`.`last_name`,
    `employees`.`first_name`,
    `employees`.`email_address`,
    `employees`.`job_title`,
    `employees`.`business_phone`,
    `employees`.`home_phone`,
    `employees`.`fax_number`,
    `employees`.`address`,
    `employees`.`city`,
    `employees`.`state_province`,
    `employees`.`zip_postal_code`,
    `employees`.`country_region`,
    `employees`.`web_page`
FROM `northwind`.`employees`;

#SELECT * FROM northwind_dw.dim_employees;


#DROP TABLE dim_products; 
CREATE TABLE `dim_products` (
  #`supplier_ids` longtext,
  `product_key` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(25) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  #`description` longtext,
  `standard_cost` decimal(19,4) DEFAULT '0.0000',
  `list_price` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `reorder_level` int DEFAULT NULL,
  `target_level` int DEFAULT NULL,
  `quantity_per_unit` varchar(50) DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_reorder_quantity` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,

  PRIMARY KEY (`product_key`),
  KEY `product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;


INSERT INTO `northwind_dw`.`dim_products`
(`product_key`,
`product_code`,
`product_name`,
`standard_cost`,
`list_price`,
`reorder_level`,
`target_level`,
`quantity_per_unit`,
`discontinued`,
`minimum_reorder_quantity`,
`category`)
SELECT `products`.`id`,
    `products`.`product_code`,
`products`.`product_name`,
`products`.`standard_cost`,
`products`.`list_price`,
`products`.`reorder_level`,
`products`.`target_level`,
`products`.`quantity_per_unit`,
`products`.`discontinued`,
`products`.`minimum_reorder_quantity`,
`products`.`category`
FROM `northwind`.`products`;

#SELECT * FROM northwind_dw.dim_products;



#DROP TABLE dim_shippers; 
CREATE TABLE `dim_shippers` (
  `shipper_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  #`last_name` varchar(50) DEFAULT NULL,
  #`first_name` varchar(50) DEFAULT NULL,
  #`email_address` varchar(50) DEFAULT NULL,
  #`job_title` varchar(50) DEFAULT NULL,
  #`business_phone` varchar(25) DEFAULT NULL,
  #`home_phone` varchar(25) DEFAULT NULL,
  #`mobile_phone` varchar(25) DEFAULT NULL,
  #`fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,

  PRIMARY KEY (`shipper_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  #KEY `first_name` (`first_name`),
  #KEY `last_name` (`last_name`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `northwind_dw`.`dim_shippers`
(`shipper_key`,
`company`,
`address`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`)
SELECT `shippers`.`id`,
`shippers`.`company`,
`shippers`.`address`,
`shippers`.`city`,
`shippers`.`state_province`,
`shippers`.`zip_postal_code`,
`shippers`.`country_region`
FROM `northwind`.`shippers`;

#SELECT * FROM northwind_dw.dim_shippers;


#DROP TABLE fact_orders; 
CREATE TABLE fact_orders (
id int AUTO_INCREMENT PRIMARY KEY, #added to the table myself
order_id int,
employee_id int,
customer_id int,
product_id int,
shipper_id int,
ship_name varchar(50) DEFAULT NULL,
ship_address varchar(50) DEFAULT NULL,
ship_city varchar(50) DEFAULT NULL,
ship_state_province varchar(50) DEFAULT NULL,
ship_zip_postal_code varchar(50) DEFAULT NULL,
ship_country_region varchar(50) DEFAULT NULL,
shipping_fee decimal(19,4) NOT NULL DEFAULT '0.0000',
taxes decimal(19,4) NOT NULL DEFAULT '0.0000',
payment_type varchar(50) DEFAULT NULL,
tax_rate decimal(19,4) NOT NULL DEFAULT '0.0000',
orders_status_name  varchar(50) DEFAULT NULL,
quantity decimal(18,4) DEFAULT '0.0000',
unit_price decimal(19,4) DEFAULT '0.0000',
discount double DEFAULT '0',
purchase_order_id int DEFAULT NULL,
inventory_id int DEFAULT NULL,
order_details_status_name varchar(50) DEFAULT NULL) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `northwind_dw`.`fact_orders`
(order_id ,
employee_id,
customer_id ,
product_id ,
shipper_id ,
ship_name ,
ship_address ,
ship_city ,
ship_state_province ,
ship_zip_postal_code ,
ship_country_region ,
shipping_fee ,
taxes ,
payment_type ,
tax_rate ,
orders_status_name,
quantity,
unit_price ,
discount,
purchase_order_id,
inventory_id,
order_details_status_name)
SELECT orders.id ,
orders.employee_id,
orders.customer_id ,
product_id ,
orders.shipper_id ,
orders.ship_name ,
orders.ship_address ,
orders.ship_city ,
orders.ship_state_province ,
orders.ship_zip_postal_code ,
orders.ship_country_region ,
orders.shipping_fee ,
orders.taxes ,
orders.payment_type ,
orders.tax_rate ,
orders_status.status_name  ,
order_details.quantity,
order_details.unit_price ,
order_details.discount,
order_details.purchase_order_id,
order_details.inventory_id,
order_details_status.status_name
FROM northwind.orders
LEFT JOIN northwind.orders_status ON northwind.orders.status_id = northwind.orders_status.id
LEFT JOIN northwind.order_details ON northwind.orders.id = northwind.order_details.order_id
LEFT JOIN northwind.order_details_status ON northwind.order_details.status_id = northwind.order_details_status.id;

#SELECT * FROM northwind_dw.fact_orders;


-- Part 3
SELECT northwind_dw.dim_customers.last_name, sum(northwind_dw.fact_orders.quantity) AS total_quantity, sum(northwind_dw.fact_orders.unit_price) AS total_unit_price
FROM northwind_dw.fact_orders
JOIN  northwind_dw.dim_customers ON northwind_dw.fact_orders.customer_id = northwind_dw.dim_customers.customer_key
GROUP BY northwind_dw.dim_customers.last_name
ORDER BY sum(northwind_dw.fact_orders.unit_price) DESC;






#Scratch Work for Q1 and Q2 below

-- Select *
-- FROM northwind.orders
-- LEFT JOIN northwind.orders_status ON northwind.orders.status_id = northwind.orders_status.id;

-- Select *
-- FROM northwind.order_details od
-- LEFT JOIN northwind.order_details_status ods ON od.status_id = ods.id;

-- Select *
-- FROM northwind.orders
-- INNER JOIN northwind.orders_status ON northwind.orders.status_id = northwind.orders_status.id
-- INNER JOIN northwind.order_details ON northwind.orders.id = northwind.order_details.order_id
-- INNER JOIN northwind.order_details_status ON northwind.order_details.status_id = northwind.order_details_status.id;
