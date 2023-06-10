-- 1 顯示所有員工的最高、最低、總和及平均薪資，依序將表頭命名為 Maximum, Minimum, Sum和 Average，請將結果顯示為四捨五入的整數。
select round(max(sal), 0) "Maximum", round(min(sal), 0) "Minimum", round(sum(sal), 0) "Sum", round(avg(sal), 0) "Average"
from emp;

-- 2 顯示每種職稱的最低、最高、總和及平均薪水。
select job, max(sal), min(sal), sum(sal), avg(sal)
from emp
group by job;

-- 3 顯示每種職稱的人數。
select job, count(*)
from emp
group by job;

-- 4 顯示資料項命名為Number of Managers來表示擔任主管的人數。
select count(distinct mgr) "Number of Managers"
from emp;

-- 5 顯示資料項命名為DIFFERENCE的資料來表示公司中最高和最低薪水間的差額。
select max(sal) - min(sal) "DIFFERENCE"
from emp;

-- 6 顯示每位主管的員工編號及該主管下屬員工最低的薪資，排除沒有主管和下屬員工最低薪資少於1000的主管，並以下屬員工最低薪資作降冪排列。
select mgr ,min(sal)
from emp
where mgr is not null
group by mgr
having min(sal) > 1000
order by min(sal) desc;

-- 7 顯示在2010,2011,2012,2013年進公司的員工數量，並給該資料項一個合適的名稱。
select year(hiredate) "Year", count(*) "employees' number"
from emp
where year(hiredate) in (2010, 2011, 2012, 2013)
group by year(hiredate);