/* Lógico_1: */

CREATE TABLE Cliente_Cardapio_Balcao_Entregador (
    id_cliente INT,
    nome CHARACTER,
    CPF INT,
    complemento INT,
    numero INT,
    logradouro CHARACTER,
    bairro CHARACTER,
    cidade CHARACTER,
    id_cardapio INT,
    id_balcao INT,
    id_cardapio INT,
    pizza_doce CHARACTER,
    pizza_salgada CHARACTER,
    bebida CHARACTER,
    preco FLOAT,
    sobremesa CHARACTER,
    id_cliente INT,
    id_produto INT,
    esfiha CHARACTER,
    id_balcao INT,
    caixa FLOAT,
    comanda INT,
    entra FLOAT,
    saida FLOAT,
    id_pedido INT,
    id_funcionario INT,
    id_funcionario_clt INT,
    id_funcionario_pj INT,
    id_entregador INT,
    id_cozinha INT,
    id_entregador INT,
    endereco_cliente INT,
    contato_cliente INT,
    pagamento FLOAT,
    PRIMARY KEY (id_cliente, id_cardapio, id_balcao, id_entregador)
);

CREATE TABLE Funcionario_Cargo (
    id_funcionario INT,
    nome CHARACTER,
    cargo CHARACTER,
    logradouro CHARACTER,
    numero INT,
    complemento CHARACTER,
    bairro CHARACTER,
    cidade CHARACTER,
    id_cliente INT,
    id_contato INT,
    id_funcionario_clt INT,
    id_funcionario_pj INT,
    id_cargo INT,
    id_funcionario_clt INT,
    CPF INT,
    id_funcionario_pj INT,
    CNPJ INT,
    Funcionario_TIPO CHARACTER,
    id_cargo INT,
    atendente CHARACTER,
    cozinheiro CHARACTER,
    guarconete CHARACTER,
    gerente CHARACTER,
    id_funcionario INT,
    PRIMARY KEY (id_funcionario, id_funcionario_clt, id_funcionario_pj, id_cargo)
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
    id_balcao INT,
    id_cozinha INT,
    comanda INT,
    fk_Cozinha_id_cozinha INT
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome CHARACTER,
    codigo_de_barras INT,
    validade INT,
    ingredientes CHARACTER,
    id_cardapio INT
);

CREATE TABLE Cozinha (
    id_cozinha INT PRIMARY KEY,
    id_pedido INT,
    preparacao CHARACTER,
    id_funcionario INT,
    id_funcionario_clt INT,
    id_funcionario_pj INT,
    id_balcao INT
);

CREATE TABLE armazenar (
    fk_Funcionario_Cargo_id_funcionario INT,
    fk_Funcionario_Cargo_id_funcionario_clt INT,
    fk_Funcionario_Cargo_id_funcionario_pj INT,
    fk_Contato_funcionario_id_contato INT
);

CREATE TABLE conter (
    fk_Cliente_Cardapio_Balcao_Entregador_id_cliente INT,
    fk_Cliente_Cardapio_Balcao_Entregador_id_cardapio INT,
    fk_Produto_id_produto INT
);

CREATE TABLE realizar_pedido (
    fk_Balcao_id_balcao INT,
    fk_Pedido_id_pedido INT
);

CREATE TABLE preparar_pedido (
    fk_Funcionario_Cargo_id_funcionario INT,
    fk_Funcionario_Cargo_id_funcionario_clt INT,
    fk_Funcionario_Cargo_id_funcionario_pj INT,
    fk_Funcionario_Cargo_id_cargo INT,
    fk_Cozinha_id_cozinha INT
);

CREATE TABLE organizar_pedido (
    fk_Funcionario_Cargo_id_funcionario INT,
    fk_Funcionario_Cargo_id_funcionario_clt INT,
    fk_Funcionario_Cargo_id_funcionario_pj INT,
    fk_Funcionario_Cargo_id_cargo INT,
    fk_Cliente_Cardapio_Balcao_Entregador_id_cliente INT,
    fk_Cliente_Cardapio_Balcao_Entregador_id_cardapio INT,
    fk_Cliente_Cardapio_Balcao_Entregador_id_balcao INT
);

CREATE TABLE enviar_para_retirada (
    fk_Cliente_Cardapio_Balcao_Entregador_id_cliente INT,
    fk_Cliente_Cardapio_Balcao_Entregador_id_cardapio INT,
    fk_Cliente_Cardapio_Balcao_Entregador_id_balcao INT,
    fk_Cliente_Cardapio_Balcao_Entregador_id_entregador INT,
    fk_Cozinha_id_cozinha INT
);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (fk_Cozinha_id_cozinha)
    REFERENCES Cozinha (id_cozinha)
    ON DELETE RESTRICT;
 
ALTER TABLE armazenar ADD CONSTRAINT FK_armazenar_1
    FOREIGN KEY (fk_Funcionario_Cargo_id_funcionario, fk_Funcionario_Cargo_id_funcionario_clt, fk_Funcionario_Cargo_id_funcionario_pj, ???)
    REFERENCES Funcionario_Cargo (id_funcionario, id_funcionario_clt, id_funcionario_pj, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE armazenar ADD CONSTRAINT FK_armazenar_2
    FOREIGN KEY (fk_Contato_funcionario_id_contato)
    REFERENCES Contato_funcionario (id_contato)
    ON DELETE RESTRICT;
 
ALTER TABLE conter ADD CONSTRAINT FK_conter_1
    FOREIGN KEY (fk_Cliente_Cardapio_Balcao_Entregador_id_cliente, fk_Cliente_Cardapio_Balcao_Entregador_id_cardapio, ???)
    REFERENCES Cliente_Cardapio_Balcao_Entregador (id_cliente, id_cardapio, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE conter ADD CONSTRAINT FK_conter_2
    FOREIGN KEY (fk_Produto_id_produto)
    REFERENCES Produto (id_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE realizar_pedido ADD CONSTRAINT FK_realizar_pedido_1
    FOREIGN KEY (fk_Balcao_id_balcao)
    REFERENCES ??? (???);
 
ALTER TABLE realizar_pedido ADD CONSTRAINT FK_realizar_pedido_2
    FOREIGN KEY (fk_Pedido_id_pedido)
    REFERENCES Pedido (id_pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE preparar_pedido ADD CONSTRAINT FK_preparar_pedido_1
    FOREIGN KEY (fk_Funcionario_Cargo_id_funcionario, fk_Funcionario_Cargo_id_funcionario_clt, fk_Funcionario_Cargo_id_funcionario_pj, fk_Funcionario_Cargo_id_cargo)
    REFERENCES Funcionario_Cargo (id_funcionario, id_funcionario_clt, id_funcionario_pj, id_cargo)
    ON DELETE RESTRICT;
 
ALTER TABLE preparar_pedido ADD CONSTRAINT FK_preparar_pedido_2
    FOREIGN KEY (fk_Cozinha_id_cozinha)
    REFERENCES Cozinha (id_cozinha)
    ON DELETE RESTRICT;
 
ALTER TABLE organizar_pedido ADD CONSTRAINT FK_organizar_pedido_1
    FOREIGN KEY (fk_Funcionario_Cargo_id_funcionario, fk_Funcionario_Cargo_id_funcionario_clt, fk_Funcionario_Cargo_id_funcionario_pj, fk_Funcionario_Cargo_id_cargo)
    REFERENCES Funcionario_Cargo (id_funcionario, id_funcionario_clt, id_funcionario_pj, id_cargo)
    ON DELETE RESTRICT;
 
ALTER TABLE organizar_pedido ADD CONSTRAINT FK_organizar_pedido_2
    FOREIGN KEY (fk_Cliente_Cardapio_Balcao_Entregador_id_cliente, fk_Cliente_Cardapio_Balcao_Entregador_id_cardapio, fk_Cliente_Cardapio_Balcao_Entregador_id_balcao, ???)
    REFERENCES Cliente_Cardapio_Balcao_Entregador (id_cliente, id_cardapio, id_balcao, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE enviar_para_retirada ADD CONSTRAINT FK_enviar_para_retirada_1
    FOREIGN KEY (fk_Cliente_Cardapio_Balcao_Entregador_id_cliente, fk_Cliente_Cardapio_Balcao_Entregador_id_cardapio, fk_Cliente_Cardapio_Balcao_Entregador_id_balcao, fk_Cliente_Cardapio_Balcao_Entregador_id_entregador)
    REFERENCES Cliente_Cardapio_Balcao_Entregador (id_cliente, id_cardapio, id_balcao, id_entregador)
    ON DELETE RESTRICT;
 
ALTER TABLE enviar_para_retirada ADD CONSTRAINT FK_enviar_para_retirada_2
    FOREIGN KEY (fk_Cozinha_id_cozinha)
    REFERENCES Cozinha (id_cozinha)
    ON DELETE RESTRICT;