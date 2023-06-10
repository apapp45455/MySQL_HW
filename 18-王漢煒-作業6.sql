-- 1 顯示和Blake同部門的所有員工之姓名和進公司日期。
select ename, hiredate
from emp
where deptno = (select deptno 
				from emp 
				where ename = "Blake");

-- 2 顯示所有在Blake之後進公司的員工之姓名及進公司日期。
select ename, hiredate
from emp
where hiredate > (select hiredate
				  from emp
                  where ename = "Blake");

-- 3 顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到低排列。
select empno, ename, sal
from emp
where sal > (select sum(sal)/count(sal)
			 from emp)
order by sal desc;

-- 4 顯示和姓名中包含 T 的人在相同部門工作的所有員工之員工編號和姓名。
select empno, ename
from emp
where deptno in (select deptno
				from emp
				where ename like "%T%");

-- 5 顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。
select e.ename, e.deptno, e.job
from emp e join dept d on e.deptno = d.deptno
where d.loc = "Dallas";

-- 6 顯示直屬於”King”的員工之姓名和薪資。
select ename, sal
from emp
where mgr = (select empno
			from emp
            where ename = "King");

-- 7 顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。
select e.deptno, e.ename, e.job
from emp e join dept d on e.deptno = d.deptno
where d.dname = "Sales";

-- 8 顯示薪資比公司平均薪資還要高且和名字中有 T 的人在相同部門上班的所有員工之員工編號,姓名和薪資。
select empno, ename, sal
from emp
where  sal > (select sum(sal)/count(sal)
			 from emp)
	and deptno in (select deptno
					from emp
					where ename like "%T%");
                                                
-- 9-1 顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。
select e1.ename, e1.deptno, e1.sal
from emp e1
where (deptno, sal) in (select deptno, sal
						from emp e2
						where comm > 0 and e1.empno <> e2.empno);

-- 9-2 顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。
-- select e.ename, e.deptno, e.sal
-- from emp e join (select *
-- 				from emp
-- 				where comm > 0) d 
-- 			on e.ename <> d.ename and e.deptno = d.deptno and e.sal = d.sal;

-- 9-3 顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。
-- select e1.ename, e1.deptno, e1.sal
-- from emp e1 join emp e2 on e2.comm > 0 and e1.empno <> e2.empno and e1.sal = e2.sal and e1.deptno = e2.deptno;

-- 10 顯示和在Dallas工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。
select e1.ename, e1.deptno, e1.sal
from emp e1
where  (e1.sal, ifnull(e1.comm, 0)) in (select e2.sal, ifnull(e2.comm, 0)
										from emp e2 join dept d on e2.deptno = d.deptno
										where d.loc = "Dallas" and e1.ename <> e2.ename);

-- 11 顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在結果中顯示Scott的資料)
select e1.ename, e1.hiredate, e1.sal
from emp e1
where (e1.sal, ifnull(e1.comm, 0)) in (select e2.sal, ifnull(e2.comm, 0)
										from emp e2
										where ename = "Scott" and e1.ename <> e2.ename);

-- 12 顯示薪資比所有職稱是”Clerk”還高的員工之姓名,進公司日期和薪資，並將結果依薪資由高至低顯示。
select ename, hiredate, sal
from emp
where sal > all (select sal
				from emp
                where job = "Clerk")
order by sal desc;