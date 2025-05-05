create database livraria;

USE livraria;

CREATE TABLE editor (
    idEditor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome CHAR(100) NOT NULL,
    cnpj CHAR(18) NOT NULL,
    cidade CHAR(50) NOT NULL,
    pais CHAR(50) NOT NULL
);

CREATE TABLE categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    descricao CHAR(100) NOT NULL,
    titulo CHAR(100) NOT NULL
);

CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipo CHAR(20) NOT NULL,
    cpf CHAR(14),
    cnpj CHAR(18),
    cep CHAR(9) NOT NULL
);

CREATE TABLE transportadora (
    idTransportadora INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome CHAR(45) NOT NULL,
    cnpj CHAR(18) NOT NULL,
    cep CHAR(8) NOT NULL
);

CREATE TABLE livro (
    idLivro INT AUTO_INCREMENT PRIMARY KEY,
    titulo CHAR(100) NOT NULL,
    descritivo CHAR(255) NOT NULL,
    ano CHAR(4) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    idEditor INT NOT NULL,
    FOREIGN KEY (idEditor) REFERENCES editor(idEditor)
);

CREATE TABLE venda (
    cliente_idCliente INT NOT NULL,
    livro_idLivro INT NOT NULL,
    numero_nota_fiscal CHAR(40) PRIMARY KEY NOT NULL,
    dat CHAR(10) NOT NULL,
    valor_total FLOAT NOT NULL,
    FOREIGN KEY (cliente_idCliente) REFERENCES cliente(idCliente), 
    FOREIGN KEY (livro_idLivro) REFERENCES livro(idLivro)
);

CREATE TABLE entrega (
    venda_numeroNotaFiscal CHAR(40) NOT NULL,
    transportadora_idTransportadora INT NOT NULL,
    numero_protocolo INT PRIMARY KEY NOT NULL,
    FOREIGN KEY (venda_numeroNotaFiscal) REFERENCES venda(numero_nota_fiscal),
    FOREIGN KEY (transportadora_idTransportadora) REFERENCES transportadora(idTransportadora)
);

CREATE TABLE autor (
    idAutor INT AUTO_INCREMENT PRIMARY KEY,
    nome CHAR(150) NOT NULL,
    nacionalidade CHAR(40) NOT NULL,
    biografia varCHAR(1000)
);


show tables;

CREATE TABLE livro_has_categoria (
    Livro_idLivro INT NOT NULL,
    Categoria_idCategoria INT NOT NULL,
    PRIMARY KEY (Livro_idLivro, Categoria_idCategoria),
    FOREIGN KEY (Livro_idLivro) REFERENCES livro(idLivro),
    FOREIGN KEY (Categoria_idCategoria) REFERENCES categoria(idCategoria)
);

CREATE TABLE livro_has_autor (
    Livro_idLivro INT NOT NULL,
    Autor_idAutor INT NOT NULL,
    idLivro_autor INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (Livro_idLivro) REFERENCES livro(idLivro),
    FOREIGN KEY (Autor_idAutor) REFERENCES autor(idAutor)
);



show tables;

select *
from autor;

alter table autor add nomeFantasia varchar(45);

alter table entrega add meioEntrega varchar(45) not null;

INSERT INTO editor(idEditor, nome, cnpj, cidade, pais)
VALUES( 1,"Magrao", "12345567", "Santa Maria", "Brasil");

select * from editor;

INSERT INTO cliente (idCliente, tipo, cpf, cep)
VALUES("Pessoa","123456789", "1234567");

INSERT INTO categoria (idCategoria, descricao, titulo)
VALUES("TERROR DA MEDO", "TERROR");

INSERT INTO autor (idAutor, nome, nacionalidade, biografia)
VALUES("Pessoa","BRAZUCA", "CRIADO EM BANGU");

INSERT INTO transportadora (idTransportadora, nome, cnpj, cep)
VALUES("Transporte","12345567", "12345");

INSERT INTO livro (titulo, descritivo, ano, preco, idEditor)
VALUES("Reri pote","Reri pote ta no castelo","1990", 14,1);

INSERT INTO venda (cliente_idCliente, livro_idLivro, numero_nota_fiscal, dat, valor_total)
VALUES(1,1,"12312","12/12/12", 14);

INSERT INTO entrega (venda_numeroNotaFiscal,transportadora_idTransportadora,numero_protocolo, meioEntrega)
VALUES("12312",1, "1234567","BARCO");


