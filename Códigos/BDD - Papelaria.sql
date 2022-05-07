/* Lógico_1: */

CREATE TABLE Produtos (
    tipo CHARACTER,
    preco FLOAT,
    marca CHARACTER,
    codigo_de_barras REAL,
    id_produtos REAL PRIMARY KEY,
    id_fornecedor REAL,
    id_pedido REAL,
    estoque REAL,
    nome_produto CHARACTER,
    fk_Pedido_Carrinho_id_pedido REAL
);

CREATE TABLE Cliente (
    id_cliente REAL PRIMARY KEY,
    nome CHARACTER,
    cpf_ REAL,
    logradouro CHARACTER,
    numero_ REAL,
    cep REAL,
    bairro CHARACTER,
    complemento CHARACTER,
    telefone REAL,
    fk_Pedido_Carrinho_id_pedido REAL
);

CREATE TABLE Pedido_Carrinho (
    quantidade REAL,
    id_produtos REAL,
    id_cliente REAL,
    id_pedido REAL PRIMARY KEY,
    id_entrega REAL
);

CREATE TABLE Fornecedor (
    id_fornecedor REAL PRIMARY KEY,
    nome_fornecedor CHARACTER,
    cnpj REAL,
    contrato CHARACTER,
    telefone REAL,
    id_produtos REAL
);

CREATE TABLE Caixa (
    id_caixa REAL PRIMARY KEY,
    debito FLOAT,
    credito FLOAT,
    pix FLOAT,
    dinheiro FLOAT,
    boleto FLOAT,
    total_preco FLOAT,
    id_funcionario REAL,
    fk_Pedido_Carrinho_id_pedido REAL,
    fk_Funcionarios_id_funcionario REAL
);

CREATE TABLE Entrega (
    prazo REAL,
    id_pedido REAL,
    frete FLOAT,
    id_entrega REAL PRIMARY KEY,
    fk_Pedido_Carrinho_id_pedido REAL
);

CREATE TABLE Cargo_Funcionarios (
    id_cargo REAL,
    departamento CHARACTER,
    Salario FLOAT,
    id_funcionario REAL,
    idade REAL,
    logradouro CHARACTER,
    numero REAL,
    cep REAL,
    bairro CHARACTER,
    complemento CHARACTER,
    telefone REAL,
    email CHARACTER,
    whatsapp REAL,
    id_funcionario REAL,
    cpf REAL,
    nome CHARACTER,
    id_caixa REAL,
    id_cargo REAL,
    id_contrato REAL,
    PRIMARY KEY (id_cargo, id_funcionario)
);

CREATE TABLE Contrato (
    id_funcionario REAL PRIMARY KEY,
    ferias REAL,
    fgts FLOAT,
    13°salario FLOAT,
    jornada_trab_ REAL,
    vale_transporte FLOAT,
    indenizacao FLOAT,
    licenca_mater__pater_ FLOAT,
    seguro_desemprego FLOAT,
    avisio_previo CHARACTER
);

CREATE TABLE fornecimento (
    fk_Fornecedor_id_fornecedor REAL,
    fk_Produtos_id_produtos REAL
);

CREATE TABLE combinado (
    fk_Cargo_Funcionarios_id_cargo REAL,
    fk_Cargo_Funcionarios_id_funcionario REAL,
    fk_Contrato_id_funcionario REAL
);
 
ALTER TABLE Produtos ADD CONSTRAINT FK_Produtos_2
    FOREIGN KEY (fk_Pedido_Carrinho_id_pedido)
    REFERENCES Pedido_Carrinho (id_pedido)
    ON DELETE NO ACTION;
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_Pedido_Carrinho_id_pedido)
    REFERENCES Pedido_Carrinho (id_pedido)
    ON DELETE NO ACTION;
 
ALTER TABLE Caixa ADD CONSTRAINT FK_Caixa_2
    FOREIGN KEY (fk_Pedido_Carrinho_id_pedido)
    REFERENCES Pedido_Carrinho (id_pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Caixa ADD CONSTRAINT FK_Caixa_3
    FOREIGN KEY (fk_Funcionarios_id_funcionario)
    REFERENCES ??? (???);
 
ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_2
    FOREIGN KEY (fk_Pedido_Carrinho_id_pedido)
    REFERENCES Pedido_Carrinho (id_pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE fornecimento ADD CONSTRAINT FK_fornecimento_1
    FOREIGN KEY (fk_Fornecedor_id_fornecedor)
    REFERENCES Fornecedor (id_fornecedor)
    ON DELETE RESTRICT;
 
ALTER TABLE fornecimento ADD CONSTRAINT FK_fornecimento_2
    FOREIGN KEY (fk_Produtos_id_produtos)
    REFERENCES Produtos (id_produtos)
    ON DELETE RESTRICT;
 
ALTER TABLE combinado ADD CONSTRAINT FK_combinado_1
    FOREIGN KEY (fk_Cargo_Funcionarios_id_cargo, fk_Cargo_Funcionarios_id_funcionario)
    REFERENCES Cargo_Funcionarios (id_cargo, id_funcionario)
    ON DELETE SET NULL;
 
ALTER TABLE combinado ADD CONSTRAINT FK_combinado_2
    FOREIGN KEY (fk_Contrato_id_funcionario)
    REFERENCES Contrato (id_funcionario)
    ON DELETE SET NULL;