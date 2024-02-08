SELECT SUM(C.POPULATION)
FROM CITY C
INNER JOIN COUNTRY T
ON C.COUNTRYCODE = T.CODE
WHERE T.CONTINENT = 'Asia'