-- Criar um Banco de Datos

create database cadastro
default character set utf8mb4 -- colocar no padrão brasileiro
default collate utf8mb4_general_ci;

-- Criar uma tabela desse Banco de Dados

create table pessoas (
	id int not null auto_increment, -- chave primária, não pode ser nulo e incrementar um numero caso nada for digitado
	nome varchar(30) not null, -- nenhum nome pode ficar vazio
    nascimento date, -- cadastrar data de nascimento
    sexo enum('M','F'), -- enum especifica masculino ou feminino
    peso decimal(5,2), -- aqui o 5,2 siginifica 5 numeros e 2 casas decimais
    altura decimal(3,2), -- 3 numeros com duas casas decimais
    nacionalidade varchar(20) default 'Brasil', -- especifiquei o Brasil como default
    primary key (id)
    ) default charset = utf8mb4;
    
-- Inserindo Dados na Tabela


    
    