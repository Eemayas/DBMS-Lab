CREATE TABLE payscale (
    position VARCHAR(50) PRIMARY KEY,
    salary BIGINT NOT NULL,
    grade char(1)
);

CREATE TABLE teacher (
    teacher_id int PRIMARY KEY,
    name varchar(100) NOT NULL,
    salary BIGINT NOT NULL,
    joining_date date,
    birthdate date,
    position varchar(50),
    FOREIGN KEY (position) REFERENCES payscale (position)
);

CREATE TABLE class (
    class_scheduleno int,
    teacher_id int,
    room_nuber int,
    PRIMARY KEY (class_scheduleno, room_nuber),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

INSERT INTO payscale
VALUES ("Professor", 50000, "A"),
    ("Assistant Professor", 45000, "B"),
    ("Lecturer", 40000, "B"),
    ("Associate Professor", 39000, "B"),
    ("Teaching Assistant", 35000, "C");

INSERT INTO teacher
VALUES (
        1,
        "Kathlin",
        50000,
        "2021-05-04",
        "1990-02-05",
        "Professor"
    ),
    (
        2,
        "James",
        45000,
        "2016-01-01",
        "1990-02-05",
        "Assistant Professor"
    ),
    (
        3,
        "Walter",
        350000,
        "2021-04-04",
        "1999-02-05",
        "Teaching Assistant"
    ),
    (
        4,
        "Richard",
        40000,
        "2018-05-04",
        "1950-02-05",
        "Lecturer"
    ),
    (
        5,
        "Frank",
        39000,
        "2005-05-04",
        "1989-02-05",
        "Associate Professor"
    );

INSERT INTO class
VALUES (1, 4, 204),
    (5, 2, 404),
    (4, 3, 402),
    (3, 1, 404),
    (2, 3, 308);
    
)
 select name from teacher
    where birthdate= (SELECT min(teacher.birthdate) from teacher)
    
    select name ,teacher_id from teacher
where salary<(select salary from teacher where name="Kathlin")

SELECT * from teacher where salary=(SELECT salary from teacher WHERE joining_date<"2010-12-31")


SELECT *
FROM teacher t1
WHERE t1.salary > (SELECT MAX(salary) FROM teacher WHERE position = 'Lecturer');

SELECT *
FROM teacher 
WHERE (salary,position) = (SELECT salary,position FROM teacher WHERE name="James");

SELECT *
FROM teacher 
WHERE teacher_id=(SELECT teacher_id from class);

SELECT name,payscale.salary,payscale.grade
FROM teacher 
JOIN payscale WHERE teacher.position=payscale.position;

SELECT class.class_scheduleno,teacher.name
FROM class
JOIN teacher WHERE teacher.teacher_id=class.teacher_id;

SELECT teacher_id,name,birthdate
FROM teacher
where DATEDIFF(day, '2050-07-27','2050-07-27'=0
               
               
               
CREATE VIEW viewdd as select teacher_id,name
FROM teacher
               
               SELECT position, COUNT(*) as count
FROM teacher
WHERE position IN ( 'Assistant Professor')
GROUP BY position