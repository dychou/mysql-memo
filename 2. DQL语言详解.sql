-- 无条件查询(全查询):检索表中所有的数据
-- 语法结构:select 列名, 列名, 列名 from 表名;
-- 需求:查询stu表中所有学生的学号、姓名、年龄
select no, name, age from stu;

-- (1). 查询时我们可以对列中的数据进行四则运算
-- 需求: 查询stu表中所有学生的姓名和成绩(成绩+10分处理)
select name, score + 10 from stu;
-- 注意:null无法进行任何操作,任何对null值的处理得到的结果都是null

-- (2). 查询时我们还可以对列中的数据进行拼接的操作
-- 语法结构:concat(参数, 参数, 参数),将括号内的参数进行拼接
-- 需求:查询stu表中所有学生的学号、姓名、成绩(姓名后面拼接'是个好人')
select no, concat(name, '是个好人'), score from stu;
-- 注意:加号在MySQL中只表示求和,如果加号两端遇到文字,直接将文字当做0处理

-- (3). 在不修改查询结果的前提下, 可以将列名进行修改(列名起别名)
-- 语法结构:select 列名 as 别名, 列名 as 别名 from 表名;
-- 拓展:as可以省略

select no, concat(name, '是个好人') name, score from stu;
-- 注意:别名不需要添加单引号,因为别名不是数据,是列名

-- 有条件查询(过滤查询):检索表中满足条件的数据
-- 语法结构: select 列名, 列名, 列名 from stu where 条件
-- 需求:查询stu表中所有成年学生的学号,姓名和年龄
select no, name, age from stu where age >= 18;

-- (1). between .. and ..用法:判断某个区间
-- 语法结构: where 列名 between a and b, 判断列中的数据是否在a~b的范围之内
-- 语法结构: where 列名 not between a and b, 判断列中的数据是否不在a~b的范围之内
-- 需求:查询stu表中成绩在60-80之间的学生学号、姓名和成绩
select no, name, score from stu where score >= 60 and score <= 80;
select no, name, score from stu where score between 60 and 80;
select no, name, score from stu where score not between 60 and 80;

-- (2). in(..)用法:判断某个值
-- 语法结构:where 列名 in(a, b, c),表示判断列中数据是否等于a或者等于b或者等于c
-- 语法结构:where 列名 not in(a, b, c),表示判断列中数据是否不等于a或者不等于b或者不等于c
-- 需求:查询1班或者3班的所有学生学号、姓名和班级
select no, name, class from stu where class = 1 or class = 3;
select no, name, class from stu where class in(1, 3);

-- (3). null值的判断
-- 语法结构: where 列名 is null,判断该列数据为null
-- 语法结构: where 列名 is not null,判断该列数据不为null
select no, name, class from stu where class is not null;

-- 排序查询:对查询结果进行排序处理
-- 语法结构:order by 列名 asc/desc
-- asc: ascending, 升序
-- desc: descending, 降序
-- 需求:查询stu表中所有学生的姓名和成绩,并且按照成绩降序排序
select name, score from stu order by score desc;
-- 拓展:如果需要对数据进行升序排序,可以写asc或者直接省略(默认升序)

-- 模糊查询(关键字查询):根据某个关键字匹配数据
-- 语法结构: where 列名 like '匹配规则',判断列中是否包含指定关键字
-- 语法结构: where 列名 not like '匹配规则',判断列中是否不包含指定关键字

-- 匹配规则中有两种匹配符号分别为:
-- _ : 匹配一个长度的任意文字/数字/符号
-- % : 匹配任意长度(包含0个长度)的任意文字/数字/符号

-- 需求: 查询stu表中名字包含'老'字的学生学号、姓名和年龄
select no, name, age from stu where name not like '%老%';







