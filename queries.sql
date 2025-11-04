USE GoldLoanDB;

-- 1. Pending Applications per Branch with Customer and Gold Details
SELECT 
    b.branch_name, l.loan_id, c.customer_name, l.status, g.asset_type, g.weight, g.valuation
FROM LoanApplication l
JOIN Customer c ON l.customer_id = c.customer_id
JOIN Branch b ON l.branch_id = b.branch_id
JOIN GoldAsset g ON g.customer_id = c.customer_id
WHERE l.status = 'Pending'
ORDER BY b.branch_name;

-- 2. Count of Applications per Officer per Stage
SELECT 
    o.officer_name, a.action_status, COUNT(a.loan_id) AS total_applications
FROM ApprovalHistory a
JOIN Officer o ON a.officer_id = o.officer_id
GROUP BY o.officer_name, a.action_status
ORDER BY o.officer_name;

-- 3. Customers with Total Loan Value Applied vs Approved
SELECT 
    c.customer_name,
    SUM(l.amount_requested) AS total_applied,
    SUM(CASE WHEN l.status = 'Approved' OR l.status = 'Disbursed' THEN l.amount_requested ELSE 0 END) AS total_approved
FROM Customer c
JOIN LoanApplication l ON c.customer_id = l.customer_id
GROUP BY c.customer_name;

-- 4. Customers with >1 Gold Asset above weight threshold
SELECT 
    c.customer_name, COUNT(g.asset_id) AS asset_count
FROM Customer c
JOIN GoldAsset g ON c.customer_id = g.customer_id
WHERE g.weight > 20
GROUP BY c.customer_name
HAVING COUNT(g.asset_id) > 1;

-- 5. Application History Ordered by Timestamp
SELECT 
    l.loan_id, c.customer_name, o.officer_name, a.action_status, a.remarks, a.action_timestamp
FROM ApprovalHistory a
JOIN LoanApplication l ON a.loan_id = l.loan_id
JOIN Customer c ON l.customer_id = c.customer_id
JOIN Officer o ON a.officer_id = o.officer_id
ORDER BY a.action_timestamp;

-- 6. Identify Applications Approved without Verification
SELECT 
    l.loan_id, c.customer_name
FROM LoanApplication l
WHERE l.loan_id NOT IN (
    SELECT DISTINCT loan_id FROM ApprovalHistory WHERE action_status = 'Verified'
) AND l.status = 'Approved';
