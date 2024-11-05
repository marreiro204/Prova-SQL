CREATE DATABASE PetShop -- DATABASE PARA UM EMPRESA DE PETSHOP

---- PARTE 1 CRIA��O DAS TABELAS DO BANCO DE DADOS ----
USE PetShop
-- CRIA��O DA TABELA DE VETERINARIOS DA EMPRESA
CREATE TABLE Veterinarios(
ID_Fun VARCHAR(20),
nome VARCHAR (50),
crm VARCHAR (12),
cpf VARCHAR (14),
turno VARCHAR (6),
sexo VARCHAR (2)
)
-- VALORES E INFORMA��ES INSERIDOS NA TABELA VETERINARIOS
INSERT INTO  Veterinarios (ID_Fun, nome, crm, cpf, turno,sexo) VALUES
('1', 'Cleiton Xavier', '12345678910', '23414165235', 'Manha', 'M'),
('2', 'Dandara Santos', '43645678910', '44514165235', 'Tarde', 'F'),
('3', 'Mateus Silva', '12345234910', '42514786235', 'Tarde', 'M'),
('4', 'Rian Oliveira', '17345678239', '98714165235', 'Noite', 'M'),
('5', 'Silmara Flores', '31345978910', '21454165235', 'Noite', 'F')

SELECT* FROM Veterinarios
DROP TABLE Veterinarios

DROP TABLE Veterinarios
-- CRIA��O DA TABELA DE TOSADORES DA EMPRESA
CREATE TABLE Tosadores(
ID_Fun VARCHAR(20),
nome VARCHAR (50),
cpf VARCHAR (14),
turno VARCHAR (6),
sexo VARCHAR (2)
)
DROP TABLE Tosadores
SELECT*FROM Tosadores
-- VALORES E INFORMA��ES INSERIDOS NA TABELA TOSADORES
INSERT INTO Tosadores (ID_Fun, nome,cpf, turno,sexo) VALUES
('10', 'Charles Xavier', '39824165235', 'Manha', 'M'),
('20', 'Luana Martins', '27414208435', 'Tarde', 'F'),
('30', 'Gabriel Eduardo','23984195235', 'Tarde', 'M'),
('40', 'Lucas Marreiro', '70414164535', 'Noite', 'M'),
('50', 'Leticia Bufoni', '98614208235', 'Noite', 'F')

-- CRIA��O DA TABELA DE FUNCIONARIOS DA EMPRESA
CREATE TABLE Funcionarios(
ID_Fun VARCHAR(20),
nome VARCHAR (50),
cpf VARCHAR (14),
turno VARCHAR (6),
sexo VARCHAR (2),
salario INT
)
select*from Funcionarios
-- VALORES E INFORMA��ES INSERIDOS NA TABELA FUNCIONARIOS
INSERT INTO Funcionarios(ID_Fun, nome,cpf, turno,sexo, salario) VALUES
('1', 'Cleiton Xavier','23414165235', 'Manha', 'M', 5000),
('2', 'Dandara Santos','44514165235', 'Tarde', 'F', 4500),
('3', 'Mateus Silva','42514786235', 'Tarde', 'M', 5100),
('4', 'Rian Oliveira','98714165235', 'Noite', 'M', 7000),
('5', 'Silmara Flores','21454165235', 'Noite', 'F', 8000),
('10', 'Charles Xavier', '39824165235', 'Manha', 'M', 2000),
('20', 'Luana Martins', '27414208435', 'Tarde', 'F', 2100),
('30', 'Gabriel Eduardo','23984195235', 'Tarde', 'M', 3000),
('40', 'Lucas Marreiro', '70414164535', 'Noite', 'M', 2100),
('50', 'Leticia Bufoni', '98614208235', 'Noite', 'F', 3000)
DROP TABLE Funcionarios

-- CRIA��O DA TABELA DE ANIMAIS CADASTRADOS DA EMPRESA
CREATE TABLE AnimaisCadastrados(
ID_Anm VARCHAR(20),
ID_Cliente VARCHAR (20),
nome VARCHAR (50),
Tipo VARCHAR (25),
Ra�a VARCHAR (25),
sexo VARCHAR (2)
)
select*from AnimaisCadastrados
-- VALORES E INFORMA��ES INSERIDOS NA TABELA DE ANIMAIS CADASTRADOS
INSERT INTO AnimaisCadastrados (ID_Anm, ID_Cliente, nome, Tipo, Ra�a, sexo) VALUES
('100', '1', 'Bob', 'Cachorro', 'Golden Retrivier', 'M'),
('101', '2', 'Olivia', 'Cachorro', 'Pitbull', 'F'),
('102', '1', 'Noha', 'Gato', 'Feilicious ray', 'M'),
('103', '3', 'Hulk', 'Cachorro', 'Labrador', 'M'),
('104', '2', 'Napole�o', 'Cachorro', 'Dalm�ta', 'M')

-- CRIA��O DA TABELA DE CLIENTES DA EMPRESA
CREATE TABLE Clientes(
ID_Cliente VARCHAR (20),
cpf VARCHAR (14),
nome VARCHAR (50),
Qtd_Animais_Cadastrados INT,
Endere�o VARCHAR (200),
sexo VARCHAR (2)
)
select*from Clientes
-- VALORES E INFORMA��ES INSERIDOS NA TABELA DE CLIENTES
INSERT INTO Clientes (ID_Cliente, cpf, nome, Qtd_Animais_Cadastrados, Endere�o,sexo) VALUES
('1', '32726828615', 'Claudia Santos', 2, 'Rua Coelho Lousada 144', 'F'),
('2', '86426828705', 'Romeu Garcia', 2, 'Rua Barbosa de Freitas 2004', 'M'),
('3', '47526828305', 'Caike Neves', 1, 'Rua Parvati 374', 'M')

---- PARTE 2 IMPLEMENTA��O DE FUN��ES  ----

--- VIEWS ---

--- CRIANDO UMA VIEW PARA EU CONSEGUIR CONSULTAR O DONO DO ANIMAL PELO ID DO CLIENTE QUE EST� PRESENTA NAS TABELAS CLIENTES E ANIMAIS CADASTRADOS
CREATE OR ALTER VIEW vw_animais_clientes AS
SELECT 
AC.nome AS 'Nome do animal',
AC.Tipo,
AC.Ra�a,
Clientes.nome AS 'Nome do dono'
FROM AnimaisCadastrados AS AC
INNER JOIN Clientes ON Clientes.ID_Cliente = AC.ID_Cliente

SELECT * FROM vw_animais_clientes

---  Subqueries ---

--- CRIANDO UMA SUBQUERIE PARA SABER OS FUNCION�RIOS MASCULINOS QUE TRABALHAM NO TURNO DA NOITE

SELECT *
FROM Funcionarios 
WHERE turno IN (
SELECT turno
FROM Funcionarios 
WHERE turno = 'NOITE' AND sexo = 'M')

--- CRIANDO UMA CTE PARA------

WITH Funcion�riosMasculinoVet AS (
SELECT 
Funcionarios.ID_Fun,
Funcionarios.nome,
Funcionarios.turno,
Funcionarios.sexo
FROM Funcionarios
INNER JOIN Veterinarios ON Veterinarios.ID_vet = Funcionarios.ID_Fun

)

---- Window Functions ----
--- FUN��O PARA SABER O SALARIO DOS VETREIN�RIOS
SELECT 
veterinarios.nome,
SUM(salario) AS '  SALARIO DOS VETERIN�RIOS'
FROM Funcionarios
INNER JOIN veterinarios ON veterinarios.ID_Fun = Funcionarios.ID_Fun
GROUP BY veterinarios.nome



------------ FUNCTIONS -------------
--- FUN��O CRIADA PARA SABER O NOME, O CPF, TURNO, SEXO E SAL�RIO DO FUNCION�RIO PELO ID, EXEMPLO: SE VOC� QUER SABER DO FUNCION�RIO COM ID 1 ELE VAI TRAZER ESSAS INFORMA��ES SOMENTE DELE
CREATE FUNCTION ConsultasPorFuncionario (@ID_Fun INT)
RETURNS @TabelaConsulta TABLE (
ID_Fun VARCHAR(20),
nome VARCHAR (50),
cpf VARCHAR (14),
turno VARCHAR (6),
sexo VARCHAR (2),
salario INT
)
AS

BEGIN 

INSERT INTO @TabelaConsulta
SELECT Funcionarios.ID_Fun, Funcionarios.nome,Funcionarios.cpf, Funcionarios.turno,Funcionarios.sexo,Funcionarios.salario
FROM Funcionarios
WHERE Funcionarios.ID_Fun = @ID_Fun;

RETURN;

END;
SELECT * FROM dbo.ConsultasPorFuncionario(1)


-------- TRIGGERS -------------
------ CRIEI UM TRIGGER COM UMA REGRA PARA QUE NINGU�M DA EMPRESA DELETE QUALQUER CLIENTE QUE SEJA
CREATE OR ALTER TRIGGER Deletar_Cliente
ON Clientes
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Esses dados n�o podem ser deletados'
END
GO

DELETE FROM Clientes
WHERE ID_Cliente = 3

-------------- Procedures --------
--------- procedure para adicionar clientes novos
CREATE PROCEDURE sp_inserir_clientes
@cpf VARCHAR (14),
@nome VARCHAR (50),
@Qtd_Animais_Cadastrados INT,
@Endere�o VARCHAR (200),
@sexo VARCHAR (2)
AS
BEGIN
    INSERT INTO Clientes ( cpf, nome, Qtd_Animais_Cadastrados, Endere�o,sexo)
    VALUES ( @cpf, @nome,@Qtd_Animais_Cadastrados,@Endere�o,@sexo)

	END
	EXEC sp_inserir_clientes 44512378923, mauro, 1, ruaboechat145, M

	select*from Clientes

