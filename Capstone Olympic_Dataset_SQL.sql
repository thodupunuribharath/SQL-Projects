
create database olympics;
#creation of databse

use olympics;
#using database

#Quieries

#1) Find the average number of medals won by each country
SELECT 
    country,ROUND(AVG(total_medal)) as Average_medals
FROM
    olympics_table
GROUP BY country
order by Average_medals desc;


# It displays the Average medals(Total medals) won by each country in decending order.
#  ---> Zimbabwe is in top 1 with average of 4 medals , followed by Costa Rica with 2 medals
#  ---> There are no country with Zero medals.
#------------------------------------------------------------------------------


 #2) Display the countries and the number of gold medals they have won in decreasing order
 SELECT 
    country, SUM(gold_medal) as Number_of_gold_medals
FROM
    olympics_table
GROUP BY (country)
ORDER BY Number_of_gold_medals desc;
 
# It displays the summation medals won by each country in decending order specific to "Gold" .
#  ---> Germany is in top 1 with average of 223 medals , followed by canada Rica with 168 medals.
#  ---> There are few countries they have not got Gold medal at all.
#------------------------------------------------------------------------------
 
 #3) Display the list of people and the medals they have won in descending order, grouped by their country
 SELECT 
    name, country, sum(total_medal) AS Total_No_of_Medals
FROM
    olympics_table
GROUP BY (country)
ORDER BY Total_No_of_Medals DESC;
 
# It displays the name and country with age and thier total number of medals
#  --->Michael Phelps is in top 1 with 1312 medals and belongs to United States
#               (Michael Fred Phelps II is an American former competitive swimmer.)
#  --->Aleksey Nemov is in top 2 with 768 medals and belongs to Russia
#               (Alexei Yurievich Nemov is a former artistic gymnast from Russia)
#  --->  There are country with only single medal
#  ---> No single name available without getting medal
#------------------------------------------------------------------------------


 #4) Display the list of people with the medals they have won according to their age
 SELECT 
    name, country, age, sum(total_medal) AS Total_No_of_Medals
FROM
    olympics_table
GROUP BY (age)
ORDER BY Total_No_of_Medals DESC;


# It displays the name and country with age and thier total number of medals
#  --->Aleksey Nemov is in top 1 with 807 medals and belongs to Russia
#               (Alexei Yurievich Nemov is a former artistic gymnast from Russia)
#  --->Cindy Klassen is in top 2 with 765 medals and belongs to Canada
#               (Cindy Klassen, OM is a Canadian retired long track speed skater)
#  ---> We can see that most number of medals are with the age of 22-28 only
#  ---> It is giving the indication that more younger age participation in Olympics
#------------------------------------------------------------------------------
 
 
 
 #5) Which country has won the most number of medals (cumulative)
SELECT 
    country,
    SUM(total_medal) AS cummulative_medals
FROM
    olympics_table
GROUP BY country
ORDER BY cummulative_medals DESC;
 
# It displays the country with sum of total number of medals
#  --->United States is in top 1 with 1312 medals.
#  --->Russia is in top 2 with 766 medals.
#  ---> There are several countries with only one medal.
#------------------------------------------------------------------------------


/*
To understand the Noralization we have to understand the data properly for all columns.

Let us check for Normal forms.

1. First Normal Form:-
  Here we have to tacke the problem with atomicity, it basically means values inside tehe tables cannot be divided further.
  In general, a single cell cannot be repeated as multiple values. 
  Note : If the table containes a composite or multi valued attributes.
  It will violate the "First Normal Form"


There are few scenarios where few columns are combined and shows the values like Zip codes, Latlong of area. 
as it contains the more than one values it will not satisfy the first normal form.
In our case all the columns are in First normal form as it is satisfied.


2. Second Normal Form:- 
The first and foremost condition in the second NF is to satify the first normal form. 
The table also should not contain partial dependency.
It basically means the proper subset of candiate key determines a non- prime attributes.


In our dataset each name is having each values defined by the other columns. Thus name constitues our " candidate key"

Scenario1: 
We can say that age,sport,medals are all have partial dependency. It all depend on the name or name Id.
Hence we can make a seperate table containing all variables.

Scenario2: 
We also can say that Total medals are always dependent on Gold_medal, Silver_medal,Bronze_medal .
So we can have a seperate table to satisfy second normal form.


3. Third Normal Form:- 
In this also it shoul d satisfy the 2NF before going to 3NF.
Major important condition in the 3 normal form is to be no transitive dependency for the non prime attributes.
It is basically telling that non prime attributes cannot be dependant on other non prime attributes.
In a given table So a transitive dependancy is a functional dependancy in this X->Z (X determines Z) indirectly.
by virtue of x-->y and y-->z (where it is not the case with y->x)


So in our data there exists a transitive dependency we have to eliminate that by satisfying all the three Normal Forms.


We can check the tables from the attached ER diagram for better understanding. */



