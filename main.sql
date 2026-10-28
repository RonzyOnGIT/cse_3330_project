CREATE DATABASE Shoe_Store;
-- RED FLAG, employee references department, and department references Employee
-- When the tables are being created, an employee will be created then it will need reference to 
-- department, but department hasnt been creted yet, so will need to make employee be 
-- to not reference department for now then add it later
CREATE TABLE Employee (
    Emp_ID INT IDENTITY(1000, 1) PRIMARY KEY,
    Dept_ID INT NOT NULL,
    Fname VARCHAR(15),
    Lname VARCHAR(15),
    Hire_Date DATE,
    Salary INT,
    Phone VARCHAR(12),
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Customer (
    Customer_ID INT IDENTITY(2000, 1) PRIMARY KEY,
    Fname VARCHAR(15),
    Lname VARCHAR(15),
    Phone CHAR(12), -- Force phone number to be length 12 including the '-'
    Email VARCHAR(255)
);

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Manager_ID INT NOT NULL,
    Dept_Name VARCHAR(15),
    Floor_No INT,
    FOREIGN KEY (Manager_ID) REFERENCES Employee(Emp_ID)
);

CREATE TABLE Shoe (
    Shoe_ID INT IDENTITY(3000, 1) PRIMARY KEY,
    Dept_ID INT NOT NULL,
    Brand VARCHAR(15),
    Model VARCHAR(15),
    Size DECIMAL(2, 1),
    Color VARCHAR(15),
    Price INT,
    Stock_Qty INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Wishlist_Item (
    Customer_ID INT NOT NULL,
    Item_No INT,
    Date_Added DATE,
    Priority_Level VARCHAR(6) CHECK (Priority_level IN ('Low', 'Medium', 'High')),
    Notes VARCHAR(70),
    Shoe_ID INT NOT NULL,
    PRIMARY KEY (Customer_ID, Item_No),
    FOREIGN KEY (Shoe_ID) REFERENCES Shoe(Shoe_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Sale_Rec (
    Emp_ID INT NOT NULL,
    Shoe_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Date1 DATE NOT NULL,
    SoldQty INT,
    PRIMARY KEY (Emp_ID, Shoe_ID, Customer_ID, Date1),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
    FOREIGN KEY (Shoe_ID) REFERENCES Shoe(Shoe_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);