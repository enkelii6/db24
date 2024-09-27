
create database lab2;

create table employees (
    employee_id serial primary key,
    first_name varchar,
    last_name varchar,
    department_id integer,
    salary integer
);

insert into employees (first_name, last_name, department_id, salary)
VALUES ('gleb', 'kukartsev', 1, 10000000);

insert into employees (first_name, last_name)
VALUES ('anuar', 'kunanbayev');

insert into employees (first_name, last_name, department_id, salary)
VALUES ('aza', 'kuanyshbayev', null, 0);

insert into employees (first_name, last_name, department_id, salary)
VALUES ('name_1', 'surname_1', 2, 100), ('name_2', 'surname_2', 3, 10), ('name_3', 'surname_3', 4, 1), ('name_4', 'surname_4', 4, 1), ('name_5', 'surname_5', 4, 1);

alter table employees alter first_name set default 'John';

insert into employees (last_name) values ('Snow');

insert into employees default values;

create table employees_archive as table employees;

update employees set department_id = 1 where department_id is null;

update employees set salary = salary * 1.15 returning first_name, last_name as "Updated Salary";

delete from employees where salary < 50000;

delete from employees_archive using employees where employees_archive.employee_id = employees.employee_id returning employees_archive.*;

delete from employees returning *;
