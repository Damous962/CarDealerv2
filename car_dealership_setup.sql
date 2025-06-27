-- Drop and create the database
DROP DATABASE IF EXISTS CarDealership;
CREATE DATABASE CarDealership;
USE CarDealership;

-- Table 1: Dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Table 2: Vehicles
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    year INT,
    color VARCHAR(20),
    mileage INT,
    price DECIMAL(10, 2),
    sold BOOLEAN
);

-- Table 3: Inventory
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 4: Sales Contracts
CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    sale_price DECIMAL(10,2),
    date_sold DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 5: Lease Contracts (Optional)
CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    lease_term_months INT,
    monthly_payment DECIMAL(10,2),
    lease_start_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Sample Data: Dealerships
INSERT INTO dealerships (name, address, phone) VALUES
('City Auto Mall', '123 Main St', '206-123-4567'),
('Best Deals Autos', '456 Center Ave', '206-765-4321');

-- Sample Data: Vehicles
INSERT INTO vehicles (VIN, make, model, year, color, mileage, price, sold) VALUES
('1HGCM82633A004352', 'Honda', 'Accord', 2015, 'Red', 60000, 15000.00, FALSE),
('1C4RJFBG4FC625797', 'Jeep', 'Grand Cherokee', 2018, 'Black', 40000, 23000.00, TRUE),
('3FA6P0LU0HR273451', 'Ford', 'Fusion', 2017, 'Blue', 30000, 17000.00, FALSE),
('2T1BURHE5FC259893', 'Toyota', 'Corolla', 2016, 'White', 50000, 14000.00, TRUE);

-- Sample Data: Inventory
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A004352'),
(1, '3FA6P0LU0HR273451'),
(2, '1C4RJFBG4FC625797'),
(2, '2T1BURHE5FC259893');

-- Sample Data: Sales Contracts
INSERT INTO sales_contracts (VIN, customer_name, sale_price, date_sold) VALUES
('1C4RJFBG4FC625797', 'Alice Johnson', 22500.00, '2024-06-15'),
('2T1BURHE5FC259893', 'Bob Smith', 13500.00, '2024-06-20');

-- Sample Data: Lease Contracts
INSERT INTO lease_contracts (VIN, customer_name, lease_term_months, monthly_payment, lease_start_date) VALUES
('3FA6P0LU0HR273451', 'Carlos Gomez', 36, 350.00, '2024-07-01');