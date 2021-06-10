# Admissions

You're asked by the Jarvard Medical School to write a BASH script to decide admissions. Here's the criteria their board has specified.

1. The strength of the application depends mainly on GPA and the grade given to the student's personal statement, each carrying equal weight (**NOTE**: GPA is out of 4 and statement grade is out of 5, so you can't just take their average or sum them!). If there is a tie, the student with the higher GPA should be picked.
2. Up to 20% of the admissions are allocated to the children of the school alumni.
3. Up to 10% of the seats go to students eligible under affirmative action. If a student qualifies under both alumni and affirmative action quotas, you need to assign them the alumni quota first.
4. The school does not discriminate based on age or gender.

Data will be provided to you in a file named **data** with the following columns:

1. Application ID
2. School GPA (out of 4)
3. Whether student has an alumni parent (T/F)
4. If the student is an exchange student (T/F)
5. If covered by affirmative action (T/F)
6. Male (M) or female (F)
7. Personal statement grade (out of 5)
8. If the student is a first-time applicant (T/F)
9. Age

A set of test data is provided in the **data** file with 1,000 entries, but your code should read all the entries in the file regardless of the number of entries (e.g., the real data may cover 10,000 entries). Also, you may use **test1()** in **test.sh** to check your implementation.

## Library (300 points)

Your job is to implement the admissions logic as a library function **admissions()** in **admissions.sh**, using the board's criteria. This should take the number of open spots as an argument and return a list of IDs of the admitted students.

## Extra Credit (200 points)

Implement **report.sh** to take the number of open spots as an argument, call **admissions()** to get the IDs of selected students, and print out their details as follows:

1. Order the students by their application IDs (e.g., 645332 should appear before 645340).
2. Print out the fields *application ID*, *school GPA*, *statement grade*, *if parent is an alumnus*, *if covered by affirmative action*, *whether a first-time applicant*, and *gender* (in that order) **as columns in a table**.
3. Boolean values like *if parent is an alumnus* should be shown as "Yes" or "No."
4. Gender should be printed as "M" or "F."
5. Write the test case **test2()** to check that your function is printing as required.
