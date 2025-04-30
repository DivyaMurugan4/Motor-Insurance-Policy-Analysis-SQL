create schema policy;
use policy;


create database motor_insurance_policy;
use motor_insurance_policy;

CREATE TABLE motor_user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_type VARCHAR(20), -- Broker, Admin, SalesAgent etc.
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(20),
    mobile VARCHAR(20),
    address1 VARCHAR(100),
    city_id INT,
    state_id INT,
    country_id INT,
    national_id VARCHAR(30),
    nationality_id INT,
    status VARCHAR(10) DEFAULT 'active',
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50)
);
 desc motor_user;
 
 


CREATE TABLE motor_login (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    password VARCHAR(255), -- encrypted
    usertype VARCHAR(20), -- Broker, Admin
    status VARCHAR(10) DEFAULT 'active',
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES motor_user(user_id)
); 
 
 CREATE TABLE motor_vehicle (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    make_id INT,
    model_id INT,
    vehicle_type VARCHAR(30), -- Sedan, Jeep, etc.
    category VARCHAR(30), -- Private, Commercial etc.
    body_type VARCHAR(30),
    color VARCHAR(30),
    registration_number VARCHAR(20),
    year_of_manufacture INT,
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50)
);
desc motor_vehicle;


CREATE TABLE motor_quote (
    quote_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    vehicle_id INT,
    cover_type VARCHAR(20), -- TPL, Comprehensive, or both
    addons JSON, -- list of add-on coverages
    base_premium DECIMAL(10, 2),
    total_premium DECIMAL(10, 2),
    tax_amount DECIMAL(10, 2),
    currency VARCHAR(10), -- USD, PKR, etc.
    quote_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES motor_user(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES motor_vehicle(vehicle_id)
);
desc motor_quote;


CREATE TABLE motor_policy (
    policy_id INT AUTO_INCREMENT PRIMARY KEY,
    quote_id INT,
    policy_number VARCHAR(50),
    issued_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    expiry_date DATETIME,
    user_id INT,
    vehicle_id INT,
    premium_paid DECIMAL(10, 2),
    payment_method VARCHAR(20), -- card, broker_credit etc.
    status VARCHAR(20) DEFAULT 'active',
    FOREIGN KEY (quote_id) REFERENCES motor_quote(quote_id),
    FOREIGN KEY (user_id) REFERENCES motor_user(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES motor_vehicle(vehicle_id)
);
desc motor_policy;


INSERT INTO motor_user (user_type, first_name, last_name, gender, dob, email, phone, mobile, address1, city_id, state_id, country_id, national_id, nationality_id, status, added_by)
VALUES
('Broker', 'Ali', 'Khan', 'Male', '1985-06-12', 'ali.khan1@example.com', '0511500001', '03000000001', 'Street 1', 1, 1, 92, '374051234561', 1, 'active', 'admin'),
('SalesAgent', 'Sara', 'Noor', 'Female', '1990-02-28', 'sara.noor2@example.com', '0511500002', '03000000002', 'Street 2', 2, 2, 92, '374051234562', 1, 'active', 'admin'),
('DirectUser', 'John', 'Doe', 'Male', '1992-03-10', 'john.doe3@example.com', '0511500003', '03000000003', 'Street 3', 3, 1, 92, '374051234563', 1, 'active', 'admin'),
('Broker', 'Imran', 'Ali', 'Male', '1987-08-15', 'imran.ali4@example.com', '0511500004', '03000000004', 'Street 4', 1, 1, 92, '374051234564', 1, 'active', 'admin'),
('SalesAgent', 'Nida', 'Aslam', 'Female', '1993-04-22', 'nida.aslam5@example.com', '0511500005', '03000000005', 'Street 5', 2, 2, 92, '374051234565', 1, 'active', 'admin'),
('DirectUser', 'James', 'Smith', 'Male', '1991-11-01', 'james.smith6@example.com', '0511500006', '03000000006', 'Street 6', 3, 3, 92, '374051234566', 1, 'active', 'admin'),
('Broker', 'Waqas', 'Raza', 'Male', '1986-09-30', 'waqas.raza7@example.com', '0511500007', '03000000007', 'Street 7', 1, 1, 92, '374051234567', 1, 'active', 'admin'),
('SalesAgent', 'Mariam', 'Zia', 'Female', '1994-12-13', 'mariam.zia8@example.com', '0511500008', '03000000008', 'Street 8', 2, 2, 92, '374051234568', 1, 'active', 'admin'),
('DirectUser', 'Emma', 'Jones', 'Female', '1995-07-17', 'emma.jones9@example.com', '0511500009', '03000000009', 'Street 9', 3, 3, 92, '374051234569', 1, 'active', 'admin'),
('Broker', 'Zain', 'Iqbal', 'Male', '1984-05-19', 'zain.iqbal10@example.com', '0511500010', '03000000010', 'Street 10', 1, 1, 92, '374051234570', 1, 'active', 'admin'),
('SalesAgent', 'Sana', 'Mir', 'Female', '1992-10-26', 'sana.mir11@example.com', '0511500011', '03000000011', 'Street 11', 2, 2, 92, '374051234571', 1, 'active', 'admin'),
('DirectUser', 'David', 'Lee', 'Male', '1993-02-05', 'david.lee12@example.com', '0511500012', '03000000012', 'Street 12', 3, 3, 92, '374051234572', 1, 'active', 'admin'),
('Broker', 'Arsalan', 'Shah', 'Male', '1989-01-21', 'arsalan.shah13@example.com', '0511500013', '03000000013', 'Street 13', 1, 1, 92, '374051234573', 1, 'active', 'admin'),
('SalesAgent', 'Hira', 'Nasir', 'Female', '1996-08-08', 'hira.nasir14@example.com', '0511500014', '03000000014', 'Street 14', 2, 2, 92, '374051234574', 1, 'active', 'admin'),
('DirectUser', 'Chris', 'Brown', 'Male', '1990-06-03', 'chris.brown15@example.com', '0511500015', '03000000015', 'Street 15', 3, 3, 92, '374051234575', 1, 'active', 'admin'),
('Broker', 'Asad', 'Rehman', 'Male', '1988-07-14', 'asad.rehman16@example.com', '0511500016', '03000000016', 'Street 16', 1, 1, 92, '374051234576', 1, 'active', 'admin'),
('SalesAgent', 'Ayesha', 'Kamal', 'Female', '1991-01-18', 'ayesha.kamal17@example.com', '0511500017', '03000000017', 'Street 17', 2, 2, 92, '374051234577', 1, 'active', 'admin'),
('DirectUser', 'Tom', 'Wilson', 'Male', '1992-12-02', 'tom.wilson18@example.com', '0511500018', '03000000018', 'Street 18', 3, 3, 92, '374051234578', 1, 'active', 'admin'),
('Broker', 'Bilal', 'Ahmed', 'Male', '1983-04-25', 'bilal.ahmed19@example.com', '0511500019', '03000000019', 'Street 19', 1, 1, 92, '374051234579', 1, 'active', 'admin'),
('SalesAgent', 'Fatima', 'Ali', 'Female', '1994-05-30', 'fatima.ali20@example.com', '0511500020', '03000000020', 'Street 20', 2, 2, 92, '374051234580', 1, 'active', 'admin'),
('DirectUser', 'Mike', 'Clark', 'Male', '1993-09-11', 'mike.clark21@example.com', '0511500021', '03000000021', 'Street 21', 3, 3, 92, '374051234581', 1, 'active', 'admin'),
('Broker', 'Kashif', 'Rafiq', 'Male', '1987-10-06', 'kashif.rafiq22@example.com', '0511500022', '03000000022', 'Street 22', 1, 1, 92, '374051234582', 1, 'active', 'admin'),
('SalesAgent', 'Rida', 'Fayyaz', 'Female', '1995-03-27', 'rida.fayyaz23@example.com', '0511500023', '03000000023', 'Street 23', 2, 2, 92, '374051234583', 1, 'active', 'admin'),
('DirectUser', 'Steve', 'Taylor', 'Male', '1991-07-09', 'steve.taylor24@example.com', '0511500024', '03000000024', 'Street 24', 3, 3, 92, '374051234584', 1, 'active', 'admin'),
('Broker', 'Talha', 'Khan', 'Male', '1986-03-13', 'talha.khan25@example.com', '0511500025', '03000000025', 'Street 25', 1, 1, 92, '374051234585', 1, 'active', 'admin');

 select * from motor_user;
 
INSERT INTO motor_vehicle (
  user_id, make_id, model_id, category, body_type, color,
  registration_number, vehicle_type, year_of_manufacture, added_by
)
VALUES
(1, 1, 1, 'Private', 'Sedan', 'White', 'ABC-101', 'Car', 2020, 'admin'),
(2, 2, 2, 'Commercial', 'SUV', 'Black', 'ABC-102', 'Car', 2020, 'admin'),
(3, 1, 3, 'Private', 'Hatchback', 'Red', 'ABC-103', 'Car', 2020, 'admin'),
(4, 3, 4, 'Commercial', 'Truck', 'Blue', 'ABC-104', 'Truck', 2020, 'admin'),
(5, 4, 5, 'Private', 'Van', 'Silver', 'ABC-105', 'Van', 2020, 'admin'),
(6, 1, 1, 'Private', 'Sedan', 'Green', 'ABC-106', 'Car', 2020, 'admin'),
(7, 2, 2, 'Private', 'SUV', 'Yellow', 'ABC-107', 'Car', 2020, 'admin'),
(8, 3, 3, 'Private', 'Hatchback', 'White', 'ABC-108', 'Car', 2020, 'admin'),
(9, 1, 2, 'Private', 'Sedan', 'Blue', 'ABC-109', 'Car', 2020, 'admin'),
(10, 4, 4, 'Commercial', 'Van', 'Red', 'ABC-110', 'Van', 2020, 'admin'),
(11, 1, 5, 'Private', 'Sedan', 'Black', 'ABC-111', 'Car', 2020, 'admin'),
(12, 2, 1, 'Commercial', 'SUV', 'White', 'ABC-112', 'Car', 2020, 'admin'),
(13, 3, 2, 'Commercial', 'Truck', 'Green', 'ABC-113', 'Truck', 2021, 'admin'),
(14, 4, 3, 'Private', 'Van', 'Silver', 'ABC-114', 'Van', 2021, 'admin'),
(15, 1, 4, 'Private', 'Sedan', 'Yellow', 'ABC-115', 'Car', 2021, 'admin'),
(16, 2, 5, 'Private', 'SUV', 'Red', 'ABC-116', 'Car', 2021, 'admin'),
(17, 3, 1, 'Private', 'Hatchback', 'Blue', 'ABC-117', 'Car', 2021, 'admin'),
(18, 4, 2, 'Commercial', 'Truck', 'White', 'ABC-118', 'Truck', 2021, 'admin'),
(19, 1, 3, 'Private', 'Van', 'Green', 'ABC-119', 'Van', 2021, 'admin'),
(20, 2, 4, 'Private', 'SUV', 'Black', 'ABC-120', 'Car', 2021, 'admin'),
(21, 3, 5, 'Private', 'Hatchback', 'Silver', 'ABC-121', 'Car', 2021, 'admin'),
(22, 4, 1, 'Commercial', 'Truck', 'Yellow', 'ABC-122', 'Truck', 2021, 'admin'),
(23, 1, 2, 'Private', 'Van', 'White', 'ABC-123', 'Van', 2021, 'admin'),
(24, 2, 3, 'Private', 'Sedan', 'Red', 'ABC-124', 'Car', 2021, 'admin'),
(25, 3, 4, 'Private', 'SUV', 'Blue', 'ABC-125', 'Car', 2022, 'admin');


ALTER TABLE motor_vehicle ADD user_id INT;
select * from motor_vehicle;

INSERT INTO motor_policy (
  vehicle_id, policy_number, coverage_type, issued_date, expiry_date,
  premium_paid, payment_method, status, user_id
) VALUES
(1, 'POL100001', 'Comprehensive', '2024-01-01', '2025-01-01', 1500.00, 'Credit Card', 'active', 1),
(2, 'POL100002', 'Third-Party', '2024-01-10', '2025-01-10', 800.00, 'Bank Transfer', 'active', 2),
(3, 'POL100003', 'Comprehensive', '2024-02-01', '2025-02-01', 1400.00, 'Cash', 'active', 3),
(4, 'POL100004', 'Third-Party', '2024-02-15', '2025-02-15', 750.00, 'Mobile Money', 'active', 4),
(5, 'POL100005', 'Comprehensive', '2024-03-01', '2025-03-01', 1600.00, 'Credit Card', 'active', 5),
(6, 'POL100006', 'Third-Party', '2024-03-10', '2025-03-10', 850.00, 'Bank Transfer', 'active', 6),
(7, 'POL100007', 'Comprehensive', '2024-03-20', '2025-03-20', 1550.00, 'Cash', 'active', 7),
(8, 'POL100008', 'Comprehensive', '2024-04-01', '2025-04-01', 1450.00, 'Mobile Money', 'active', 8),
(9, 'POL100009', 'Third-Party', '2024-04-10', '2025-04-10', 780.00, 'Credit Card', 'active', 9),
(10, 'POL100010', 'Comprehensive', '2024-04-20', '2025-04-20', 1650.00, 'Cash', 'active', 10),
(11, 'POL100011', 'Third-Party', '2024-05-01', '2025-05-01', 900.00, 'Bank Transfer', 'active', 11),
(12, 'POL100012', 'Comprehensive', '2024-05-10', '2025-05-10', 1700.00, 'Mobile Money', 'active', 12),
(13, 'POL100013', 'Comprehensive', '2024-05-20', '2025-05-20', 1350.00, 'Credit Card', 'active', 13),
(14, 'POL100014', 'Third-Party', '2024-06-01', '2025-06-01', 820.00, 'Cash', 'active', 14),
(15, 'POL100015', 'Comprehensive', '2024-06-10', '2025-06-10', 1600.00, 'Mobile Money', 'active', 15),
(16, 'POL100016', 'Third-Party', '2024-06-20', '2025-06-20', 880.00, 'Credit Card', 'active', 16),
(17, 'POL100017', 'Comprehensive', '2024-07-01', '2025-07-01', 1400.00, 'Bank Transfer', 'active', 17),
(18, 'POL100018', 'Comprehensive', '2024-07-10', '2025-07-10', 1500.00, 'Cash', 'active', 18),
(19, 'POL100019', 'Third-Party', '2024-07-20', '2025-07-20', 780.00, 'Mobile Money', 'active', 19),
(20, 'POL100020', 'Comprehensive', '2024-08-01', '2025-08-01', 1650.00, 'Bank Transfer', 'active', 20),
(21, 'POL100021', 'Comprehensive', '2024-08-10', '2025-08-10', 1450.00, 'Credit Card', 'active', 21),
(22, 'POL100022', 'Third-Party', '2024-08-20', '2025-08-20', 820.00, 'Cash', 'active', 22),
(23, 'POL100023', 'Comprehensive', '2024-09-01', '2025-09-01', 1500.00, 'Mobile Money', 'active', 23),
(24, 'POL100024', 'Third-Party', '2024-09-10', '2025-09-10', 900.00, 'Credit Card', 'active', 24),
(25, 'POL100025', 'Comprehensive', '2024-09-20', '2025-09-20', 1550.00, 'Cash', 'active', 25);

ALTER TABLE motor_policy
ADD coverage_type VARCHAR(50);
desc motor_policy;

select * from motor_policy;


INSERT INTO motor_login (user_id, password, usertype, status, added_by)
VALUES
(1, '5f4dcc3b5aa765d61d8327deb882cf99', 'Admin', 'active', 'system'),
(2, 'e99a18c428cb38d5f260853678922e03', 'Broker', 'active', 'admin'),
(3, 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Broker', 'inactive', 'admin'),
(4, '25d55ad283aa400af464c76d713c07ad', 'Admin', 'active', 'system'),
(5, '81dc9bdb52d04dc20036dbd8313ed055', 'Broker', 'active', 'admin'),
(6, '202cb962ac59075b964b07152d234b70', 'Broker', 'active', 'admin'),   -- password: 123
(7, '098f6bcd4621d373cade4e832627b4f6', 'Broker', 'active', 'admin'),   -- password: test
(8, '5ebe2294ecd0e0f08eab7690d2a6ee69', 'Admin', 'active', 'system'),   -- password: secret
(9, '21232f297a57a5a743894a0e4a801fc3', 'Broker', 'inactive', 'admin'), -- password: admin
(10, '81dc9bdb52d04dc20036dbd8313ed055', 'Broker', 'active', 'admin'),
(11, 'e99a18c428cb38d5f260853678922e03', 'Broker', 'active', 'admin'),
(12, 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Broker', 'active', 'admin'),
(13, '5f4dcc3b5aa765d61d8327deb882cf99', 'Admin', 'active', 'system'),
(14, '25d55ad283aa400af464c76d713c07ad', 'Broker', 'inactive', 'admin'),
(15, '202cb962ac59075b964b07152d234b70', 'Broker', 'active', 'admin'),
(16, '098f6bcd4621d373cade4e832627b4f6', 'Broker', 'active', 'admin'),
(17, '5ebe2294ecd0e0f08eab7690d2a6ee69', 'Admin', 'active', 'system'),
(18, '21232f297a57a5a743894a0e4a801fc3', 'Broker', 'active', 'admin'),
(19, '81dc9bdb52d04dc20036dbd8313ed055', 'Broker', 'active', 'admin'),
(20, 'e99a18c428cb38d5f260853678922e03', 'Broker', 'inactive', 'admin'),
(21, 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Admin', 'active', 'system'),
(22, '5f4dcc3b5aa765d61d8327deb882cf99', 'Broker', 'active', 'admin'),
(23, '25d55ad283aa400af464c76d713c07ad', 'Broker', 'active', 'admin'),
(24, '202cb962ac59075b964b07152d234b70', 'Admin', 'active', 'system'),
(25, '098f6bcd4621d373cade4e832627b4f6', 'Broker', 'active', 'admin');
desc motor_login;

desc motor_quote;
INSERT INTO motor_quote (user_id, vehicle_id, cover_type, addons, base_premium, total_premium, tax_amount, currency)
VALUES
(1, 1, 'Comprehensive', JSON_ARRAY('Roadside Assistance', 'Zero Depreciation'), 1300.00, 1508.00, 208.00, 'USD'),
(2, 2, 'Third-Party', JSON_ARRAY('Personal Accident Cover'), 750.00, 870.00, 120.00, 'USD'),
(3, 3, 'Comprehensive', JSON_ARRAY('Zero Depreciation'), 1250.00, 1450.00, 200.00, 'USD'),
(4, 4, 'Third-Party', JSON_ARRAY(''), 700.00, 812.00, 112.00, 'USD'),
(5, 5, 'Comprehensive', JSON_ARRAY('Roadside Assistance', 'Engine Protection'), 1400.00, 1624.00, 224.00, 'USD'),
(6, 6, 'Third-Party', JSON_ARRAY('Legal Liability'), 800.00, 928.00, 128.00, 'USD'),
(7, 7, 'Comprehensive', JSON_ARRAY('Engine Protection'), 1350.00, 1566.00, 216.00, 'USD'),
(8, 8, 'Comprehensive', JSON_ARRAY('Roadside Assistance'), 1280.00, 1484.80, 204.80, 'USD'),
(9, 9, 'Third-Party', JSON_ARRAY(''), 720.00, 835.20, 115.20, 'USD'),
(10, 10, 'Comprehensive', JSON_ARRAY('Zero Depreciation', 'Legal Liability'), 1420.00, 1655.60, 235.60, 'USD'),
(11, 11, 'Third-Party', JSON_ARRAY('Personal Accident Cover'), 760.00, 881.60, 121.60, 'USD'),
(12, 12, 'Comprehensive', JSON_ARRAY('Engine Protection'), 1500.00, 1740.00, 240.00, 'USD'),
(13, 13, 'Comprehensive', JSON_ARRAY('Roadside Assistance', 'Key Replacement'), 1380.00, 1605.60, 225.60, 'USD'),
(14, 14, 'Third-Party', JSON_ARRAY('Legal Liability'), 740.00, 861.60, 121.60, 'USD'),
(15, 15, 'Comprehensive', JSON_ARRAY('Zero Depreciation'), 1320.00, 1534.40, 214.40, 'USD'),
(16, 16, 'Third-Party', JSON_ARRAY(''), 790.00, 914.80, 124.80, 'USD'),
(17, 17, 'Comprehensive', JSON_ARRAY('Roadside Assistance'), 1270.00, 1473.60, 203.60, 'USD'),
(18, 18, 'Comprehensive', JSON_ARRAY('Engine Protection'), 1290.00, 1496.40, 206.40, 'USD'),
(19, 19, 'Third-Party', JSON_ARRAY('Personal Accident Cover'), 770.00, 898.40, 128.40, 'USD'),
(20, 20, 'Comprehensive', JSON_ARRAY('Zero Depreciation'), 1410.00, 1643.60, 233.60, 'USD'),
(21, 21, 'Comprehensive', JSON_ARRAY('Roadside Assistance', 'Key Replacement'), 1360.00, 1580.80, 220.80, 'USD'),
(22, 22, 'Third-Party', JSON_ARRAY(''), 730.00, 849.60, 119.60, 'USD'),
(23, 23, 'Comprehensive', JSON_ARRAY('Legal Liability', 'Engine Protection'), 1390.00, 1624.80, 234.80, 'USD'),
(24, 24, 'Third-Party', JSON_ARRAY('Personal Accident Cover'), 810.00, 939.60, 129.60, 'USD'),
(25, 25, 'Comprehensive', JSON_ARRAY('Zero Depreciation', 'Roadside Assistance'), 1340.00, 1567.20, 227.20, 'USD');

select * from motor_quote;



CREATE TABLE motor_claim (
    claim_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT,
    vehicle_id INT,
    user_id INT,
    claim_type VARCHAR(50),
    claim_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    claim_amount DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Pending',
    description TEXT,
    handled_by VARCHAR(50),
    handled_on DATETIME,
    FOREIGN KEY (policy_id) REFERENCES motor_policy(policy_id),
    FOREIGN KEY (vehicle_id) REFERENCES motor_vehicle(vehicle_id),
    FOREIGN KEY (user_id) REFERENCES motor_user(user_id)
);
select * from motor_claim;

CREATE TABLE motor_payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT,
    user_id INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    payment_reference VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Completed',
    FOREIGN KEY (policy_id) REFERENCES motor_policy(policy_id),
    FOREIGN KEY (user_id) REFERENCES motor_user(user_id)
);
desc motor_payment;


INSERT INTO motor_claim 
(policy_id, vehicle_id, user_id, claim_type, claim_date, claim_amount, status, description, handled_by, handled_on)
VALUES
(1, 1, 1, 'Accident', '2024-01-15', 1200.00, 'Approved', 'Rear-end collision', 'admin', '2024-01-20'),
(2, 2, 2, 'Theft', '2024-01-18', 3000.00, 'Pending', 'Vehicle stolen from parking', NULL, NULL),
(3, 3, 3, 'Fire', '2024-01-22', 5000.00, 'Rejected', 'Engine fire', 'admin', '2024-01-25'),
(4, 4, 4, 'Accident', '2024-01-28', 1100.00, 'Approved', 'Fender bender', 'admin', '2024-02-01'),
(5, 5, 5, 'Vandalism', '2024-02-02', 900.00, 'Pending', 'Scratches on paint', NULL, NULL),
(6, 6, 6, 'Accident', '2024-02-10', 1300.00, 'Approved', 'Side impact', 'admin', '2024-02-15'),
(7, 7, 7, 'Accident', '2024-02-15', 1450.00, 'Approved', 'Minor accident on highway', 'admin', '2024-02-20'),
(8, 8, 8, 'Theft', '2024-03-01', 2900.00, 'Pending', 'Radio and tires stolen', NULL, NULL),
(9, 9, 9, 'Accident', '2024-03-05', 800.00, 'Rejected', 'Fake accident claim', 'admin', '2024-03-10'),
(10, 10, 10, 'Accident', '2024-03-10', 1200.00, 'Approved', 'Rear bumper damage', 'admin', '2024-03-15'),
(11, 11, 11, 'Flood', '2024-03-20', 2200.00, 'Approved', 'Water damage to interior', 'admin', '2024-03-25'),
(12, 12, 12, 'Accident', '2024-04-01', 1000.00, 'Pending', 'Collision with pole', NULL, NULL),
(13, 13, 13, 'Vandalism', '2024-04-08', 400.00, 'Approved', 'Broken window', 'admin', '2024-04-10'),
(14, 14, 14, 'Fire', '2024-04-12', 6000.00, 'Rejected', 'No fire report', 'admin', '2024-04-16'),
(15, 15, 15, 'Accident', '2024-04-15', 1350.00, 'Approved', 'Crash into barrier', 'admin', '2024-04-20'),
(16, 16, 16, 'Theft', '2024-04-20', 2700.00, 'Pending', 'Side mirrors stolen', NULL, NULL),
(17, 17, 17, 'Flood', '2024-04-25', 1800.00, 'Approved', 'Floor mats and electronics damaged', 'admin', '2024-04-30'),
(18, 18, 18, 'Accident', '2024-05-01', 950.00, 'Approved', 'Broken taillight', 'admin', '2024-05-05'),
(19, 19, 19, 'Accident', '2024-05-04', 1250.00, 'Pending', 'Rear panel dent', NULL, NULL),
(20, 20, 20, 'Fire', '2024-05-10', 4000.00, 'Rejected', 'Claim not verified', 'admin', '2024-05-15'),
(21, 21, 21, 'Accident', '2024-05-12', 1050.00, 'Approved', 'Windshield crack', 'admin', '2024-05-17'),
(22, 22, 22, 'Vandalism', '2024-05-15', 600.00, 'Pending', 'Keyed doors', NULL, NULL),
(23, 23, 23, 'Accident', '2024-05-20', 1600.00, 'Approved', 'Multiple scratches', 'admin', '2024-05-25'),
(24, 24, 24, 'Flood', '2024-05-25', 3200.00, 'Approved', 'Battery short circuit', 'admin', '2024-05-30'),
(25, 25, 25, 'Theft', '2024-05-30', 3100.00, 'Pending', 'Spare tire and tools missing', NULL, NULL);
select * from motor_claim;



INSERT INTO motor_payment 
(policy_id, user_id, payment_date, amount, payment_method, payment_reference, status)
VALUES
(1, 1, '2024-01-01', 1500.00, 'Credit Card', 'TXN10001', 'Completed'),
(2, 2, '2024-01-10', 800.00, 'Bank Transfer', 'TXN10002', 'Completed'),
(3, 3, '2024-02-01', 1400.00, 'Debit Card', 'TXN10003', 'Completed'),
(4, 4, '2024-02-15', 750.00, 'UPI', 'TXN10004', 'Completed'),
(5, 5, '2024-03-01', 1600.00, 'Credit Card', 'TXN10005', 'Completed'),
(6, 6, '2024-03-10', 850.00, 'Cash', 'TXN10006', 'Completed'),
(7, 7, '2024-03-20', 1550.00, 'Bank Transfer', 'TXN10007', 'Completed'),
(8, 8, '2024-04-01', 1450.00, 'Debit Card', 'TXN10008', 'Completed'),
(9, 9, '2024-04-10', 780.00, 'UPI', 'TXN10009', 'Completed'),
(10, 10, '2024-04-20', 1650.00, 'Credit Card', 'TXN10010', 'Completed'),
(11, 11, '2024-05-01', 900.00, 'Bank Transfer', 'TXN10011', 'Completed'),
(12, 12, '2024-05-10', 1700.00, 'UPI', 'TXN10012', 'Completed'),
(13, 13, '2024-05-20', 1350.00, 'Debit Card', 'TXN10013', 'Completed'),
(14, 14, '2024-06-01', 820.00, 'Cash', 'TXN10014', 'Completed'),
(15, 15, '2024-06-10', 1600.00, 'Credit Card', 'TXN10015', 'Completed'),
(16, 16, '2024-06-20', 880.00, 'UPI', 'TXN10016', 'Completed'),
(17, 17, '2024-07-01', 1400.00, 'Debit Card', 'TXN10017', 'Completed'),
(18, 18, '2024-07-10', 1500.00, 'Bank Transfer', 'TXN10018', 'Completed'),
(19, 19, '2024-07-20', 780.00, 'Cash', 'TXN10019', 'Completed'),
(20, 20, '2024-08-01', 1650.00, 'Credit Card', 'TXN10020', 'Completed'),
(21, 21, '2024-08-10', 1450.00, 'UPI', 'TXN10021', 'Completed'),
(22, 22, '2024-08-20', 820.00, 'Bank Transfer', 'TXN10022', 'Completed'),
(23, 23, '2024-09-01', 1500.00, 'UPI', 'TXN10023', 'Completed'),
(24, 24, '2024-09-10', 900.00, 'Debit Card', 'TXN10024', 'Completed'),
(25, 25, '2024-09-20', 1550.00, 'Credit Card', 'TXN10025', 'Completed');
select * from motor_payment;



CREATE TABLE motor_user_role_access (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    usertype VARCHAR(20),
    module_name VARCHAR(50),
    can_view BOOLEAN DEFAULT FALSE,
    can_create BOOLEAN DEFAULT FALSE,
    can_edit BOOLEAN DEFAULT FALSE,
    can_delete BOOLEAN DEFAULT FALSE
);
INSERT INTO motor_user_role_access (usertype, module_name, can_view, can_create, can_edit, can_delete)
VALUES
('Admin', 'User Management', TRUE, TRUE, TRUE, TRUE),
('Broker', 'Quote Generation', TRUE, TRUE, FALSE, FALSE),
('Underwriter', 'Quote Approval', TRUE, TRUE, TRUE, FALSE),
('Operational', 'Claims', TRUE, TRUE, TRUE, TRUE),
('Direct User', 'Quote Generation', TRUE, TRUE, FALSE, FALSE);
select * from motor_user_role_access;


SELECT * FROM motor_policy WHERE status = 'Active';

SELECT * FROM motor_vehicle WHERE vehicle_type = 'SUV';

SELECT * FROM motor_user WHERE user_type = 'Broker';

SELECT * FROM motor_policy WHERE premium_paid > 1500;

SELECT * FROM motor_policy WHERE coverage_type != 'Comprehensive';

SELECT * FROM motor_policy WHERE premium_paid <= 800;

SELECT * FROM motor_policy WHERE premium_paid BETWEEN 1000 AND 1600;

SELECT * FROM motor_policy WHERE coverage_type IN ('Comprehensive', 'Third-Party');

SELECT * FROM motor_vehicle WHERE vehicle_type NOT IN ('SUV', 'Truck');

SELECT * FROM motor_user WHERE added_by LIKE '%admin%';

SELECT * FROM motor_vehicle WHERE registration_number LIKE 'KA%';

SELECT * FROM motor_policy WHERE quote_id IS NULL;

SELECT * FROM motor_policy WHERE coverage_type = 'comprehensive' AND status = 'Active';

SELECT * FROM motor_policy WHERE status = 'Expired' OR status = 'Inactive';

SELECT * FROM motor_quote
ORDER BY total_premium DESC
LIMIT 5;

SELECT 
    vehicle_type,
    COUNT(*) AS total_vehicles
FROM 
    motor_vehicle
GROUP BY 
    vehicle_type
ORDER BY 
    total_vehicles DESC
LIMIT 3;

SELECT * 
FROM motor_vehicle
ORDER BY make_id
LIMIT 5 OFFSET 10;

CREATE TABLE motor_vehicle_backup LIKE motor_vehicle;

SELECT 
    COUNT(*) AS total_users,
    MAX(added_on) AS last_registered
FROM motor_user;

SELECT 
    make_id,
    COUNT(*) AS total_vehicles
FROM motor_vehicle
GROUP BY make_id;

SELECT 
    COUNT(*) AS total_policies,
    SUM(premium_paid) AS total_premium_collected,
    AVG(premium_paid) AS average_premium,
    MAX(premium_paid) AS highest_premium,
    MIN(premium_paid) AS lowest_premium
FROM motor_policy;

SELECT 
    make_id,
    COUNT(*) AS vehicle_count
FROM motor_vehicle
GROUP BY make_id
HAVING COUNT(*) > 3;


SELECT  
    p.policy_number,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    v.registration_number,
    p.premium_paid
FROM motor_policy p
INNER JOIN motor_user u ON p.user_id = u.user_id
INNER JOIN motor_vehicle v ON p.vehicle_id = v.vehicle_id
LIMIT 0, 5000;

SELECT 
   CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    p.policy_number,
    p.premium_paid
FROM motor_user u
LEFT JOIN motor_policy p ON u.user_id = p.user_id;


SELECT 
    q.quote_id,
    q.cover_type,
      CONCAT(u.first_name, ' ', u.last_name) AS full_name
FROM motor_quote q
RIGHT JOIN motor_user u ON q.user_id = u.user_id;


SELECT  
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    p.policy_number
FROM motor_user u
LEFT JOIN motor_policy p ON u.user_id = p.user_id

UNION

SELECT  
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    p.policy_number
FROM motor_user u
RIGHT JOIN motor_policy p ON u.user_id = p.user_id;

SELECT  
    p.policy_number,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    p.status
FROM motor_policy p
JOIN motor_user u ON p.user_id = u.user_id
WHERE p.status = 'active'
LIMIT 0, 5000;

SELECT  
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    SUM(p.premium_paid) AS total_premium
FROM motor_user u
JOIN motor_policy p ON u.user_id = p.user_id
GROUP BY u.user_id, full_name
LIMIT 0, 5000;

SELECT 
    user_id,
    full_name,
    total_premium
FROM (
    SELECT  
        u.user_id,
        CONCAT(u.first_name, ' ', u.last_name) AS full_name,
        SUM(p.premium_paid) AS total_premium
    FROM motor_user u
    JOIN motor_policy p ON u.user_id = p.user_id
    GROUP BY u.user_id, u.first_name, u.last_name
) AS premium_summary
WHERE total_premium > 1000;


-- Find policies with premium equal to the maximum premium
SELECT policy_number, premium_paid
FROM motor_policy
WHERE premium_paid = (
    SELECT MAX(premium_paid)
    FROM motor_policy
);

-- Find all users who have issued at least one policy
SELECT user_id, first_name, last_name
FROM motor_user
WHERE user_id IN (
    SELECT DISTINCT user_id
    FROM motor_policy
);

-- Find policies with a premium higher than the user's average
SELECT p.policy_number, p.user_id, p.premium_paid
FROM motor_policy p
WHERE p.premium_paid > (
    SELECT AVG(p2.premium_paid)
    FROM motor_policy p2
    WHERE p2.user_id = p.user_id
);

-- List each user's total premium paid
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    (SELECT SUM(p.premium_paid)
     FROM motor_policy p
     WHERE p.user_id = u.user_id) AS total_premium
FROM motor_user u;


-- List users with total premium and only show those above 1000
SELECT *
FROM (
    SELECT 
        u.user_id,
        CONCAT(u.first_name, ' ', u.last_name) AS full_name,
        SUM(p.premium_paid) AS total_premium
    FROM motor_user u
    JOIN motor_policy p ON u.user_id = p.user_id
    GROUP BY u.user_id, u.first_name, u.last_name
) AS user_prem
WHERE total_premium > 1000;


DELIMITER //

CREATE PROCEDURE AddNewPolicy(
    IN v_quote_id INT,
    IN v_user_id INT,
    IN v_vehicle_id INT,
    IN v_policy_number VARCHAR(50),
    IN v_issued_date DATETIME,
    IN v_expiry_date DATETIME,
    IN v_premium_paid DECIMAL(10,2),
    IN v_payment_method VARCHAR(20),
    IN v_status VARCHAR(20),
    IN v_coverage_type VARCHAR(50)
)
BEGIN
    INSERT INTO motor_policy (
        quote_id, user_id, vehicle_id, policy_number,
        issued_date, expiry_date, premium_paid,
        payment_method, status, coverage_type
    )
    VALUES (
        v_quote_id, v_user_id, v_vehicle_id, v_policy_number,
        v_issued_date, v_expiry_date, v_premium_paid,
        v_payment_method, v_status, v_coverage_type
    );
END //

DELIMITER ;


CALL AddNewPolicy(1, 2, 3, 'POL100026', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR), 1550.00, 'Online', 'active', 'Comprehensive');

select * from motor_quote;


DELIMITER //

CREATE FUNCTION CalculateTax(premium DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN premium * 0.10;
END //

DELIMITER ;

SELECT policy_number, premium_paid, CalculateTax(premium_paid) AS tax
FROM motor_policy;

CREATE TABLE motor_policy_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_number VARCHAR(50),
    action_taken VARCHAR(20),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //

CREATE TRIGGER log_policy_insert
AFTER INSERT ON motor_policy
FOR EACH ROW
BEGIN
    INSERT INTO motor_policy_log (policy_number, action_taken)
    VALUES (NEW.policy_number, 'Inserted');
END //

DELIMITER ;

GRANT SELECT, INSERT ON motor_policy TO 'broker_user'@'localhost';

