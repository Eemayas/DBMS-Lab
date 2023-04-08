--@blockname
drop DATABASE prashant_school;

--@blockname
create DATABASE if not exists prashant_school;

--@blockname
use prashant_school;

--@blockname
SELECT DB_show();

--@blockname
CREATE table payscale(
    position varchar(50) PRIMARY key,
    salary int,
    grade char(1) NOT NULL
);

create table teachers (
    teacher_id int primary key,
    teacher_name varchar(50),
    salary int,
    joining_date date,
    birthdate date,
    position varchar(50),
    FOREIGN key (position) REFERENCES payscale(position) on update cascade on delete cascade
);

create table class (
    class_scheduleno int,
    teacher_id int,
    room_no int,
    primary key (class_scheduleno, room_no),
    FOREIGN key (teacher_id) REFERENCES teachers(teacher_id) on update cascade on delete cascade
);

--@blockname
INSERT INTO payscale
VALUES ("Lecturer", 80000, "B"),
    ("Associate Professor", 100000, "A"),
    ("Assistant Professor", 90000, "A"),
    ("Professor", 150000, "A"),
    ("Curriculum Developer", 75000, "D"),
    ("Educational Administrator", 100000, "C"),
    ("Education Consultant", 100000, "C"),
    ("Teaching Assistant", 70000, "B"),
    ("Dean", 200000, "D");

INSERT INTO teachers
values (
        1,
        "Harper Thompson",
        80000,
        '2013-02-20',
        '1985-07-21',
        "lecturer"
    ),
    (
        2,
        "Malik Patel",
        100000,
        "2012-05-11",
        "1988-03-12",
        "Associate Professor"
    ),
    (
        3,
        "Savannah Rodriguez",
        90000,
        "2010-12-03",
        "1963-11-29",
        "Assistant Professor"
    ),
    (
        4,
        "Leo Wong",
        150000,
        "2009-07-18",
        "1982-09-06",
        "Professor"
    ),
    (
        5,
        "Ram Singh",
        75000,
        "2012-03-29",
        "1992-12-05",
        "Curriculum Developer"
    ),
    (
        6,
        "Kathlin",
        100000,
        "2012-09-05",
        "1963-05-18",
        "Educational Administrator"
    ),
    (
        7,
        "Amara Johnson",
        100000,
        "2010-08-22",
        "1994-02-10",
        "Education Consultant"
    ),
    (
        8,
        "Ava Davis",
        70000,
        "2010-11-16",
        "1995-06-30",
        "Teaching Assistant"
    ),
    (
        9,
        "James",
        90000,
        "2013-01-08",
        "1983-10-26",
        "Assistant Professor"
    ),
    (
        10,
        "Owen Garcia",
        200000,
        "2012-06-30",
        "1987-01-17",
        "Dean"
    ),
    (
        11,
        "Janesh",
        100000,
        "2016-01-01",
        "1992-08-11",
        "Associate Professor"
    );

Insert into class
values (1, 3, 209),
    (2, 7, 300),
    (3, 8, 301),
    (4, 4, 205),
    (5, 10, 106),
    (6, 1, 309),
    (7, 11, 104),
    (8, 2, 207),
    (9, 5, 309),
    (10, 9, 201);

--@blockname
SELECT teacher_name
from teachers
where birthdate =(
        SELECT min(birthdate)
        from teachers
    );

--@blockname
SELECT teacher_id,
    teacher_name
from teachers
where salary <(
        SELECT salary
        from teachers
        where teacher_name = "kathlin"
    );

--@blockname
SELECT *
from teachers
where salary = any (
        SELECT salary
        from teachers
        where joining_date < "2010-12-31"
    );

--@blockname
SELECT *
from teachers
where salary > any (
        SELECT salary
        from teachers
        where position = "lecturer"
    );

--@blockname
SELECT *
from teachers
where salary > all (
        SELECT salary
        from teachers
        where position = "lecturer"
    );
    


--@blockname
SELECT *
from teachers
where salary = (
        SELECT salary
        from teachers
        where teacher_name like "James"
    )
    and position = (
        SELECT position
        from teachers
        where teacher_name like "James"
    );

--@blockname
SELECT teacher_name
from teachers
    join class on teachers.teacher_id = class.teacher_id;

--@blockname
SELECT teacher_name,
    payscale.salary,
    payscale.grade
from teachers
    join payscale on teachers.position = payscale.position;

--@blockname
SELECT class.class_scheduleno,
    teachers.teacher_name
from teachers
    join class on class.teacher_id = teachers.teacher_id;

--@blockname
SELECT teacher_id,
    teacher_name,
    (60 - (datediff(curdate(), birthdate) / 365)) * 12 AS Months_to_retire
FROM teachers
WHERE 60 - (datediff(curdate(), birthdate) / 365) < 1;

--@blockname
SELECT *
from teachers
    join class;
    
--@blockname
create view view1 as
SELECT *
from teachers;

--@blockname
SELECT *
from view1;

--@blockname
Update teachers
set position = "Assistant professor",
    salary = 90000
Where teacher_name = "Harper Thompson";

--@blockname
select *
from teachers;

--@blockname
SELECT teacher_name,
    salary * (datediff(curdate(), joining_date) / 365) AS avg_salary_till_now
FROM teachers
WHERE teacher_name like "Janesh";

--@blockname
SELECT position,
    COUNT(teacher_id) AS counts
FROM teachers
WHERE position = "lecturer"
    OR position = "Assistant Professor"
    OR position = "Associate Professor"
    OR position = "Professor"
GROUP BY position;

--@blockname
drop DATABASE prashant_school;