-- Criar um Banco de Datos

create database cadastro
default character set utf8mb4 -- colocar no padrão brasileiro
default collate utf8mb4_general_ci;

-- Criar uma tabela desse Banco de Dados

create table pessoas (
	id int not null auto_increment, -- chave primária, não pode ser nulo e incrementar um numero caso nada for digitado.
	nome varchar(30) not null, -- nenhum nome pode ficar vazio.
    nascimento date, -- cadastrar data de nascimento.
    sexo enum('M','F'), -- enum especifica masculino ou feminino.
    peso decimal(5,2), -- aqui o 5,2 siginifica 5 numeros e 2 casas decimais.
    altura decimal(3,2), -- 3 numeros com duas casas decimais.
    nacionalidade varchar(20) default 'Brasil', -- especifiquei o Brasil como default.
    primary key (id)
    ) default charset = utf8mb4;
    
-- Inserindo Dados na Tabela

-- Não precisa colocar o campo 'id' porque ele é chave primaria, ou seja o sistema vai colocar um numero automaticamente para ele.
insert into pessoas
-- (nome, nascimento, sexo, peso, altura, nacionalidade)
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Paulo', '1982-11-26', 'M', '80.5', '1.68', 'Brasil'),
(default, 'Ricardo', '1982-01-17', 'M', '100.2', '1.85', default),
(default,'Rosi', '1989-03-07', 'F', '49', '1.63', default);

-- ('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil'),
-- ('Maria', '1999-12-30', 'F', '55.2', '1.65', 'Portugal'),
-- (default,'Creuza', '1920-12-30', 'F', '58.5', '1.63', default);

-- posso simplificar caso eu não altere a posição dos nomes com o comando
-- insert into pessoas values
-- (default,'Adalgiza', '1930-11-02', 'F', '63.2', '1.75', 'Irlanda');

select * from pessoas;


    
    