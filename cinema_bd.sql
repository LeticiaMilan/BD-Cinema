-- Database: Cinema_BD

-- DROP DATABASE IF EXISTS "Cinema_BD";

CREATE DATABASE "Cinema_BD"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE Cinema (
    ID_cinema SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Sala (
    ID_sala SERIAL PRIMARY KEY,
    capacidade INT NOT NULL,
    ID_cinema INT NOT NULL,
    FOREIGN KEY (ID_cinema) REFERENCES Cinema(ID_cinema)
);

CREATE TABLE Filme (
    ID_filme SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    duracao INTERVAL NOT NULL
);

CREATE TABLE Sessao (
    ID_sessao SERIAL PRIMARY KEY,
    horario TIMESTAMP NOT NULL,
    ID_sala INT NOT NULL,
    ID_filme INT NOT NULL,
    ingressos_disponiveis INT NOT NULL,
    FOREIGN KEY (ID_sala) REFERENCES Sala(ID_sala),
    FOREIGN KEY (ID_filme) REFERENCES Filme(ID_filme)
);

CREATE TABLE Cliente (
    ID_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Funcionario (
    ID_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);

CREATE TABLE Ingresso (
    ID_ingresso SERIAL PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL,
    ID_sessao INT NOT NULL,
    ID_cliente INT NOT NULL,
    FOREIGN KEY (ID_sessao) REFERENCES Sessao(ID_sessao),
    FOREIGN KEY (ID_cliente) REFERENCES Cliente(ID_cliente)
);

INSERT INTO Cinema (nome, endereco) VALUES
('Cineplex', 'Rua A, 123'),
('Cinemark', 'Avenida B, 456'),
('MovieMax', 'Rua C, 789'),
('CinemaCity', 'Avenida D, 1011'),
('CineStar', 'Rua E, 1213');

INSERT INTO Sala (capacidade, ID_cinema) VALUES
(100, 1),
(80, 1),
(120, 2),
(90, 2),
(110, 3);

INSERT INTO Filme (titulo, duracao) VALUES
('O Poderoso Chefão', INTERVAL '2 hours 55 minutes'),
('Titanic', INTERVAL '3 hours 14 minutes'),
('Star Wars: Episódio IV - Uma Nova Esperança', INTERVAL '2 hours 1 minute'),
('Jurassic Park', INTERVAL '2 hours 7 minutes'),
('O Rei Leão', INTERVAL '1 hour 58 minutes');

INSERT INTO Sessao (horario, ID_sala, ID_filme, ingressos_disponiveis) VALUES
('2024-03-27 15:00:00', 1, 1, 100),
('2024-03-27 18:00:00', 1, 2, 80),
('2024-03-28 17:30:00', 2, 3, 120),
('2024-03-28 20:00:00', 3, 4, 90),
('2024-03-29 14:00:00', 4, 5, 110);

INSERT INTO Cliente (nome, telefone) VALUES
('João', '(00) 0000-0001'),
('Maria', '(00) 0000-0002'),
('Pedro', '(00) 0000-0003'),
('Ana', '(00) 0000-0004'),
('Lucas', '(00) 0000-0005');

INSERT INTO Funcionario (nome, cargo) VALUES
('Carlos', 'Atendente'),
('Fernanda', 'Gerente'),
('Roberto', 'Bilheteiro'),
('Juliana', 'Limpeza'),
('Rafael', 'Segurança');

INSERT INTO Ingresso (tipo, ID_sessao, ID_cliente) VALUES
('inteira', 1, 1),
('inteira', 2, 2),
('meia', 3, 3),
('meia', 4, 4),
('inteira', 5, 5);

SELECT * FROM Funcionario;

SELECT * FROM Cliente;

SELECT * FROM Ingresso;

SELECT * FROM Sessao;

SELECT * FROM Filme;

SELECT * FROM Sala;

SELECT * FROM Cinema;