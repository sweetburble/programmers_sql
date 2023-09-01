SET @user_num = (SELECT COUNT(USER_ID)
                FROM USER_INFO
                WHERE YEAR(JOINED) = '2021');
SELECT YEAR(O.SALES_DATE) AS YEAR, MONTH(O.SALES_DATE) AS MONTH, COUNT(DISTINCT(U.USER_ID)) AS PUCHASED_USERS, ROUND(COUNT(DISTINCT(U.USER_ID))/@user_num, 1) AS PUCHASED_RATIO
FROM USER_INFO U
INNER JOIN ONLINE_SALE O
ON U.USER_ID = O.USER_ID
WHERE YEAR(U.JOINED) = '2021'
GROUP BY YEAR, MONTH
ORDER BY YEAR ASC, MONTH ASC;
