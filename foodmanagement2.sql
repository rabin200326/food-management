create database foodmanagement2;
use foodmanagement2;
-- customers table
create table customers (
    customerid varchar(50) primary key,
    name varchar(100),
    phone varchar(20),
    email varchar(100),
    address varchar(255)
);

-- orders table
create table orders (
    orderid varchar(50) primary key,
    customerid varchar(50),
    orderdate date,
    totalamount decimal(10, 2),
    status varchar(50),
    foreign key (customerid) references customers(customerid)
);

-- order_items table
create table order_items (
    orderid varchar(50),
    orderitemid varchar(50),
    quantity int,
    priceatpurchase decimal(10, 2),
    fooditemid varchar(50),
    primary key (orderid, orderitemid),
    foreign key (orderid) references orders(orderid),
    foreign key (fooditemid) references food_items(fooditemid)
);

-- categories table
create table categories (
    categoryid varchar(50) primary key,
    categoryname varchar(100),
    description varchar(255)
);

-- suppliers table
create table suppliers (
    supplierid varchar(50) primary key,
    name varchar(100),
    contactnumber varchar(20),
    email varchar(100),
    address varchar(255)
);

-- food_items table
create table food_items (
    fooditemid varchar(50) primary key,
    categoryid varchar(50),
    name varchar(100),
    description varchar(255),
    price decimal(10, 2),
    quantityinstock int,
    unit varchar(50),
    supplierid varchar(50),
    foreign key (categoryid) references categories(categoryid),
    foreign key (supplierid) references suppliers(supplierid)
);

-- recipes table
create table recipes (
    recipeid varchar(50) primary key,
    name varchar(100),
    instructions text,
    createdby varchar(50)
);

-- recipe_ingredients table
create table recipe_ingredients (
    recipeingredientid varchar(50) primary key,
    fooditemid varchar(50),
    quantity decimal(10, 2),
    unit varchar(50),
    recipeid varchar(50),
    foreign key (fooditemid) references food_items(fooditemid),
    foreign key (recipeid) references recipes(recipeid)
);

-- inventory_logs table
create table inventory_logs (
    logid varchar(50) primary key,
    fooditemid varchar(50),
    changetype varchar(50),
    quantitychanged int,
    date date,
    handledby varchar(50),
    foreign key (fooditemid) references food_items(fooditemid),
    foreign key (handledby) references employees(employeeid)
);

-- employees table
create table employees (
    employeeid varchar(50) primary key,
    name varchar(100),
    role varchar(50),
    contact varchar(20),
    email varchar(100)
);

SELECT * FROM foodmanagement.orders;
INSERT INTO orders (OrderID, CustomerID, OrderDate, TotalAmount, Status)
VALUES
('O001', 'C001', '2025-04-01', 500.00, 'Completed'),
('O002', 'C002', '2025-04-02', 1200.00, 'Pending'),
('O003', 'C003', '2025-04-03', 750.00, 'Completed'),
('O004', 'C004', '2025-04-04', 300.00, 'Shipped'),
('O005', 'C005', '2025-04-05', 600.00, 'Delivered'),
('O006', 'C006', '2025-04-06', 900.00, 'Completed'),
('O007', 'C007', '2025-04-07', 1100.00, 'Shipped'),
('O008', 'C008', '2025-04-08', 450.00, 'Pending'),
('O009', 'C009', '2025-04-09', 700.00, 'Completed'),
('O010', 'C010', '2025-04-10', 950.00, 'Cancelled'),
('O011', 'C011', '2025-04-11', 1200.00, 'Completed'),
('O012', 'C012', '2025-04-12', 150.00, 'Pending'),
('O013', 'C013', '2025-04-13', 600.00, 'Shipped'),
('O014', 'C014', '2025-04-14', 800.00, 'Completed'),
('O015', 'C015', '2025-04-15', 350.00, 'Shipped'),
('O016', 'C016', '2025-04-16', 1300.00, 'Delivered'),
('O017', 'C017', '2025-04-17', 420.00, 'Completed'),
('O018', 'C018', '2025-04-18', 200.00, 'Pending'),
('O019', 'C019', '2025-04-19', 540.00, 'Shipped'),
('O020', 'C020', '2025-04-20', 450.00, 'Completed'),
('O021', 'C021', '2025-04-21', 700.00, 'Cancelled'),
('O022', 'C022', '2025-04-22', 800.00, 'Delivered'),
('O023', 'C023', '2025-04-23', 600.00, 'Completed'),
('O024', 'C024', '2025-04-24', 1000.00, 'Shipped'),
('O025', 'C025', '2025-04-25', 300.00, 'Pending'),
('O026', 'C026', '2025-04-26', 950.00, 'Shipped'),
('O027', 'C027', '2025-04-27', 560.00, 'Completed'),
('O028', 'C028', '2025-04-28', 850.00, 'Shipped'),
('O029', 'C029', '2025-04-29', 400.00, 'Pending'),
('O030', 'C030', '2025-04-30', 1100.00, 'Delivered');

SELECT * FROM foodmanagement.employees;
INSERT INTO employees (EmployeeID, Name, Role, Contact, Email)
VALUES
  ('E001', 'John Doe', 'Manager', '9876543210', 'john@example.com'),
  ('E002', 'Jane Smith', 'Chef', '9845012345', 'jane@example.com'),
  ('E003', 'Mark Johnson', 'Cashier', '9887123456', 'mark@example.com'),
  ('E004', 'Lucy Brown', 'Waiter', '9476543210', 'lucy@example.com'),
  ('E005', 'Robert Davis', 'Delivery', '9934567890', 'robert@example.com'),
  ('E006', 'Emily Wilson', 'Cleaning', '9213456789', 'emily@example.com'),
  ('E007', 'George Martinez', 'Security', '9198765432', 'george@example.com'),
  ('E008', 'Sophia Lee', 'Chef', '9778945611', 'sophia@example.com'),
  ('E009', 'Michael Clark', 'Manager', '9225789311', 'michael@example.com'),
  ('E010', 'Isabella Lewis', 'Waiter', '9225789112', 'isabella@example.com');
  
  SELECT * FROM foodmanagement.inventory_logs;
INSERT INTO inventory_logs (LogID, FoodItemID, ChangeType, QuantityChanged, Date, HandledBy)
VALUES
('L001', 'F001', 'Stock In', 50, '2025-04-01', 'E001'),
('L002', 'F002', 'Stock Out', -30, '2025-04-02', 'E002'),
('L003', 'F003', 'Stock In', 100, '2025-04-03', 'E003'),
('L004', 'F004', 'Stock Out', -40, '2025-04-04', 'E004'),
('L005', 'F005', 'Stock In', 60, '2025-04-05', 'E005'),
('L006', 'F006', 'Stock Out', -50, '2025-04-06', 'E006'),
('L007', 'F007', 'Stock In', 120, '2025-04-07', 'E007'),
('L008', 'F008', 'Stock Out', -20, '2025-04-08', 'E008'),
('L009', 'F009', 'Stock In', 80, '2025-04-09', 'E009'),
('L010', 'F010', 'Stock Out', -40, '2025-04-10', 'E010');

SELECT * FROM foodmanagement.recipe_ingredients;
INSERT INTO recipe_ingredients (RecipeIngredientID, FoodItemID, Quantity, Unit, RecipeID)
VALUES
('RI001', 'F001', 1, 'Kg', 'R001'),
('RI002', 'F003', 2, 'Kg', 'R002'),
('RI003', 'F005', 1, 'Kg', 'R003'),
('RI004', 'F006', 1, 'Kg', 'R004'),
('RI005', 'F007', 1, 'Litre', 'R005');

SELECT * FROM foodmanagement.recipes;
INSERT INTO recipes (RecipeID, Name, Instructions, CreatedBy)
VALUES
('R001', 'Vegetable Soup', 'Chop vegetables and cook with spices.', 'C001'),
('R002', 'Apple Pie', 'Mix flour, apples, and sugar, bake at 180C.', 'C002'),
('R003', 'Chicken Curry', 'Cook chicken with spices and coconut milk.', 'C003'),
('R004', 'Grilled Salmon', 'Marinate salmon, grill for 10 minutes.', 'C004'),
('R005', 'Orange Juice', 'Squeeze oranges, filter juice.', 'C005');

SELECT * FROM foodmanagement.suppliers;
INSERT INTO suppliers (SupplierID, Name, ContactNumber, Email, Address)
VALUES
('S001', 'Fresh Farms', '9876543210', 'freshfarms@example.com', '2 Farm Road, Chennai'),
('S002', 'Apple Orchards', '9845012345', 'appleorchards@example.com', '45 Orchard Lane, Chennai'),
('S003', 'Dairy Delight', '9887123456', 'dairy@example.com', '77 Dairy Lane, Chennai'),
('S004', 'Meat Packers', '9745632110', 'meatpackers@example.com', '22 Meat Street, Chennai'),
('S005', 'Seafood Fresh', '9934567890', 'seafood@example.com', '34 Beach Road, Chennai'),
('S006', 'Juice Factory', '9612345678', 'juice@example.com', '44 Juicy Road, Chennai'),
('S007', 'Cake Masters', '9778945612', 'cakemasters@example.com', '55 Cake Lane, Chennai'),
('S008', 'Spice World', '9745891234', 'spice@example.com', '77 Spice Street, Chennai'),
('S009', 'Grains and More', '9934561122', 'grains@example.com', '22 Grain Lane, Chennai'),
('S010', 'Snack Co', '9225789311', 'snackco@example.com', '88 Snack Avenue, Chennai');

SELECT * FROM foodmanagement.categories;
INSERT INTO categories (CategoryID, CategoryName, Description)
VALUES
('CAT001', 'Vegetables', 'Fresh seasonal vegetables'),
('CAT002', 'Fruits', 'Various seasonal fruits'),
('CAT003', 'Dairy', 'Milk, Butter, and Cheese'),
('CAT004', 'Meat', 'Fresh cuts of meat'),
('CAT005', 'Fish', 'Fresh seafood'),
('CAT006', 'Beverages', 'Various beverages like juices, sodas'),
('CAT007', 'Bakery', 'Bread, Cakes, and Pastries'),
('CAT008', 'Spices', 'Spices and Herbs'),
('CAT009', 'Grains', 'Rice, Lentils, and Flour'),
('CAT010', 'Snacks', 'Chips, Bars, and other snacks');

SELECT * FROM foodmanagement.order_items;
INSERT INTO order_items (OrderID, OrderItemID, Quantity, PriceAtPurchase, FoodItemID)
VALUES
('O001', 'OI001', 5, 40.00, 'F001'),
('O001', 'OI002', 2, 120.00, 'F002'),
('O002', 'OI003', 3, 50.00, 'F003'),
('O003', 'OI004', 4, 250.00, 'F004'),
('O004', 'OI005', 1, 600.00, 'F005'),
('O005', 'OI006', 6, 80.00, 'F006'),
('O006', 'OI007', 2, 35.00, 'F007'),
('O007', 'OI008', 3, 160.00, 'F008'),
('O008', 'OI009', 5, 120.00, 'F009'),
('O009', 'OI010', 4, 90.00, 'F010'),
('O010', 'OI011', 3, 45.00, 'F011'),
('O011', 'OI012', 2, 30.00, 'F012'),
('O012', 'OI013', 5, 180.00, 'F013'),
('O013', 'OI014', 1, 300.00, 'F014'),
('O014', 'OI015', 4, 150.00, 'F015');


SELECT * FROM project.suppliers;
INSERT INTO project.suppliers (SupplierID, Name, ContactNumber, Email, Address)
VALUES
('1', 'FreshFarm Supplies', '9844098765', 'contact@freshfarm.com', 'Market Road, Coimbatore'),
('2', 'Spice House', '9833321122', 'sales@spicehouse.com', 'Main Bazaar, Madurai'),
('3', 'DailyDairy Co.', '9822113344', 'support@dailydairy.com', 'Dairy Lane, Trichy'),
('4', 'GreenVeg Distributors', '9876554433', 'info@greenveg.com', 'Farm Gate, Salem');

SELECT * FROM project.client;
INSERT INTO client (ClientID, Name, Email, companyname,phone)
VALUES 
('1', 'ram', '9942946531', 'ram@gmail.com', '789 T Nagar, Chennai'),
('2', 'sam', '9845001113', 'sam@gmail.com', '55 Besant Nagar, Chennai');

DELIMITER //
CREATE PROCEDURE sp_add_customer (
    IN p_customerid VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_phone VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_address VARCHAR(255)
)
BEGIN
    INSERT INTO customers (customerid, name, phone, email, address)
    VALUES (p_customerid, p_name, p_phone, p_email, p_address);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_get_customer_orders (
    IN p_customerid VARCHAR(50)
)
BEGIN
    SELECT * FROM orders
    WHERE customerid = p_customerid;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_update_order_status (
    IN p_orderid VARCHAR(50),
    IN p_status VARCHAR(50)
)
BEGIN
    UPDATE orders SET status = p_status WHERE orderid = p_orderid;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_delete_supplier (
    IN p_supplierid VARCHAR(50)
)
BEGIN
    DELETE FROM suppliers WHERE supplierid = p_supplierid;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_get_food_by_category (
    IN p_categoryid VARCHAR(50)
)
BEGIN
    SELECT * FROM food_items WHERE categoryid = p_categoryid;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_add_inventory_log (
    IN p_logid VARCHAR(50),
    IN p_fooditemid VARCHAR(50),
    IN p_changetype VARCHAR(50),
    IN p_quantitychanged INT,
    IN p_date DATE,
    IN p_handledby VARCHAR(50)
)
BEGIN
    INSERT INTO inventory_logs (logid, fooditemid, changetype, quantitychanged, date, handledby)
    VALUES (p_logid, p_fooditemid, p_changetype, p_quantitychanged, p_date, p_handledby);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_total_amount_by_customer (
    IN p_customerid VARCHAR(50)
)
BEGIN
    SELECT customerid, SUM(totalamount) AS total_spent
    FROM orders
    WHERE customerid = p_customerid
    GROUP BY customerid;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_low_stock_items ()
BEGIN
    SELECT * FROM food_items
    WHERE quantityinstock < 10;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_get_recipe_details (
    IN p_recipeid VARCHAR(50)
)
BEGIN
    SELECT r.recipeid, r.name AS recipe_name, ri.fooditemid, f.name AS food_name, ri.quantity, ri.unit
    FROM recipes r
    JOIN recipe_ingredients ri ON r.recipeid = ri.recipeid
    JOIN food_items f ON ri.fooditemid = f.fooditemid
    WHERE r.recipeid = p_recipeid;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_add_employee (
    IN p_employeeid VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_role VARCHAR(50),
    IN p_contact VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO employees (employeeid, name, role, contact, email)
    VALUES (p_employeeid, p_name, p_role, p_contact, p_email);
END //
DELIMITER ;
CREATE VIEW vw_orders_with_customers AS
SELECT o.orderid, o.orderdate, o.totalamount, o.status, c.name AS customer_name
FROM orders o
JOIN customers c ON o.customerid = c.customerid;
CREATE VIEW vw_food_details AS
SELECT f.fooditemid, f.name, f.price, f.quantityinstock, c.categoryname, s.name AS supplier_name
FROM food_items f
JOIN categories c ON f.categoryid = c.categoryid
JOIN suppliers s ON f.supplierid = s.supplierid;
CREATE VIEW vw_inventory_log_details AS
SELECT l.logid, f.name AS food_name, l.changetype, l.quantitychanged, l.date, e.name AS handled_by
FROM inventory_logs l
JOIN food_items f ON l.fooditemid = f.fooditemid
JOIN employees e ON l.handledby = e.employeeid;
CREATE VIEW vw_recipe_ingredients AS
SELECT r.name AS recipe_name, f.name AS ingredient, ri.quantity, ri.unit
FROM recipes r
JOIN recipe_ingredients ri ON r.recipeid = ri.recipeid
JOIN food_items f ON ri.fooditemid = f.fooditemid;
CREATE VIEW vw_customer_contacts AS
SELECT customerid, name, phone, email FROM customers;
CREATE VIEW vw_high_value_orders AS
SELECT * FROM orders WHERE totalamount > 1000;
CREATE VIEW vw_employees_roles AS
SELECT role, COUNT(*) AS total_employees
FROM employees
GROUP BY role;
CREATE VIEW vw_stock_summary AS
SELECT fooditemid, name, quantityinstock, unit
FROM food_items;
CREATE VIEW vw_todays_orders AS
SELECT * FROM orders
WHERE orderdate = CURDATE();
CREATE VIEW vw_pending_orders AS
SELECT * FROM orders
WHERE status = 'Pending';




















