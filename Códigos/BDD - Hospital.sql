/* Lógico_1: */

CREATE TABLE PACIENTE (
    id_paciente INT PRIMARY KEY,
    horario_entrada INT,
    cpf INT,
    carteira_identificacao INT,
    cep INT,
    bairro CHARACTER,
    logradouro CHARACTER,
    numero INT,
    cidade CHARACTER,
    idade INT,
    id_acompanhante INT,
    e_mail CHARACTER,
    fixo INT,
    celular INT,
    whatsapp INT,
    id_paciente INT,
    id_visitante INT,
    FK_ACOMPANHANTE_id_acompanhante INT
);

CREATE TABLE FUNCIONARIOS (
    id_funcionario INT,
    id_unidade INT,
    cpf INT,
    fixo INT,
    celular INT,
    whatsapp INT,
    e_mail CHARACTER,
    cep INT,
    bairro CHARACTER,
    logradouro CHARACTER,
    numero INT,
    cidade CHARACTER,
    pais CHARACTER,
    benificios CHARACTER,
    salario FLOAT,
    id_ala INT,
    id_funcionario_geral INT,
    id_funcionario INT,
    cargo CHARACTER,
    id_funcionario_saude INT,
    numero_registro INT,
    especializacao CHARACTER,
    FUNCIONARIOS_TIPO CHARACTER,
    id_terceirizado_geral INT,
    id_funcionario_geral INT,
    numero_contrato INT,
    clt FLOAT,
    id_clt_geral INT,
    numero_contarto INT,
    id_terceirizado_saude INT,
    id_funcionario_saude INT,
    id_clt_saude INT,
    PRIMARY KEY (id_funcionario, id_funcionario_geral, id_funcionario_saude, id_terceirizado_geral, id_clt_geral, id_terceirizado_saude, id_clt_saude)
);

CREATE TABLE FARMACIA (
    id_material INT,
    ml FLOAT,
    quantidade FLOAT,
    bula CHARACTER,
    nome_remedio CHARACTER,
    id_farmacia INT PRIMARY KEY,
    FK_MATERIAL_id_material INT
);

CREATE TABLE ACOMPANHANTE (
    cpf INT,
    cep INT,
    bairro CHARACTER,
    logradouro CHARACTER,
    numero INT,
    cidade CHARACTER,
    id_acompanhante INT PRIMARY KEY,
    id_paciente INT
);

CREATE TABLE UNIDADE (
    id_unidade INT PRIMARY KEY,
    id_paciente INT,
    id_especialidades INT,
    cep INT,
    nome_unidade CHARACTER,
    numero INT,
    logradouro CHARACTER,
    cidade CHARACTER,
    pais CHARACTER,
    id_equipamentos INT,
    cnpj INT,
    id_ala INT,
    numero_telefone INT,
    e_mail CHARACTER,
    celular_comercial INT,
    FK_PACIENTE_id_paciente INT,
    FK_FUNCIONARIOS_id_funcionario INT,
    FK_FUNCIONARIOS_id_funcionario_geral INT,
    FK_FUNCIONARIOS_id_funcionario_saude INT,
    FK_FUNCIONARIOS_id_terceirizado_geral INT,
    FK_FUNCIONARIOS_id_clt_geral INT,
    FK_FUNCIONARIOS_id_terceirizado_saude INT,
    FK_FUNCIONARIOS_id_clt_saude INT,
    FK_EQUIPAMENTOS_id_equipamento INT,
    FK_MATERIAL_id_material INT,
    FK_ALA_id_ala INT
);

CREATE TABLE EQUIPAMENTOS (
    id_equipamento INT PRIMARY KEY,
    nome_equipamento CHARACTER,
    forcenecedor_empresa CHARACTER,
    numero_equipamento INT,
    _relatorio_uso_ CHARACTER,
    id_unidade INT,
    id_funcionario INT,
    FK_FUNCIONARIOS_id_funcionario INT,
    FK_FUNCIONARIOS_id_funcionario_geral INT,
    FK_FUNCIONARIOS_id_funcionario_saude INT,
    FK_FUNCIONARIOS_id_terceirizado_geral INT,
    FK_FUNCIONARIOS_id_clt_geral INT,
    FK_FUNCIONARIOS_id_terceirizado_saude INT,
    FK_FUNCIONARIOS_id_clt_saude INT
);

CREATE TABLE ALA (
    id_ala INT PRIMARY KEY,
    id_unidade INT,
    especializacao CHARACTER,
    id_funcionario INT,
    id_paciente INT,
    id_equipamentos INT,
    especialidade CHARACTER,
    id_visitante INT,
    FK_EQUIPAMENTOS_id_equipamento INT,
    FK_FUNCIONARIOS_id_funcionario INT,
    FK_FUNCIONARIOS_id_funcionario_geral INT,
    FK_FUNCIONARIOS_id_funcionario_saude INT,
    FK_FUNCIONARIOS_id_terceirizado_geral INT,
    FK_FUNCIONARIOS_id_clt_geral INT,
    FK_FUNCIONARIOS_id_terceirizado_saude INT,
    FK_FUNCIONARIOS_id_clt_saude INT
);

CREATE TABLE MATERIAL (
    id_material INT PRIMARY KEY,
    id_fornecedor INT,
    nome_material CHARACTER,
    quantidade FLOAT,
    data_validade INT,
    descricao_produto CHARACTER,
    contra_indicacao CHARACTER,
    id_funcionario INT,
    id_unidade INT
);

CREATE TABLE FORNECEDOR (
    id_fornecedor INT PRIMARY KEY,
    nome_fornecedor CHARACTER,
    cnpj INT,
    fixo INT,
    celular INT,
    whatsapp INT,
    e_mail CHARACTER,
    contato CHARACTER
);

CREATE TABLE VISITANTE (
    id_paciente INT,
    bairro CHARACTER,
    numero INT,
    cep INT,
    cidade CHARACTER,
    logradouro CHARACTER,
    cpf INT,
    id_acompanhante INT PRIMARY KEY
);

CREATE TABLE utilizar (
    fk_MATERIAL_id_material INT,
    fk_FUNCIONARIOS_id_funcionario INT,
    fk_FUNCIONARIOS_id_funcionario_geral INT,
    fk_FUNCIONARIOS_id_funcionario_saude INT,
    fk_FUNCIONARIOS_id_terceirizado_geral INT,
    fk_FUNCIONARIOS_id_clt_geral INT,
    fk_FUNCIONARIOS_id_terceirizado_saude INT,
    fk_FUNCIONARIOS_id_clt_saude INT
);

CREATE TABLE fornecer (
    fk_MATERIAL_id_material INT,
    fk_FORNECEDOR_id_fornecedor INT
);

CREATE TABLE fornecer (
    fk_EQUIPAMENTOS_id_equipamento INT,
    fk_FORNECEDOR_id_fornecedor INT
);

CREATE TABLE acompanhar (
    fk_VISITANTE_id_acompanhante INT,
    fk_ALA_id_ala INT
);

CREATE TABLE visitar (
    fk_VISITANTE_id_acompanhante INT,
    fk_PACIENTE_id_paciente INT
);
 
ALTER TABLE PACIENTE ADD CONSTRAINT FK_PACIENTE_2
    FOREIGN KEY (FK_ACOMPANHANTE_id_acompanhante)
    REFERENCES ACOMPANHANTE (id_acompanhante)
    ON DELETE CASCADE;
 
ALTER TABLE FARMACIA ADD CONSTRAINT FK_FARMACIA_2
    FOREIGN KEY (FK_MATERIAL_id_material)
    REFERENCES MATERIAL (id_material)
    ON DELETE RESTRICT;
 
ALTER TABLE UNIDADE ADD CONSTRAINT FK_UNIDADE_2
    FOREIGN KEY (FK_PACIENTE_id_paciente)
    REFERENCES PACIENTE (id_paciente)
    ON DELETE RESTRICT;
 
ALTER TABLE UNIDADE ADD CONSTRAINT FK_UNIDADE_3
    FOREIGN KEY (FK_FUNCIONARIOS_id_funcionario, FK_FUNCIONARIOS_id_funcionario_geral, FK_FUNCIONARIOS_id_funcionario_saude, FK_FUNCIONARIOS_id_terceirizado_geral, FK_FUNCIONARIOS_id_clt_geral, FK_FUNCIONARIOS_id_terceirizado_saude, FK_FUNCIONARIOS_id_clt_saude)
    REFERENCES FUNCIONARIOS (id_funcionario, id_funcionario_geral, id_funcionario_saude, id_terceirizado_geral, id_clt_geral, id_terceirizado_saude, id_clt_saude)
    ON DELETE RESTRICT;
 
ALTER TABLE UNIDADE ADD CONSTRAINT FK_UNIDADE_4
    FOREIGN KEY (FK_EQUIPAMENTOS_id_equipamento)
    REFERENCES EQUIPAMENTOS (id_equipamento)
    ON DELETE RESTRICT;
 
ALTER TABLE UNIDADE ADD CONSTRAINT FK_UNIDADE_5
    FOREIGN KEY (FK_MATERIAL_id_material)
    REFERENCES MATERIAL (id_material)
    ON DELETE RESTRICT;
 
ALTER TABLE UNIDADE ADD CONSTRAINT FK_UNIDADE_6
    FOREIGN KEY (FK_ALA_id_ala)
    REFERENCES ALA (id_ala)
    ON DELETE RESTRICT;
 
ALTER TABLE EQUIPAMENTOS ADD CONSTRAINT FK_EQUIPAMENTOS_2
    FOREIGN KEY (FK_FUNCIONARIOS_id_funcionario, FK_FUNCIONARIOS_id_funcionario_geral, FK_FUNCIONARIOS_id_funcionario_saude, FK_FUNCIONARIOS_id_terceirizado_geral, FK_FUNCIONARIOS_id_clt_geral, FK_FUNCIONARIOS_id_terceirizado_saude, FK_FUNCIONARIOS_id_clt_saude)
    REFERENCES FUNCIONARIOS (id_funcionario, id_funcionario_geral, id_funcionario_saude, id_terceirizado_geral, id_clt_geral, id_terceirizado_saude, id_clt_saude)
    ON DELETE CASCADE;
 
ALTER TABLE ALA ADD CONSTRAINT FK_ALA_2
    FOREIGN KEY (FK_EQUIPAMENTOS_id_equipamento)
    REFERENCES EQUIPAMENTOS (id_equipamento)
    ON DELETE RESTRICT;
 
ALTER TABLE ALA ADD CONSTRAINT FK_ALA_3
    FOREIGN KEY (FK_FUNCIONARIOS_id_funcionario, FK_FUNCIONARIOS_id_funcionario_geral, FK_FUNCIONARIOS_id_funcionario_saude, FK_FUNCIONARIOS_id_terceirizado_geral, FK_FUNCIONARIOS_id_clt_geral, FK_FUNCIONARIOS_id_terceirizado_saude, FK_FUNCIONARIOS_id_clt_saude)
    REFERENCES FUNCIONARIOS (id_funcionario, id_funcionario_geral, id_funcionario_saude, id_terceirizado_geral, id_clt_geral, id_terceirizado_saude, id_clt_saude)
    ON DELETE RESTRICT;
 
ALTER TABLE utilizar ADD CONSTRAINT FK_utilizar_1
    FOREIGN KEY (fk_MATERIAL_id_material)
    REFERENCES MATERIAL (id_material)
    ON DELETE RESTRICT;
 
ALTER TABLE utilizar ADD CONSTRAINT FK_utilizar_2
    FOREIGN KEY (fk_FUNCIONARIOS_id_funcionario, fk_FUNCIONARIOS_id_funcionario_geral, fk_FUNCIONARIOS_id_funcionario_saude, fk_FUNCIONARIOS_id_terceirizado_geral, fk_FUNCIONARIOS_id_clt_geral, fk_FUNCIONARIOS_id_terceirizado_saude, fk_FUNCIONARIOS_id_clt_saude)
    REFERENCES FUNCIONARIOS (id_funcionario, id_funcionario_geral, id_funcionario_saude, id_terceirizado_geral, id_clt_geral, id_terceirizado_saude, id_clt_saude)
    ON DELETE SET NULL;
 
ALTER TABLE fornecer ADD CONSTRAINT FK_fornecer_1
    FOREIGN KEY (fk_MATERIAL_id_material)
    REFERENCES MATERIAL (id_material)
    ON DELETE RESTRICT;
 
ALTER TABLE fornecer ADD CONSTRAINT FK_fornecer_2
    FOREIGN KEY (fk_FORNECEDOR_id_fornecedor)
    REFERENCES FORNECEDOR (id_fornecedor)
    ON DELETE SET NULL;
 
ALTER TABLE fornecer ADD CONSTRAINT FK_fornecer_1
    FOREIGN KEY (fk_EQUIPAMENTOS_id_equipamento)
    REFERENCES EQUIPAMENTOS (id_equipamento)
    ON DELETE RESTRICT;
 
ALTER TABLE fornecer ADD CONSTRAINT FK_fornecer_2
    FOREIGN KEY (fk_FORNECEDOR_id_fornecedor)
    REFERENCES FORNECEDOR (id_fornecedor)
    ON DELETE SET NULL;
 
ALTER TABLE acompanhar ADD CONSTRAINT FK_acompanhar_1
    FOREIGN KEY (fk_VISITANTE_id_acompanhante)
    REFERENCES VISITANTE (id_acompanhante)
    ON DELETE RESTRICT;
 
ALTER TABLE acompanhar ADD CONSTRAINT FK_acompanhar_2
    FOREIGN KEY (fk_ALA_id_ala)
    REFERENCES ALA (id_ala)
    ON DELETE SET NULL;
 
ALTER TABLE visitar ADD CONSTRAINT FK_visitar_1
    FOREIGN KEY (fk_VISITANTE_id_acompanhante)
    REFERENCES VISITANTE (id_acompanhante)
    ON DELETE RESTRICT;
 
ALTER TABLE visitar ADD CONSTRAINT FK_visitar_2
    FOREIGN KEY (fk_PACIENTE_id_paciente)
    REFERENCES PACIENTE (id_paciente)
    ON DELETE SET NULL;