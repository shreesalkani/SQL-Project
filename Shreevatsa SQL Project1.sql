use hr;

-------#1 Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"------

select first_name as "First Name" , last_name as "Last Name" from hr.employees;


-----#2. Write a query to get unique department ID from employee table-------

select distinct(department_id) from hr.employees where department_id is not null;

-----#3. Write a query to get all employee details from the employee table order by first name, descending------

select * from hr.employees order by first_name desc;

-----#4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)------
select concat(first_name," ",last_name) as "Name", salary, salary* 0.15 as "PF" from hr.employees;

-----#5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary-------

select employee_id, concat(first_name," ",last_name) as "Name", salary from hr.employees order by salary;

-----#6. Write a query to get the total salaries payable to employees-------
select sum(salary) as "Total Salary"  from hr.employees;

-----#7. Write a query to get the maximum and minimum salary from employees table------
select max(salary) as "Maximun Salary", min(salary) as "Minimum Salary" from hr.employees;

-----#8. Write a query to get the average salary and number of employees in the employees table--------
select round(avg(salary),2) as "Average Salary", count(*) as "No. of Employees" from hr.employees;

-----#9. Write a query to get the number of employees working with the company--------
select count(*) as "No. of Employees" from hr.employees;

-----#10. Write a query to get the number of jobs available in the employees table------
select count(distinct(job_id)) as "No. of Jobs" from hr.employees;

-----#11. Write a query get all first name from employees table in upper case------
select upper(first_name) as "First Name" from hr.employees;

-----#12. Write a query to get the first 3 characters of first name from employees table-------
select substring(first_name,1,3) as "First 3 characters of first name" from hr.employees;

-----#13. Write a query to get first name from employees table after removing white spaces from both side-----
select trim(first_name) from hr.employees;

-----#14. Write a query to get the length of the employee names (first_name, last_name) from employees table-----
select first_name as "First Name", last_name as "Last Name", length(first_name)+length(last_name) as "Length of Name" from hr.employees;

-----#15. Write a query to check if the first_name fields of the employees table contains numbers-----
select * from hr.employees where first_name regexp '[0-9]';

-----#16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000-----
select concat(first_name," ",last_name) as "Name", salary from hr.employees where salary not between 10000 and 15000;

-----#17. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order-----
select concat(first_name," ",last_name) as "Name", department_id from hr.employees where department_id = 30 or department_id = 100 order by department_id;

-----#18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100-----
select concat(first_name," ",last_name) as "Name", salary, department_id from hr.employees where salary not between 10000 and 15000 and department_id = 30 or department_id = 100;

-----#19. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987-----
select concat(first_name," ",last_name) as "Name", hire_date as "Hire Date" from hr.employees where year(hire_date) like 1987;

------20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name-----
select first_name from hr.employees where first_name like '%b%c%';

-----#21. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000-----
select last_name, job_id, salary from hr.employees where job_id = 'IT_PROG' or job_id = 'SH_CLERK' and salary not in(4500,10000,15000);

-----#22. Write a query to display the last name of employees whose names have exactly 6 characters-----
select last_name as "Name" from hr.employees where length(last_name) = 6;

-----#23. Write a query to display the last name of employees having 'e' as the third character---------
select last_name as 'Name' from hr.employees where last_name like '__e%';

-----#24. Write a query to get the job_id and related employee's id-----
select job_id as "Job ID", group_concat(employee_id) as "Employee ID" from hr.employees group by job_id;

-----#25. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'------
update hr.employees set phone_number = replace(phone_number, '124', '999') where phone_number like '%124%';


-----#26. Write a query to get the details of the employees where the length of the first name greater than or equal to 8  ------
select * from hr.employees where length(first_name) >= 8;

------#27. Write a query to append '@example.com' to email field-----
update hr.employees set email = concat(email,'@example.com');

------#28. Write a query to extract the last 4 character of phone numbers-----
select right(phone_number,4) as "Phone Number" from hr.employees;

------#29. Write a query to get the last word of the street address-----
select street_address, substring_index(rtrim(street_address), ' ', -1) as "Last word of street address" from hr.locations;

------#30. Write a query to get the locations that have minimum street length------
select * from hr.locations where length(street_address) <= (select min(length(street_address)) from hr.locations);

------#31. Write a query to display the first word from those job titles which contains more than one words-----
select job_title, substr(job_title,1, instr(job_title, ' ')-1) from hr.jobs;

-----#32. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position------
select first_name as 'First Name', last_name as 'Last Name', length(first_name) as 'Length of First Name' from hr.employees where last_name like '__%c%';

-----#33. Write a query that displays the first name and the length of the first name for all employees whose 
#name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
#employees' first names-----
select first_name as 'First Name', length(first_name) as 'Length of First Name' from hr.employees where first_name like 'A%' or first_name like 'J%' or first_name like 'M%' order by first_name; 

-----#34. Write a query to display the first name and salary for all employees. Format the salary to be 10
#characters long, left-padded with the $ symbol. Label the column SALARY------
select first_name as "First Name", lpad(salary,10,'$') as 'Salary' from hr.employees;

-----#35. Write a query to display the first eight characters of the employees' first names and indicates the 
#amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
#descending order of salary-----

select left(first_name,8) as 'First Name', repeat('$', floor(salary/1000)) as 'Salary in $', salary from hr.employees;

-----#36. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year-----
select employee_id as 'ID', first_name as 'First Name', last_name as 'Last Name', hire_date as 'Hire Date' from hr.employees where hire_date like '%-%-07' or hire_date like '%-07-%';





#Northwind Database Exercises

------#1. Write a query to get Product name and quantity/unit-----

select ProductName as 'Product name', QuantityPerUnit as 'Quantity/unit' from northwind.products;

------#2. Write a query to get current Product list (Product ID and name)------
select concat(ProductID, ' : ', ProductName) as 'Current Product List' from northwind.products where Discontinued = 0 order by ProductName;

-----#3. Write a query to get discontinued Product list (Product ID and name)------
select concat(ProductID, ' : ', ProductName) as ' Discontinued Product List' from northwind.products where Discontinued = 1 order by ProductName;

-----#4. Write a query to get most expense and least expensive Product list (name and unit price)------
select ProductName as 'Product Name', round(UnitPrice,2) as 'Expenses' from northwind.products order by UnitPrice desc;

-----#5. Write a query to get Product list (id, name, unit price) where current products cost less than $20------
select ProductID, ProductName, round(UnitPrice,2) as 'Price'  from northwind.products where Discontinued = 0 and UnitPrice <20 order by UnitPrice desc;

------#6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25-----
select ProductID, ProductName, round(UnitPrice,2) as 'Price'  from northwind.products where UnitPrice between 15 and 25 and Discontinued = 0 order by UnitPrice desc;


-----#7. Write a query to get Product list (name, unit price) of above average price-----
select  distinct(ProductName) as 'Product Name', round(UnitPrice,2) as 'Unit Price' from northwind.products where UnitPrice > (select avg(UnitPrice) from northwind.products) order by UnitPrice;


-----#8. Write a query to get Product list (name, unit price) of ten most expensive products-----
select  distinct(ProductName) as 'Ten most expensive products', round(UnitPrice,2) as 'Unit Price' from northwind.products order by UnitPrice desc limit 10;

-----#9. Write a query to count current and discontinued products-----
select  count(ProductName) as "Product", Discontinued from northwind.products group by Discontinued;

------#10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order-----
select ProductName as 'Product Name', UnitsOnOrder, UnitsInStock  from northwind.products where discontinued = 0 and UnitsInStock < UnitsOnOrder;