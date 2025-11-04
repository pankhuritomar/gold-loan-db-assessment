# Gold Loan Application – SQL/DB Assessment Workshop

##  Overview
This project simulates a **Gold Loan Management System** using **MySQL 8+**, designed to manage customers, their gold assets, loan applications, approvals, and branch operations.  

The objective was to design a **normalized database schema**, populate it with **sample data**, and write **complex business-functional queries** to support loan-related insights and analytics.

---

##  Key Entities and Relationships
The database consists of the following main tables:

- **Customer** – Stores personal and KYC information.
- **GoldAsset** – Represents customers’ pledged gold items.
- **LoanApplication** – Tracks loan requests, amounts, and statuses.
- **Branch** – Contains details of each branch.
- **Officer** – Stores employee and branch assignment data.
- **ApprovalHistory** – Logs officer approvals and workflow actions.

---

##  Schema Design (ERD Summary)
Customer (1) ───< (M) GoldAsset
Customer (1) ───< (M) LoanApplication
Branch (1) ───< (M) Officer
Branch (1) ───< (M) LoanApplication
LoanApplication (1) ───< (M) ApprovalHistory
Officer (1) ───< (M) ApprovalHistory



##  Tech Stack

- **Database:** MySQL 8+  
- **Engine:** InnoDB  
- **Tool:** MySQL Workbench

---

## Author

**Pankhuri Tomar**  
  B.Tech (IT) |  Full-Stack Developer |  Data & AI Enthusiast  
 *Ghaziabad, Uttar Pradesh, India*  

