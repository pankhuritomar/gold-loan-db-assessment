-- Gold Loan Application Database Schema
-- Created by: Pankhuri Tomar

CREATE DATABASE IF NOT EXISTS GoldLoanDB;
USE GoldLoanDB;

CREATE TABLE Branch (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    manager_name VARCHAR(100)
);

CREATE TABLE Officer (
    officer_id INT AUTO_INCREMENT PRIMARY KEY,
    officer_name VARCHAR(100) NOT NULL,
    designation VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    address VARCHAR(255),
    kyc_id VARCHAR(50) UNIQUE
);

CREATE TABLE GoldAsset (
    asset_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    asset_type VARCHAR(50),
    weight DECIMAL(10,2),
    purity DECIMAL(5,2),
    valuation DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LoanApplication (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    amount_requested DECIMAL(12,2),
    status ENUM('Pending', 'Under Review', 'Approved', 'Rejected', 'Disbursed') DEFAULT 'Pending',
    application_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE ApprovalHistory (
    approval_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL,
    officer_id INT,
    action_status ENUM('Verified', 'Approved', 'Rejected', 'Pending Verification'),
    remarks VARCHAR(255),
    action_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (loan_id) REFERENCES LoanApplication(loan_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (officer_id) REFERENCES Officer(officer_id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ;

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_date DATE,
    amount DECIMAL(12,2),
    payment_mode VARCHAR(50),
    FOREIGN KEY (loan_id) REFERENCES LoanApplication(loan_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ;
