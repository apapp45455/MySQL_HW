-- 1 顯示系統目前的日期並將表頭命名為”系統日期”。
select curdate() "系統日期";

-- 2 顯示所有員工之員工編號,姓名,薪資及將薪資增加15%並且以整數表示，並將表頭命名為”New Salary”。
select empno, ename, sal, round(sal * 1.15, 0) "New Salary"
from emp;

-- 3 接續第二題，增加一個資料項表頭命名為Increase (將New Salary 減掉 salary 的值)。
select empno, ename, sal, round(sal * 1.15, 0) "New Salary", round(sal * 1.15 - sal, 0) "Increase"
from emp;

-- 4 顯示員工的姓名,進公司日期,檢討薪資的日期(指在進公司工作六個月後的第一個星期一)，將該欄命名為 REVIEW，並自訂日期格式為：Sunday, the Seventh of September。(星期幾， 幾月幾日)。
select ename, hiredate, date_format(adddate(adddate(hiredate, interval 6 month), interval mod(7 - weekday(adddate(hiredate, interval 6 month)), 7) day) ,"%W, the %D of %M")"REVIEW"
from emp;

-- 5 顯示每位員工的姓名，資料項(MONTHS_WORKED):計算到今天為止工作了幾個月(將月數四捨五入到整數)
select ename, round(datediff(curdate(), hiredate)/365 * 12, 0) "MONTHS_WORKED"
from emp;

-- 6 顯示如下格式：<員工姓名> earns <薪水> monthly but wants <3倍的薪水>.並將表頭顯示為Dream Salaries。
select concat(ename, " earns ", sal, " monthly but wants ", sal * 3) "Dream Salaries"
from emp;

-- 7 顯示所有員工之姓名和薪資，設定薪資長度為15個字元並且在左邊加上$符號，將表頭命名為SALARY。
select ename, lpad(sal,15,"$") "SALARY"
from emp;

-- 8 顯示員工之姓名,進公司日期，資料項(DAY):顯示員工被雇用的那天為星期幾，並以星期一作為一週的起始日,依星期排序。
select ename, hiredate, weekday(hiredate)+1 "day"
from emp
order by day;

-- 9 顯示員工的姓名和名為COMM的欄位:顯示佣金額，如果該員工沒有賺取佣金則顯示"No Commission."。
select ename, ifnull(comm, "No Commission") "Comm"
from emp;

-- 10 顯示資料項命名為 EMPLOYEE_AND_THEIR_SALARIES 的資料來顯示所有員工之名字和薪資，且用星號來表示他們的薪資，每一個星號表示100元，並以薪資由高到低來顯示。
select concat(ename, REPEAT('*',ROUND(sal/100,0))) "EMPLOYEE_AND_THEIR_SALARIES"
from emp
order by sal DESC;