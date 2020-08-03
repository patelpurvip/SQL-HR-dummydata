# SQL Test Data

## Background
**This repository houses the data analysis for a fake SQL analysis exercise with the following prompt:**

It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

In this assignment, you will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, you will perform:

### 1) Data Modeling
Inspect the CSVs and sketch out an ERD of the tables.

### 2) Data Engineering
Use the information you have to create a table schema for each of the six CSV files, specifying data types, primary keys, foreign keys, and other constraints. Import each CSV file into the corresponding SQL table.

### 3) Data Analysis
Once a complete database is in place, do the following:
1. List the following details of each employee: employee number, last name, first name, gender, and salary.
2. List employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List all employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-----

## Iniitial Database Loading
Based on the provided information, I created the following ER Diagram:

![ERD](ERD.png)

### STEP 1: Create the database structure in PostgreSQL:
Running the `PPatel-SQLschema-code.sql` file will allow you to create the same database on a local version of Postgres. 

### STEP 2: Queries
After creating the structure, the source data tables can be imported directly into each of the 6 corresponding tables in Postgres.  Once the database has been loaded into all tables, you can run each of the queries contained in the  `PPatel-SQLanalysis-code.sql` file one-by-one, to answer questions 1-8 listed above.

> Before running the code, you will need to create a file entitled config.py to access the local Postgres database, with two lines of content, as follows:

> user = "YOUR USERNAME HERE"

> password = "YOUR PASSWORD HERE"


## Bonus Exercise
The exercise then provided the following additional prompt:
As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to do some additional analysis and generate a visualization of the data.
1. Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.
2. Create a histogram to visualize the most common salary ranges for employees.
3. Create a bar chart of average salary by title.

### Bonus Analysis
The bonus exercise is housed in the `SQLAlchemy-Additional-Analysis` file. The analysis generated the following visualizations:

![Histogram]()

![Bar]()

The histogram shows that the vast majority of salaries in the compay are in the lower tier of positions within the company.  However, the bar chart of average salary by title show much more uniform data across the entire range.  These two pieces of data taken together do not necessarily make sense together.  For example, Assistant Engineer, Engineer, and Senior Engineer positions all show the same average salaries.  Additionally, a position entitled "Senior Staff" has the same average salary as a position entitled "Staff".  


## Epilogue
PROMPT: Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

> the following query search in the database (SELECT * FROM employees WHERE emp_no = 499942;) returns an employee by the name of "April Foolsday"