-- 1. база данных "University"
CREATE DATABASE IF NOT EXISTS University;
USE University;

-- 2. Таблица "Student"
CREATE TABLE Student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Sumame VARCHAR(100) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    tel VARCHAR(20),
    address VARCHAR(255)
);

-- 3. Таблица "Subject"
CREATE TABLE Subject (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Subject VARCHAR(100) NOT NULL
);

-- 4. Таблица "Marks" (оценки)
CREATE TABLE Marks (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    Mark INT NOT NULL,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES Subject(id) ON DELETE CASCADE
);

ALTER TABLE Marks 
ADD CONSTRAINT CHK_Mark CHECK (Mark BETWEEN 2 AND 5);

-- Студенты
INSERT INTO Student (Sumame, Name, tel, address) VALUES
('Иванов', 'Иван', '79101234567', 'д.78'),
('Петров', 'Петр', '79107654321', 'ул. Ленина, 1'),
('Сидоров', 'Сидор', NULL, 'д.78'),
('Алексеев', 'Алексей', '79109998877', 'пр. Мира, 10'),
('Борисов', 'Борис', '79105554433', 'д.78');

-- Предметы
INSERT INTO Subject (Subject) VALUES
('Математика'),
('Физика'),
('Информатика'),
('Химия'),
('Литература');

-- Оценки
INSERT INTO Marks (student_id, subject_id, Mark) VALUES
(1, 1, 5), (1, 2, 4), (1, 3, 5),
(2, 1, 3), (2, 2, 4), (2, 3, 2),
(3, 1, 5), (3, 2, 5), (3, 3, 5),
(4, 1, 2), (4, 2, 3), (4, 3, 4),
(5, 1, 4), (5, 2, 4), (5, 3, 4);

SELECT * FROM Student;
SELECT * FROM Subject;
SELECT * FROM Marks;