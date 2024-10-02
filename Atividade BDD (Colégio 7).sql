CREATE DATABASE colegio;
USE colegio;
 
CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT
);
 
CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    disciplina VARCHAR(100)
);
 
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100),
    professor_id INT,
    FOREIGN KEY (professor_id)
        REFERENCES professores (id_professor)
);
 
CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    curso_id INT,
    FOREIGN KEY (aluno_id)
        REFERENCES alunos (id_aluno),
    FOREIGN KEY (curso_id)
        REFERENCES cursos (id_curso),
    data_matricula DATE
);
 
INSERT INTO alunos (nome, idade) VALUES
('Eduardo', 21),
('Ana', 19),
('Mariana', 22),
('Gustavo', 21),
('Fernanda', 18);
 
INSERT INTO professores (nome, disciplina) VALUES
('Roni', 'Banco de Dados'),
('Paulo', 'Criatividade'),
('Rafaella', 'Engenharia de Requisitos');
 
INSERT INTO cursos (nome_curso, professor_id) VALUES
('Banco de Dados', 1),
('Criatividade', 2),
('Engenharia de Requisitos', 3),
('Coding', 1);
 
INSERT INTO matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2024-10-01'),
(2, 1, '2024-10-02'),
(1, 2, '2024-10-01'),
(3, 2, '2024-10-03'),
(2, 3, '2024-10-04'),
(3, 1, '2024-10-05');
