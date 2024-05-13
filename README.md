# ConsultorioMedico
#
## Diagrama Entidade-Relacionamento (ER) de um consultório médico

### Entidades Principais:
###### Pacientes: Representa os pacientes que visitam a clínica. Inclui atributos como nome, data de nascimento, endereço, etc;

###### Médicos: Representa os médicos que trabalham na clínica. Inclui atributos como nome, especialidade, CRM, etc;

###### Consultas: Representa as consultas agendadas entre pacientes e médicos. Inclui atributos como data, hora, paciente, médico, etc;

###### Prontuários: Inclui histórico de Pacientes e chave estrangeira do Pacientes;

###### Exame: Inclui atributos como nome do exame e a descrição;

###### Receita: Inclui atributos como a Descrição, chave estrangeira de Consulta;

###### E por fim, a entidade Medicamentos: contendo atributos como nome do remédio, dosagem e fabricante do mesmo.
