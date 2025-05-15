# 🐾 Prova Prática SENAI - Projeto SQL: PetShop

Este projeto foi desenvolvido como parte de uma **avaliação prática no curso técnico do SENAI**. O objetivo foi simular a estrutura e a manipulação de dados de um sistema de banco de dados para uma empresa fictícia do ramo **PetShop**.

---

## 📌 Objetivo

Construir e manipular um banco de dados completo com base em um cenário real, utilizando comandos e conceitos avançados de **SQL Server**, incluindo:

- Criação de tabelas e relacionamentos
- Inserção e consulta de dados
- Views, CTEs, funções, procedures, triggers e loops

---

## 🛠️ Tecnologias Utilizadas

- **SQL Server**
- **SSMS (SQL Server Management Studio)**

---

## 🐶 Estrutura do Banco de Dados:

### 🏗️ Parte 1 – Criação e Inserção de Dados

Tabelas criadas:

- `Veterinarios`
- `Tosadores`
- `Funcionarios`
- `Clientes`
- `AnimaisCadastrados`

Cada tabela foi populada com dados realistas, considerando turnos, CPF, sexo, salários, e informações dos animais e donos.

---

## 🧠 Parte 2 – Comandos Avançados

### 🔎 Views

- `vw_animais_clientes`: exibe a relação entre animais e seus respectivos donos.

### 🧩 Subqueries

- Consulta de funcionários **masculinos** que trabalham no turno da **noite**.

### 📊 CTE (Common Table Expression)

- Consulta específica para identificar os **veterinários** que também estão registrados na tabela de funcionários.

### 📈 Window Function (com `SUM`)

- Cálculo da **soma dos salários** de todos os veterinários.

### 🧮 Funções (`FUNCTION`)

- `ConsultasPorFuncionario(@ID_Fun)`: retorna nome, CPF, turno, sexo e salário com base no ID do funcionário.

### 🧨 Triggers

- `Deletar_Cliente`: impede a exclusão de registros da tabela `Clientes`.

### ⚙️ Procedures

- `sp_inserir_clientes`: procedimento para **inserir novos clientes** no sistema.

### 🔁 Loop

- Atualiza todos os `Tosadores` que trabalham à **noite** para o turno da **tarde**, usando um loop `WHILE`.

---

---

## ✍️ Aprendizados

- Prática intensiva de modelagem de banco de dados relacional
- Uso de recursos avançados do SQL Server
- Organização de código SQL de forma modular
- Simulação de cenários do mundo real em um contexto empresarial

