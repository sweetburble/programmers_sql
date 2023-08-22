SELECT C.CAR_ID, C.CAR_TYPE, TRUNCATE((C.DAILY_FEE * 30 * (1 - P.DISCOUNT_RATE/100)), 0) AS FEE
FROM CAR_RENTAL_COMPANY_CAR C
INNER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
ON C.CAR_TYPE = P.CAR_TYPE
WHERE 
    C.CAR_ID NOT IN (SELECT CAR_ID
                    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                    WHERE END_DATE >= '2022-11-01' 
                     AND START_DATE < '2022-12-01')
AND P.DURATION_TYPE = '30일 이상' AND C.CAR_TYPE REGEXP '세단|SUV' AND (C.DAILY_FEE * 30 * (1 - P.DISCOUNT_RATE/100)) BETWEEN 500000 AND 2000000
ORDER BY FEE DESC, C.CAR_TYPE ASC, C.CAR_ID DESC;