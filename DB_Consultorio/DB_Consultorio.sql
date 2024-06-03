create database Db_Consultorio;
/*Selecionando tabela para uso*/
use Db_Consultorio;
/*Criando tabela paciente*/
create table Tb_Paciente(
	Id_Paciente int auto_increment not null,
    Nome_Paciente varchar(100) not null, /*Aceita numeros e letras*/
    Data_Nascimento_Paciente date not null, /*Modelo americano ano/mês/dia*/
    Genero_Paciente enum('Masculino', 'Feminino', 'Nao-Binario', 'Transsexual'),
    Cpf_Paciente varchar(14),
    constraint Pk_Id_Paciente primary key (Id_Paciente) /*Primary key*/
    );

describe tb_Paciente; /* exibir a estrutura da tabela */
/* inserindo valores na tabela */

insert into Tb_Paciente (Nome_Paciente, Data_Nascimento_Paciente, Genero_Paciente, Cpf_Paciente) 
values('Roberto Carlos','1941-04-19', 'Masculino', '286.559.908-45'), 
	('Matuê','1993-10-11', 'Masculino', '888.899.085-55'),
    ('Pedro Paulo Soares Pereira','1970-04-22', 'Masculino', '283.560.978-95'),
    ('Clarice Lispector','1920-12-10', 'Feminino', '231.522.212-12'),
    ('Senior Abravanel','1930-12-12', 'Masculino', '230.335.212-14');
    
select * from tb_Paciente; /* exibe os dados inseridos na tabela */

create table Tb_Medico(
	Id_Medico int auto_increment not null,
    Nome_Medico varchar(100) not null, /*Aceita numeros e letras*/
    CRM_Medico varchar (13) not null,
    Genero_Medico enum ('Masculino','Feminino','Nao-Binario','Transsexual'),
    Data_Nascimento_Medico date not null, /*Modelo americano ano/mês/dia*/
    Turno_Medico enum('Diurno', 'Noturno', 'Vespertino') not null,
    Especialidade_Medico varchar(30) not null,
    constraint Pk_Id_Medico primary key (Id_Medico)
    );
    
describe tb_Medico;
    
insert into Tb_Medico (Nome_Medico, CRM_Medico, Genero_Medico, Data_Nascimento_Medico, Turno_Medico, Especialidade_Medico) 
values('Wender Marcolino', '2322-AC', 'Masculino', '1989-04-22', 'Diurno', 'Pediatra'),
	('Kássia Krishna', '23262-SP', 'Feminino', '1994-02-17', 'Noturno', 'Dentista'),
    ('Maria Aparecida Vieira', '2480-MG', 'Feminino', '1989-01-22', 'Vespertino', 'Enfermagem'),
    ('Enivaldo Marques', '2376-RS', 'Masculino', '1985-07-22', 'Diurno', 'Cirurgião'),
    ('Gustavo Marques', '2999-SP', 'Masculino', '2004-02-17', 'Vespertino', 'Cirurgião');
    
select * from tb_Medico;

create table Tb_Consulta(
	Id_Consulta int auto_increment not null,
    Data_Consulta date not null, /*Aceita numeros e letras*/
    Hora_Consulta time not null,
    Fk_Id_Paciente int not null,
    Fk_Id_Medico int not null,
    constraint Pk_Id_Consulta primary key (Id_Consulta),
    constraint Fk_Id_Medico foreign key (Fk_Id_Medico) references Tb_Medico (Id_Medico),
    constraint Fk_Id_Paciente foreign key (Fk_Id_Paciente) references Tb_Paciente (Id_Paciente)
    ); /* */
    
insert into Tb_Consulta (Data_Consulta, Hora_Consulta) 
values('2024-06-03', '13:00'),
	('2024-06-03', '13:30'),
    ('2024-06-03', '15:20'),
    ('2024-06-04', '17:00'),
    ('2024-06-04', '12:30');
    
drop table Tb_Consulta;

describe Tb_Consulta;

select Nome_Paciente, Data_Nascimento_Paciente from Tb_Paciente; /*Selecionando campos da tabela*/

alter table Tb_Paciente /* Alterar estrutura */
add column Convenio_Paciente varchar(50); /* Adicionando coluna */

describe Tb_Paciente;

update Tb_Paciente set Convenio_Paciente = 'Sirio Libanês' where Nome_Paciente = 'Roberto Carlos'; /*atualizando dados*/
update Tb_Paciente set Convenio_Paciente = 'Med Tour' where Nome_Paciente = 'Matuê';
update Tb_Paciente set Convenio_Paciente = 'NotreDame' where Nome_Paciente = 'Clarice Lispector';
update Tb_Paciente set Convenio_Paciente = 'Porto Seguro' where Id_Paciente = 5;

select * from Tb_Paciente;


alter table Tb_Paciente /* Alterar estrutura */
drop column Pk_Id_Paciente;

alter table Tb_Paciente /* Alterar estrutura */
add column Id_Paciente int auto_increment not null primary key;
alter table Tb_Consulta;

INSERT INTO Tb_Consulta(Data_Consulta, Hora_Consulta, Fk_Id_Paciente, Fk_Id_Medico) VALUES 
('2024-05-24', '10:50:10', 1, 1),
('2024-05-24', '14:50:10', 2, 2),
('2024-05-24', '12:50:10', 3, 3),
('2024-05-24', '09:50:10', 4, 4),
('2024-05-24', '06:50:10', 5, 5);

select * from tb_Consulta;
select * from Tb_Consulta as C 
join Tb_Paciente as P on C.Id_Consulta = P.Id_Paciente; 

select C.Data_Consulta, P.Nome_Paciente from Tb_Consulta as C
join Tb_Paciente as P on C.Id_Consulta = P.Id_Paciente;

/*Usando inner join*/

select C.Data_Consulta, P.Nome_Paciente, M.Nome_Medico from Tb_Consulta as C 
join Tb_Paciente as P
on C.Id_Consulta = P.Id_Paciente
join Tb_Medico as M
on C.Id_Consulta = M.Id_Medico
order by P.Nome_Paciente;

delete from Tb_Medico where Id_Medico = 2;
delete from Tb_Consulta where Id_Consulta = 2;
delete from Tb_Consulta where Fk_Id_Medico = 1;

