-- comentários
-- a linha abaixo cria um banco de dados

create database dbinfox;
use dbinfox;

-- o bloco de informações abaixo cria uma tabela

create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- descrição da tabela
desc tbusuarios;

-- a linha abaixo insere dados na tabela (CRUD)
-- create

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1, 'Pedro Heber', '9999999999','pedroheber','123456');

-- a linha abaixo retorna todos os dados na tabela
-- read
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2, 'Administrador', '9999999999','admin','admin');

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3, 'Bill Gates', '9999999999','bill','123456');

-- a linha abaixo modifica dados na tabela
-- update

update tbusuarios set fone='8888888888'
where iduser=2;

-- a linha abaixo apaga um usuário
-- delete

delete from tbusuarios where iduser=3;

create table tbclientes(
idclientes int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fone varchar(50) not null, 
email varchar(50)
);

alter table tbclientes
	change fone fonecli varchar(50) not null;
    
alter table tbclientes
	change email emailcli varchar(50) not null;

desc tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli) values('Linus Torvalds', 'Rua Tux, 2015', '9999999999','linus@linus.com');


select * from tbclientes;

-- relacionamento de tabelas

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp, -- puxa data e hora do servidor quando a os for criada
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(50),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idclientes)
);

desc tbos;


insert into tbos(equipamento, defeito,servico,tecnico,valor,idcli) values
('Notebook', 'Não liga', 'Troca da fonte', 'zé', 87.50, 1);

select * from tbos;

-- o codigo abaixo traz informações de duas tabelas

select o.os,equipamento,defeito,servico,valor,
c.nomecli,fonecli
from tbos as o
inner join tbclientes as c
on(o.idcli = c.idclientes);

select * from tbusuarios;

describe tbusuarios; 


-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;

update tbusuarios set perfil='admin' where iduser=1;
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;


describe tbusuarios;


desc tbos;
-- a linha abaixo altera a tabela adiionando o campo em uma determinada posição

alter table tbos add tipo varchar(15) not null after data_os;

alter table tbos add situacao varchar(20) not null after tipo;

-- a seleção abaixo seleciona e ordena por nome todos os clientes cadastrados
select * from tbclientes order by nomecli; 


-- o bloco de instruções abaixo faz a seleção e a união de dados das duas tabelas abaixo
-- oser é uma variavel que contém os campos desejados da tabela os
-- cli a outra variável que contém os campos desejados da tabela clientes

select
oser.os,data_os,tipo,situacao,equipamento,valor,
cli.nomecli,fonecli
from tbos as oser 
inner join tbclientes as cli 
on (cli.idclientes = oser.idcli);



select * from tbos where os = 2;