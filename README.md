BaltimoreHomicides
==================

Includes scripts searching a text file of Baltimore homicides for ages and cause of death.

##Data
The text file is called "homicides.txt."  Baltimpre homicides.zip is a zipped version of the data.  The data comes from the Baltimore Sun website: http://goo.gl/hSofH, and is a mixture of text, HTML, and JavaScript.  The goal of this project is to read the data into R, and extract information

##Instructions
ProgAssignment4.pdf includes instructions for the creation of the two functions.

##Functions
count.R takes in a cause of death and returns the number of homicides for that cause.  It will throw an error if an valid cause of death is not specified.  count.R uses regular expressions to take capitalization into consideration, but not misspellings.

agecount.R takes in an age (positive integer) and returns the number of victims of that age.

