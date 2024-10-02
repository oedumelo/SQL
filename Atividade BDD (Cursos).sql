DROP DATABASE IF EXISTS db_academico;

CREATE DATABASE db_academico;

USE db_academico;

CREATE TABLE Alunos (
     id_aluno INT PRIMARY KEY AUTO_INCREMENT,
     nome_completo VARCHAR(100) NOT NULL,
     email_aluno VARCHAR(100) NOT NULL
);

INSERT INTO Alunos 
(nome_completo, email_aluno)
VALUES
('Pedro', 'pedro@pedro.com'),
('Eduardo', 'eduardo@eduardo.com'),
('Ana', 'ana@ana.com');

CREATE TABLE Disciplinas (
     id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
     nome_disciplina VARCHAR(100) NOT NULL,
     descricao_disciplina TEXT NOT NULL
);

INSERT INTO Disciplinas 
(nome_disciplina, descricao_disciplina)
VALUES
('Java', 'Curso de Java'),
('C#', 'Curso de C#'),
('Python', 'Curso de Python');

CREATE TABLE Inscricoes (
     id_inscricao INT PRIMARY KEY AUTO_INCREMENT,
     id_aluno INT NOT NULL,
     id_disciplina INT NOT NULL,
     nota_final DECIMAL(5,2) NOT NULL,
     FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
     FOREIGN KEY (id_disciplina) REFERENCES Disciplinas (id_disciplina)
);

INSERT INTO Inscricoes
(id_aluno, id_disciplina, nota_final)
VALUES
(1, 1, 7.5),
(1, 2, 8.5),
(1, 3, 9.5),
(2, 1, 9),
(2, 2, 8),
(2, 3, 7),
(3, 1, 7),
(3, 2, 8),
(3, 3, 9);

SELECT 
     COUNT(I.id_aluno) AS Total_Alunos,
     D.nome_disciplina AS Nome_Disciplina
FROM Inscricoes I
INNER JOIN Disciplinas D
ON I.id_disciplina = D.id_disciplina
GROUP BY I.id_disciplina;

SELECT 
     ROUND(AVG(I.nota_final), 2) AS Media_Notas,
     D.nome_disciplina AS Nome_Disciplina
FROM Inscricoes I
INNER JOIN Disciplinas D
ON I.id_disciplina = D.id_disciplina
GROUP BY I.id_disciplina;

SELECT 
     nome_completo AS Alunos
FROM Alunos 
ORDER BY nome_completo ASC;

SELECT 
     nome_disciplina AS Nome_Disciplina,
     descricao_disciplina AS Descricao_Disciplina
FROM Disciplinas 
ORDER BY nome_disciplina DESC;

SELECT 
     A.nome_completo AS Nome_Aluno,
     D.nome_disciplina AS Nome_Disciplina
FROM Inscricoes I
INNER JOIN Alunos A
ON I.id_aluno = A.id_aluno
INNER JOIN Disciplinas D
ON I.id_disciplina = D.id_disciplina;

TRUNCATE TABLE Inscricoes;

INSERT INTO Inscricoes
(id_aluno, id_disciplina, nota_final)
VALUES
(1, 2, 8.5),
(1, 3, 9.5),
(2, 2, 8),
(2, 3, 7);

SELECT 
     A.nome_completo AS Nome_Aluno,
     D.nome_disciplina AS Nome_Disciplina,
     I.id_inscricao AS Cod_Inscricao,
     I.nota_final AS Nota_Disciplina
FROM Alunos A
LEFT JOIN Inscricoes I
ON A.id_aluno = I.id_aluno
LEFT JOIN Disciplinas D
ON I.id_disciplina = D.id_disciplina
ORDER BY 1, 2;

SELECT 
     D.nome_disciplina AS Nome_Disciplina,
     A.nome_completo AS Nome_Aluno,
     A.email_aluno AS Email_Aluno
FROM Disciplinas D
LEFT JOIN Inscricoes I
ON I.id_disciplina = D.id_disciplina
LEFT JOIN Alunos A
ON A.id_aluno = I.id_aluno
ORDER BY 1, 2;
