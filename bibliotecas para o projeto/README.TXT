**JasViewer**

Getting Started:

    java -jar Jasviewer.jar -h

 1 - Althought this is graphical application, connection to database is done throw arguments example "java -jar JasViewer.jar -c jdbc:odbc:DSNAME" (hint create a shortcut with the parameters to the database connection)
 2 - Press File > Open 
 3 - Select your .jasper file
 4 - Fill the parameters
 5 - See your report, if you want you can export it to pdf, xls, odt, word and many other formats


Dynamic Parameters (Single Select):

On ireport create a new parameter for your report, goto properties of the parameter and add a property with the name "query_sql", and the property value with your sql query, your query must return 2 columns the first will be the the value and the second the description and example of it would be "SELECT idcar, license_plate FROM cars ORDER BY license_plate"

So for the table Cars

idcar | license_plate
---------------------
    1 | 12-43-re
    2 | 23-tr-99
    3 | 54-ee-65

and Persons

idperson|name       | idcar
---------------------------
      1 | Jack      |    2
      2 | Marie     |    3
      3 | Jonh      |    1


The user would be asked to select on of the license_plates from a combobox the value returned from the parameter will be the idcar.

So for your report query you would have something like:

SELECT * FROM persons WHERE idcar = $P{sql_Car};

Giving you a list of persons associated with a car.




license GPL

jasviewer@gmail.com

