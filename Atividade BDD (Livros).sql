CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(100)
);

CREATE TABLE membros (
    id_membro INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(100),
    telefone VARCHAR(50)
);

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(100),
    ano_publicacao INT(4),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT,
    id_membro INT,
    data_emprestimo DATE,
    data_devolucao DATE NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro),
    FOREIGN KEY (id_membro) REFERENCES membros(id_membro)
);

INSERT INTO autores (id_autor, nome) VALUES
(1, 'Machado de Assis'),
(2, 'Graciliano Ramos'),
(3, 'Clarisse Lispector'),
(4, 'Monteiro Lobato'),
(5, 'Nelson Rodrigues');

INSERT INTO livros (id_livro, titulo, ano_publicacao, id_autor) VALUES
(1, 'O Alienista', 1882, 1),
(2, 'Vidas Secas', 1938, 2),
(3, 'Laços de Família', 1960, 3),
(4, 'Sítio do Pica-Pau Amarelo', 1947, 4),
(5, 'O Pagador de Promessas', 1960, 5),
(6, 'Dom Casmurro', 1889, 1),
(7, 'Memórias de Cárcere', 1953, 2),
(8, 'Felicidade Clandestina', 1974, 3),
(9, 'Negrinha', 1920, 4),
(10, 'O Anjo Pornográfico', 1992, 5);

INSERT INTO membros (id_membro, nome, endereco, telefone) VALUES
(1, 'João da Silva', 'Rua A, 123', '(11) 91234-5678'),
(2, 'Maria Oliveira', 'Rua B, 456', '(11) 98765-4321'),
(3, 'Carlos Santos', 'Avenida C, 789', '(11) 99876-5432'),
(4, 'Ana Pereira', 'Rua D, 101', '(11) 92345-6789'),
(5, 'Luciana Costa', 'Praça E, 202', '(11) 93456-7890');

INSERT INTO emprestimos (id_emprestimo, id_livro, id_membro, data_emprestimo, data_devolucao) VALUES
(1, 1, 1, '2024-09-01', '2024-09-15'),
(2, 2, 2, '2024-09-02', '2024-09-16'),
(3, 3, 3, '2024-09-03', '2024-09-17'),
(4, 4, 4, '2024-09-04', '2024-09-18'),
(5, 5, 5, '2024-09-05', '2024-09-19');

UPDATE membros
SET endereco = 'Rua Nova, 321'
WHERE id_membro = 2;
