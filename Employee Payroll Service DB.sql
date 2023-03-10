--UC-1 create a payroll service database
create database Employee_Payroll_Services
use Employee_Payroll_Services

--UC-2 create employee payroll table
create table Employee
(
	EmployeeID int identity (1,1) not null primary key,
	EmployeeName varchar(40) not null,
	Salary money not null,
	StartDate Date not null
)
select * from Employee
exec sp_help 'Employee'

--UC-3 Use INSERT INTO employee_payroll
INSERT Employee (EmployeeName, Salary, StartDate) values ('Rucha', 100000, '2018-04-04')
INSERT Employee (EmployeeName, Salary, StartDate) values ('Ritu', 200000, '2019-11-15')
INSERT Employee (EmployeeName, Salary, StartDate) values ('Vanshi', 300000, '2021-05-20')
INSERT Employee (EmployeeName, Salary, StartDate) values ('Shubham', 3500000, '2022-01-12')

--UC-4 Use SELECT * FROM employee
select * from Employee

--UC-5 Use CAST() and NOW() in the Query
select salary from Employee WHERE EmployeeName = 'Rucha'
select * from Employee WHERE StartDate BETWEEN CAST('2018-01-01' AS DATE) AND GETDATE()

--UC-6 Add Gender Employee Table
ALTER Table Employee ADD Gender char(1)
UPDATE Employee SET Gender = 'M' WHERE EmployeeName = 'Shubham'
UPDATE Employee SET Gender = 'F' WHERE EmployeeName = 'Ritu' or EmployeeName = 'Rucha' or EmployeeName = 'Vanshi'
select * from Employee

--UC-7 Find sum,Avg,Min,Max and MF
SELECT SUM(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT SUM(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT AVG(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT AVG(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT MIN(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT MIN(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT MAX(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT MAX(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;

------------ER Diagram----------------
--UC-8 
ALTER Table Employee ADD Department char(150)
ALTER Table Employee ADD PhoneNumber int
ALTER Table Employee ADD Address varchar(250)
Update Employee SET Department = 'Computer' WHERE EmployeeName = 'Rucha'
Update Employee SET Department = 'Civil' WHERE EmployeeName = 'Ritu' 
Update Employee SET Department = 'EXTC' WHERE EmployeeName = 'Vanshi'
Select * from Employee

--UC-9
ALTER Table Employee ADD Deductions money
ALTER Table Employee ADD TaxablePay money
ALTER Table Employee ADD IncomeTax money
ALTER Table Employee ADD NetPay money
Select * from Employee

--UC-10 
INSERT Employee (EmployeeName, salary, StartDate, Gender, Department, Deductions, TaxablePay, IncomeTax, NetPay) values ('Ritu', 200000, '2018-01-03', 'F', 'Computer', 100000, 200000, 50000, 300000)
Select * from Employee WHERE EmployeeName = 'Ritu' 

-- UC-11
create table Employee_Department
(
	EmployeeID int foreign key references Employee(EmployeeID)
	DepartmentId int identity(1,1) primary key 
)
select * from Employee_Department

INSERT Into Employee_Department (EmployeeID) values (1)
INSERT Into Employee_Department (EmployeeID) values (2)
INSERT Into Employee_Department (EmployeeID) values (3)

SELECT SUM(Salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT SUM(Salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT AVG(Salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT AVG(Salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT MIN(Salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT MIN(Salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT MAX(Salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT MAX(Salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;

--UC-12
Select * from Employee
Select EmployeeName,Salary From Employee Where EmployeeName = 'Rucha'
Select * From Employee Where StartDate BETWEEN CAST('2018-04-04' AS DATE) AND GETDATE()
SELECT SUM(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT SUM(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT AVG(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT AVG(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT MIN(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT MIN(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;
SELECT MAX(salary) FROM Employee WHERE Gender = 'F' GROUP BY Gender;
SELECT MAX(salary) FROM Employee WHERE Gender = 'M' GROUP BY Gender;