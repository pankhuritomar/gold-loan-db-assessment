USE GoldLoanDB;

INSERT INTO Branch (branch_name, location, manager_name) VALUES
('Downtown Branch', 'Delhi', 'Ravi Sharma'),
('City Center Branch', 'Mumbai', 'Kavita Rao'),
('Elite Finance Branch', 'Bangalore', 'Suresh Menon'),
('TrustGold Branch', 'Chennai', 'Aditi Nair'),
('WealthSure Branch', 'Pune', 'Rohan Deshmukh');

INSERT INTO Officer (officer_name, designation, contact_number, email, branch_id) VALUES
('Ananya Gupta', 'Loan Officer', '9876543210', 'ananya@trustgold.com', 1),
('Rohit Jain', 'Verification Officer', '9898989898', 'rohit@trustgold.com', 1),
('Vikas Patel', 'Manager', '9123456789', 'vikas@trustgold.com', 2),
('Sneha Pillai', 'Loan Officer', '9000000001', 'sneha@trustgold.com', 2),
('Priya Mehta', 'Approval Officer', '9000000002', 'priya@trustgold.com', 3),
('Rahul Verma', 'Verification Officer', '9000000003', 'rahul@trustgold.com', 3),
('Nisha Reddy', 'Loan Officer', '9000000004', 'nisha@trustgold.com', 4),
('Arjun Malhotra', 'Manager', '9000000005', 'arjun@trustgold.com', 4),
('Karan Kapoor', 'Loan Officer', '9000000006', 'karan@trustgold.com', 5),
('Tanya Sharma', 'Approval Officer', '9000000007', 'tanya@trustgold.com', 5);

INSERT INTO Customer (customer_name, contact_number, address, kyc_id) VALUES
('Ramesh Singh', '9811111111', 'Delhi', 'KYC001'),
('Pooja Verma', '9822222222', 'Mumbai', 'KYC002'),
('Amit Sharma', '9833333333', 'Bangalore', 'KYC003'),
('Kiran Patel', '9844444444', 'Chennai', 'KYC004'),
('Meena Gupta', '9855555555', 'Pune', 'KYC005'),
('Sanjay Mehta', '9866666666', 'Delhi', 'KYC006'),
('Ritika Nair', '9877777777', 'Mumbai', 'KYC007'),
('Vivek Reddy', '9888888888', 'Bangalore', 'KYC008'),
('Neha Bansal', '9899999999', 'Chennai', 'KYC009'),
('Rajesh Kumar', '9800000000', 'Pune', 'KYC010');

INSERT INTO GoldAsset (customer_id, asset_type, weight, purity, valuation) VALUES
(1, 'Necklace', 50, 91.6, 250000),
(1, 'Ring', 10, 91.6, 50000),
(2, 'Bangle', 40, 92, 200000),
(3, 'Coin', 20, 99.9, 100000),
(3, 'Chain', 30, 91.6, 150000),
(4, 'Bracelet', 15, 92, 70000),
(5, 'Necklace', 60, 91.6, 300000),
(6, 'Pendant', 25, 91.6, 120000),
(7, 'Ring', 12, 91.6, 60000),
(8, 'Coin', 18, 99.9, 90000),
(9, 'Bangle', 35, 91.6, 180000),
(10, 'Chain', 28, 91.6, 140000);

INSERT INTO LoanApplication (customer_id, branch_id, amount_requested, status, application_date) VALUES
(1, 1, 200000, 'Approved', '2025-01-10'),
(2, 2, 150000, 'Pending', '2025-01-12'),
(3, 3, 250000, 'Approved', '2025-01-15'),
(4, 4, 80000, 'Under Review', '2025-01-20'),
(5, 5, 300000, 'Disbursed', '2025-02-01'),
(6, 1, 100000, 'Rejected', '2025-02-05'),
(7, 2, 70000, 'Pending', '2025-02-07'),
(8, 3, 120000, 'Approved', '2025-02-10'),
(9, 4, 180000, 'Approved', '2025-02-15'),
(10, 5, 140000, 'Pending', '2025-02-18');

INSERT INTO ApprovalHistory (loan_id, officer_id, action_status, remarks) VALUES
(1, 1, 'Verified', 'Documents verified'),
(1, 2, 'Approved', 'Approved by senior officer'),
(2, 3, 'Verified', 'Awaiting approval'),
(2, 4, 'Pending Verification', 'Verification pending'),
(3, 5, 'Verified', 'Asset verified'),
(3, 6, 'Approved', 'Approved for disbursement'),
(4, 7, 'Verified', 'Further verification needed'),
(4, 8, 'Pending Verification', 'Pending review'),
(5, 9, 'Approved', 'Loan disbursed'),
(6, 2, 'Rejected', 'Low valuation'),
(7, 3, 'Pending Verification', 'Awaiting verification'),
(8, 5, 'Approved', 'Approved'),
(9, 7, 'Verified', 'Good purity'),
(9, 8, 'Approved', 'Approved by manager'),
(10, 9, 'Verified', 'Documents under review');
