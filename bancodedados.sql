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

select * from gafanhotos;
update gafanhotos set nome = 'Aline', nascimento = '1982-10-31', sexo = 'F', peso = '49', altura = '1.67' where id = 2; -- alterar a linha 2 para aline.
-- Alterar tabela


desc pessoas; -- comando para descrever a estrutura da tabela
alter table pessoas rename to gafanhotos; -- comando para alterar o nome da tabela.

alter table pessoas add column profissao varchar(10); -- comando para adcionar coluna na tabela.
alter table pessoas drop column profissao; -- comando para eliminar uma coluna da tabela.
alter table pessoas add column profissao varchar(10) after nome; -- comando para adcionar coluna na tabela e escolher a posição.
alter table pessoas add column codigo int first; -- comando para colocar tabela na primeira posição.
UPDATE pessoas SET profissao = ' ' WHERE profissao IS NULL; -- comando para colocar ' ' como default
alter table pessoas modify column profissao varchar(20) not null default ' '; -- comando para alterar a estrutura de definição.
alter table pessoas change column profissao prof varchar(20); -- modificar o nome da coluna, aqui no caso de profissao para prof.

-- VAMOS CRIAR UMA OUTRA TABELA COM ALGUMAS CONSTRAINTS NOVAS.

create table if not exists cursos ( -- criar tabela so se não existir
	nome varchar(30) not null unique, -- unique não é chave primaria, mas não vai deixar colocar dois cursos com o mesmo nome.
    descricao text, -- text é uma descrição, é para textos longos.
    carga int unsigned, -- unsigned significa sem sinal vai economizar 1 bit para cada registro que tem a carga registrada.
    totaulas int unsigned,
    ano year default '2016' -- se não colocar o ano, o default vai ser 2016.
    ) default charset = utf8mb4;
    alter table cursos add column idcurso int FIRST; -- adcionar o idcurso poir esqueci, no primeiro campo da tabela.
    alter table cursos add primary key(idcurso); -- colocar primary key na tabela idcurso.
    desc cursos;

-- Manipulando registros

-- Desativar a opção STRICT_TRANS_TABLES
SET @@GLOBAL.sql_mode = 'NO_ENGINE_SUBSTITUTION';
SET @@SESSION.sql_mode = 'NO_ENGINE_SUBSTITUTION';

INSERT INTO cursos (idcurso, nome, descricao, carga, totaulas, ano) VALUES
('1','Mysql', 'Curso de Mysql com Guanabara.', 40, 20, 2023),
('2','HTML5', 'Aprenda a criar páginas web usando HTML e CSS.', 60, 30, 2018),
('3','JavaScript', 'Explore conceitos avançados de JavaScript para desenvolvimento web.', 50, 25, 2022),
('4','Big Data', 'Curso abrangente sobre manipulação de grande quantidade de dados.', 45, 22, 2019),
('5','Python para Ciência de Dados', 'Utilize Python para análise de dados e machine learning.', 55, 28, 2021),
('6','Desenvolvimento web', 'Construa aplicativos móveis usando React Native.', 70, 35, 2019),
('7','Inteligência Artificial', 'Curso introdutório sobre IA e suas aplicações.', 60, 30, 2023),
('8','Segurança da Informação', 'Aprenda práticas de segurança para proteger sistemas e dados.', 50, 25, 2022),
('9','DevOps e Automação', 'Curso abordando práticas DevOps e automação de processos.', 55, 28, 2022),
('10','Desenvolvimento de Games', 'Crie jogos 2D e 3D utilizando a plataforma Unity.', 65, 32, 2023);

-- atualizar o nome da linha, quando fhouver um erro

update cursos set nome = 'HTML5' where idcurso = 1;
update cursos set nome = 'Algoritmos' where idcurso = 2;
update cursos set nome = 'PHP', ano = '2015' where idcurso = 4;
update cursos set nome = 'Java', carga = '40',  ano = '2015' where idcurso = 5 limit 1; -- limit esse comando limita que a alteração seja posta a apenas 1 linha.
update cursos set descricao = 'Aprenda java rápido mané' where idcurso = 5 limit 1;
update cursos set descricao = 'caralho' where idcurso = 9;
update cursos set descricao = 'caralho' where idcurso = 10;

-- Apagar registros
delete from cursos where idcurso = '8';
delete from cursos where descricao = 'caralho' limit 2;

-- Apagar todos os registros de uma vez só
truncate cursos;

select * from cursos;


    

    
    