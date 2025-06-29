create DATABASE ProjectManagementSystemDB

CREATE TABLE Project (
    Id INT PRIMARY KEY,
    [ProjectName] VARCHAR(100),
    Description TEXT,
    StartDate DATE,
    Status VARCHAR(20)
);

CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(100),
    Designation VARCHAR(50),
    Gender CHAR(1),
    Salary DECIMAL(10,2),
    Project_Id INT FOREIGN KEY REFERENCES Project(Id)
);

CREATE TABLE Task (
    Task_Id INT PRIMARY KEY,
    [Task_Name] VARCHAR(100),
    Project_Id INT FOREIGN KEY REFERENCES Project(Id),
    Employee_Id INT FOREIGN KEY REFERENCES Employee(Id),
    Status VARCHAR(20)
);

INSERT INTO Project (Id, ProjectName, Description, StartDate, Status)
VALUES
(1, 'Inventory Management System', 'Manage inventory levels and stock records.', '2024-01-01', 'started'),
(2, 'E-Commerce Platform', 'Online shopping platform for electronics.', '2024-02-15', 'dev'),
(3, 'HRMS', 'Human Resource Management System for internal HR activities.', '2024-03-10', 'build'),
(4, 'Payroll System', 'Automates employee salary processing.', '2024-04-01', 'test'),
(5, 'Customer Support Portal', 'Ticketing and customer query handling system.', '2024-05-10', 'deployed');

INSERT INTO Employee (Id, Name, Designation, Gender, Salary, Project_Id)
VALUES
(101, 'Archana', 'Software Engineer', 'F', 60000.00, 1),
(102, 'Smith', 'QA Engineer', 'M', 50000.00, 2),
(103, 'Kavin', 'DevOps Engineer', 'M', 65000.00, 3),
(104, 'Blessy', 'Project Manager', 'F', 75000.00, 4),
(105, 'Edwin', 'UI/UX Designer', 'M', 58000.00, NULL); -- Unassigned to project

INSERT INTO Task (Task_Id, Task_Name, Project_Id, Employee_Id, Status)
VALUES
(201, 'Design Database Schema', 1, 101, 'Assigned'),
(202, 'Develop Login Module', 5, 101, 'Started'),
(203, 'Write Test Cases', 2, 102, 'Assigned'),
(204, 'Setup CI/CD Pipeline', 3, 103, 'Completed'),
(205, 'Create Wireframes', 2, 105, 'Started');

SELECT * from Project
SELECT * from Employee
SELECT * from Task



