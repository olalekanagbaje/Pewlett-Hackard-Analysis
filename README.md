# **Pewlett-Hackard-Analysis**
## **Overview of the Analysis**

The purpose of this analysis is to provide a deep insight (investigation & evaluation) into the number of Pewlett-Hackard employees that will soon be retiring as well to identify those that will be eligible for a mentorship program in prepation for the "silver tsunami". Specifically, the analysis intends to provide insight to who will be retiring in the next few years and how many positions will the company need to fill as a result of this.

In order to provide this insight, my  analysis was tailored to;

  1. Create a report / table in the database that shows the number of retiring employees by title 
  2. Create a report / table in the databse that shows the number of employees eligible for the mentorship program

To generate these analysis, I utilized the following resources;

  - Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
  - Softwares: QuickDBD, PostgreSQL 11.X


  ## **Result**
  
Following the analysis of Pewlett-Hackard employee data, the following are some of the observable insights that I found;

 - _Total Unique Retiring Employees:_ _It was observed that a total of 90,398 employees out of the 300,024 workforce will be retiring. This number translates to a whooping 30.13% of the total employee workforce of Pewlett-Hackard. For an organization that is aiming to be future proof, it will take a major effort & program to replace these retiring employees._

  - _Breakdown of the Unique Retiring Employees:_ _From a further deep-dive of the list of retiring employees (referenced above), It was observed that about 63.79% (representing 29,414 Senior Engineers & 28,254 Senior Staff) belong to the senior management staff cadre whilst the remaining population (36.21%) belong to the middle-to-low employee cadre. Again this data reflects the enormity of the challenge that Pewlett-Hackard will be facing as the it strives to address this issue of retiring employees_ 

   - _Mentorship Eligibility Report:_ _A preview of the mentorship eligibility data shows that only about 1.71% (1,549) of the 90,398 retiring employees will be eligible partake in the program. This data again buttresses the enormity of the task ahead for Pewlett-Hackard_

   - _Breakdown of the Mentorship Eligibility Data:_ _Of the 1,549 current employees eligible for the mentorship program, about 70.88% (representing 569 Senior Staff & 529 Senior Engineer) belong to the senior management cadre whilst remaining 29.22% of the population belong to the middle-low cadre category. This data reflects almost the same pattern that was observed in the breakdown of the Unique Retiring Employees (i.e. in 2 above)_


     ## **Summary**
The following provides a high level response & queries to the questions raised below;

_1. How many roles will be filled as the "silver tsunami" begins: From the explanation provided in this challenge, the "silver tsunami" term applies to current employees that are approaching retirement age. The first of 2 queries highlighted below will generate a table (current_tsunami_emp) with a list of 72,458 current employees that will be affected the "silver tsunami". Pewlett-Hackard will need to make strong plans to replace these 72,458 employees as they approach retirement age.The second query will generate a breakdown by role category, the 72,458 current employees that are approaching retirement (see the screen shot below)._ 

_**Query 1:**_

_SELECT DISTINCT ON (emp_no) emp_no,
              first_name,
              last_name,
              title,
			  to_date_

_INTO current_tsunami_emp_			  

_FROM retirement_titles_

_WHERE to_date = '9999-01-01'_ 

_ORDER BY emp_no ASC;_


_**Query 2:**_

_SELECT COUNT(emp_no), title_

_FROM current_tsunami_emp_

_GROUP BY title_

_ORDER BY COUNT(emp_no) DESC;_

_2. Are there enough qualified retirement ready employees in the department to mentor the next generation of employees: The query highlighted below will generate a report of 1,549 eligible employees for the mentorship program. This figure represents only about 1.71% of the total retiring employees (90,398) pool OR 2.14% of the current employees (72,458) that will be affected by the "silver tsunami". Either way, this data shows that the pool of eligible employees for the mentorship program is inadequate to mentor the next generation of Pewlett-Hackard employees. (See screen shot below). Perhaps, Pewlett-Hackard may need to lower the eligibility criteria for the mentorship program in order to accommodate more employees_

_**Query:**_

_SELECT COUNT(emp_no), title_

_FROM mentorship_eligibility_

_GROUP BY title_

_ORDER BY COUNT(emp_no) DESC;_
