/* BDD - Pizzaria: */

CREATE TABLE Cliente_Cardapio (
    id_cliente INT,
    nome CHARACTER,
    CPF INT,
    complemento INT,
    numero INT,
    logradouro CHARACTER,
    bairro CHARACTER,
    cidade CHARACTER,
    id_pedido INT,
    id_cardapio INT,
    id_funcionario INT,
    id_cardapio INT,
    pizza_doce CHARACTER,
    pizza_salgada CHARACTER,
    bebida CHARACTER,
    preco FLOAT,
    sobremesa CHARACTER,
    id_cliente INT,
    id_produto INT,
    PRIMARY KEY (id_cliente, id_cardapio)
);

CREATE TABLE Funcionario (
    id_funcionario INT,
    nome CHARACTER,
    cargo CHARACTER,
    logradouro CHARACTER,
    numero INT,
    complemento INT,
    bairro CHARACTER,
    cidade CHARACTER,
    id_cliente INT,
    id_contato INT,
    id_funcionario_clt INT,
    id_funcionario_pj INT,
    id_funcionario_clt INT,
    CPF INT,
    id_funcionario_pj INT,
    CNPJ INT,
    Funcionario_TIPO INT,
    PRIMARY KEY (id_funcionario, id_funcionario_clt, id_funcionario_pj)
);

CREATE TABLE Contato_funcionario (
    id_contato INT PRIMARY KEY,
    email_pessoal CHARACTER,
    telefone_principal INT,
    telefone_secundario INT,
    id_funcionario INT
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY,
    quantidade_de_itens INT,
    sabor CHARACTER,
    tamanho CHARACTER,
    borda_recheada CHARACTER,
    tipo_massa CHARACTER,
    ingrediente_extra CHARACTER,
    id_cliente INT
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome CHARACTER,
    codigo_de_barras INT,
    validade INT,
    ingredientes CHARACTER,
    id_cardapio INT
);

CREATE TABLE armazenar (
    fk_Funcionario_id_funcionario INT,
    fk_Funcionario_id_funcionario_clt INT,
    fk_Funcionario_id_funcionario_pj INT,
    fk_Contato_funcionario_id_contato INT
);

CREATE TABLE atendimento (
    fk_Cliente_Cardapio_id_cliente INT,
    fk_Funcionario_id_funcionario INT,
    fk_Funcionario_id_funcionario_clt INT,
    fk_Funcionario_id_funcionario_pj INT
);

CREATE TABLE conter (
    fk_Cliente_Cardapio_id_cliente INT,
    fk_Cliente_Cardapio_id_cardapio INT,
    fk_Produto_id_produto INT
);

CREATE TABLE realizar_pedido (
    fk_Pedido_id_pedido INT,
    fk_Cliente_Cardapio_id_cliente INT,
    fk_Cliente_Cardapio_id_cardapio INT
);
 
ALTER TABLE armazenar ADD CONSTRAINT FK_armazenar_1
    FOREIGN KEY (fk_Funcionario_id_funcionario, fk_Funcionario_id_funcionario_clt, fk_Funcionario_id_funcionario_pj)
    REFERENCES Funcionario (id_funcionario, id_funcionario_clt, id_funcionario_pj)
    ON DELETE RESTRICT;
 
ALTER TABLE armazenar ADD CONSTRAINT FK_armazenar_2
    FOREIGN KEY (fk_Contato_funcionario_id_contato)
    REFERENCES Contato_funcionario (id_contato)
    ON DELETE RESTRICT;
 
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_1
    FOREIGN KEY (fk_Cliente_Cardapio_id_cliente, ???)
    REFERENCES Cliente_Cardapio (id_cliente, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE atendimento ADD CONSTRAINT FK_atendimento_2
    FOREIGN KEY (fk_Funcionario_id_funcionario, fk_Funcionario_id_funcionario_clt, fk_Funcionario_id_funcionario_pj)
    REFERENCES Funcionario (id_funcionario, id_funcionario_clt, id_funcionario_pj)
    ON DELETE RESTRICT;
 
ALTER TABLE conter ADD CONSTRAINT FK_conter_1
    FOREIGN KEY (fk_Cliente_Cardapio_id_cliente, fk_Cliente_Cardapio_id_cardapio)
    REFERENCES Cliente_Cardapio (id_cliente, id_cardapio)
    ON DELETE RESTRICT;
 
ALTER TABLE conter ADD CONSTRAINT FK_conter_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE realizar_pedido ADD CONSTRAINT FK_realizar_pedido_1
    FOREIGN KEY (fk_Pedido_id_pedido)
    REFERENCES Pedido (id_pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE realizar_pedido ADD CONSTRAINT FK_realizar_pedido_2
    FOREIGN KEY (fk_Cliente_Cardapio_id_cliente, fk_Cliente_Cardapio_id_cardapio)
    REFERENCES Cliente_Cardapio (id_cliente, id_cardapio)
    ON DELETE SET NULL;