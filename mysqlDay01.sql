USE myemployees;
#基本查询
SELECT last_name FROM employees;
SELECT last_name,salary FROM employees;
SELECT * FROM employees;
SELECT 100;
SELECT "john";
SELECT 100*98;
SELECT VERSION();
SELECT last_name AS 姓,first_name AS 名 FROM employees;
SELECT last_name 姓,first_name 名 FROM employees;
SELECT DISTINCT department_id FROM employees;
SELECT	CONCAT(last_name,first_name) AS 姓名 FROM employees;
SELECT	IFNULL(commission_pct,0) AS 奖金率,commission_pct
FROM employees;
SELECT CONCAT(last_name,',',first_name,',',IFNULL(commission_pct,0)) AS out_put FROM employees;

#逻辑查询
SELECT * FROM employees WHERE salary>12000;
SELECT last_name,`department_id` FROM employees WHERE `department_id`<>90;
SELECT last_name,salary,commission_pct FROM employees WHERE salary>=10000 AND salary<=20000;
SELECT last_name,salary,commission_pct FROM employees WHERE `department_id`<90 OR `department_id`>110 OR salary>15000;
SELECT last_name,salary,commission_pct FROM employees WHERE NOT(`department_id`>=90 AND `department_id`<=110) OR salary>15000;

#模糊查询
#员工名字包含字符a
SELECT * FROM employees WHERE last_name LIKE '%a%';
#员工名中第三个字符为a，第五个字符为a
SELECT last_name,salary FROM employees WHERE last_name LIKE '__n_1%'
#员工名中第二个字符为下划线的
SELECT last_name FROM employees WHERE last_name LIKE '_\_%';
#员工编号100-120
SELECT * FROM employees WHERE `employee_id`>=100 AND `employee_id`<=120;

SELECT * FROM employees WHERE `employee_id` BETWEEN 100 AND 120;
#工种编号是 IT_	PROG，AD_VP其中一个的员工信息
SELECT last_name,job_id FROM employees WHERE job_id IN('IT_PROT','AD_VP');
`employees`SELECT last_name,commission_pct FROM employees WHERE commission_pct IS NULL;
#查询员工号为176的员工的信息
SELECT `last_name`,`department_id`,`salary`*12*(IFNULL(`commission_pct`,0)) AS 年薪 FROM employees WHERE `employee_id` = 176;

#查询没奖金且工资小于18000
SELECT salary,last_name FROM employees WHERE `commission_pct` IS NULL AND salary<18000;
#查询表中job_id不为‘IT’或者工资为12000
SELECT * FROM employees WHERE `job_id`!='IT' OR salary=12000;
DESC departments;
SELECT DISTINCT location_id FROM `departments`;

#排序查询
SELECT * FROM employees ORDER BY salary DESC;

SELECT * ,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪 FROM employees ORDER BY salary*12*(1+IFNULL(commission_pct,0)) DESC;
SELECT * ,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪 FROM employees ORDER BY 年薪 DESC;

#根据姓名字节长度进行排序
SELECT LENGTH(`last_name`) AS 字节长度,`last_name`,`salary` FROM employees ORDER BY LENGTH(last_name) DESC;

#多个字段排序
SELECT* FROM employees ORDER BY salary ASC,`employee_id` DESC;

#字符函数
#upper,lower
SELECT	CONCAT(UPPER(last_name),LOWER(first_name)) AS 姓名 FROM employees;

#substr,substring
注意：索引从1开始
#截取索引处后面所有字符
SELECT SUBSTR('李莫愁爱上了陆展元',7) AS out_put;
#截取指定长度的字符
SELECT	SUBSTR('李莫愁爱上了陆展元',1,3) AS out_put;

#姓名首字母大写，其他字符小写，然后_拼接
SELECT CONCAT(UPPER(SUBSTR(`last_name`,1,1)),'_',LOWER(SUBSTR(`last_name`,2)))	 FROM employees;

#instr 返回子串第一次出现的索引，如果找不到返回0
SELECT INSTR('杨不悔爱上了殷六侠','殷六侠') AS out_put;

#trim 去除首位字符
SELECT LENGTH(TRIM('    张翠删      ')) AS out_put;
SELECT TRIM('a' FROM 'aaaaaaa张aaaaaaaaa翠山aaaaaaaaaaaaaa') AS out_put;

#lpad 用指定的字符实现左填充指定长度
SELECT LPAD('殷素素',10,'*') AS out_put;

