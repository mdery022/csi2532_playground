CREATE TABLE athletes (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    identified_gender CHAR(1),
    dob DATE NOT NULL
);

INSERT INTO athletes (id, name, identified_gender, dob) VALUES
(1, 'Andrew', 'm', '1975-12-01'),
(2, 'Ayana', 'f', '1998-06-11'),
(3, 'Hayden', 'm', '1996-07-24'),
(4, 'August', 'm', '1999-09-09');

