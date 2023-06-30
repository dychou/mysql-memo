-- 什么是多表查询?
-- 将多张表关联后统一进行查询的行为称为多表查询

-- 语法结构:select 列名, 列名 from 表A join 表B on 关联条件;

-- 注意1:多表查询时,必须保证两张表能有关联,并且必须声明关联条件
-- 注意2:多表查询时,有列名在两张表中都出现(重名),通过表名.列名进行区分

-- 需求:查询所有员工的姓名、工资以及所在的部门名称
-- 分析:只要查询列中,或者条件中出现多张表中的字段,一定需要使用多表查询
select name, salary, deptname from emp join dept on 
emp.deptno = dept.deptno;

-- 根据多表查询的关联方式不同,多表查询共分为三种方式
-- 1. 内连接(inner join):只能查询到两张表中满足关联条件的数据(简写为join)
-- 需求:查询emp表和dept表中所有员工的姓名、工资和部门名称
select name, salary, deptname from emp inner join dept on emp.deptno = dept.deptno;

-- 2. 外连接(outer join):除了查询满足关联条件的数据之外,能够将额外的数据一起查询出来
-- (1). 左外连接(left outer join):简写为left join,查询满足关联条件的数据以及左表中额外的数据
select name, salary, deptname from emp left join dept on emp.deptno = dept.deptno;

-- (2). 右外连接(right outer join):简写为right join,查询满足关联条件的数据以及右表中额外的数据
select name, salary, deptname from emp right join dept on emp.deptno = dept.deptno;

-- (3). 满外连接(full outer join):很遗憾,MySQL并不支持满外连,Oracle支持
select name, salary, deptname from emp full outer join dept on emp.deptno = dept.deptno;

-- 注意:from后面的称为左表,join后面的称为右表

-- 3. 特殊连接:自连接
-- 特点:一张表完成多表查询的方式称为自连接(自己和自己关联)
-- 核心思想:通过给一张表声明不同的别名进行区分并关联
-- 需求:查询emp表中所有员工的姓名以及对应的领导姓名
select worker.name, leader.name from emp as worker join emp as leader on worker.manageno = leader.no;

-- 4. 特殊连接:多张表如何进行关联
/*
语法结构:
select 列名, 列名 from 表A join 表B
on 表A和表B的关联条件
join 表C
on 表A/表B和表C的关联条件
join 表D
on 表A/表B/表C和表D的关联条件
*/












