CREATE TABLE IF NOT EXISTS Students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) not null,
    surname VARCHAR(100) not null,
    year INT
);

CREATE OR REPLACE PROCEDURE add_student(p_student JSON)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO STUDENTS(id, name, surname, year)
    VALUES (
                (p_student->>'id')::INT,
                (p_student->>'name'),
                (p_student->>'surname'),
                (p_student->>'year')::INT
           );
END;
$$;

CALL add_student('{ "id": 4, "name": "Roman", "surname": "Shuhevich", "year": 1950 }');

select * from STUDENTS;
