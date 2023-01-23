-- show databases; -- pesquisa databases disponiveis.
-- use oficina; -- seleciona database desejado.
-- show tables; -- exibe as tabelas existentes no database selecionado.
-- -----------------------------------------------------
-- Tabela mecanico
-- -----------------------------------------------------
CREATE TABLE mecanico (
  id_mecanico INT NOT NULL,
  crea VARCHAR(5) NULL,
  nome VARCHAR(30) NULL,
  endereco VARCHAR(100) NULL,
  celular VARCHAR(11) NULL,
  cpf VARCHAR(11) NOT NULL,
  PRIMARY KEY (id_mecanico));
  
 -- desc mecanico;
 -- select * from mecanico;
  
insert into Mecanico (id_mecanico, crea, nome, endereco, celular, cpf) 
	 values('1','12345','Marcos','rua silva de prata 29', 05192346789, '00034500073'),
		     ('2','12346','Carlos','rua carmellita agrippe 145', 05192341213, '00062450073'),
			 ('3','12347','Willian','rua betania 26', 05192349587, '97824500073'),
			 ('4','12348','Leonardo','av getulio vargas', 05192343260, '38492700073');  
-- -----------------------------------------------------
-- Tabela cliente
-- -----------------------------------------------------
-- consultas
-- desc cliente;
-- select * from cliente;
-- select count(*) from cliente;
-- select * from cliente where id_cliente < 03;
-- select * from cliente where id_cliente > 03;
-- select * from cliente where nome ='jose';
-- ------------------------------------------------------
CREATE TABLE cliente (
  id_cliente INT NOT NULL,
  nome VARCHAR(30) NOT NULL,
  telefone INT(11) NULL,
  cnh VARCHAR(11) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_cliente));

insert into cliente (id_cliente, nome, telefone, cnh, endereco) 
	      values('01','Jose','51985627097','12456987521','rua silva de prata 45'),
				('02','claudio','51945677097','12459487521','rua canarios 654'),
                ('03','leandro','51995643097','12454897521','rua flor de lis 119'),
                ('04','julio','51989875097','12496487521','rua selva de pedra 13');
-- -----------------------------------------------------
-- Tabela veiculo
-- -----------------------------------------------------
-- desc veiculo;
-- select * from veiculo;

CREATE TABLE veiculo (
  id_veiculo INT NOT NULL,
  placa VARCHAR(8) NULL,
  ano INT(11) NULL,
  renavam VARCHAR(9) NOT NULL,
  marca VARCHAR(30) NULL,
  modelo VARCHAR(30) NULL,
  mecanico_id_mecanico INT NOT NULL,
  cliente_id_cliente INT NOT NULL,
  PRIMARY KEY (id_veiculo),
  INDEX fk_veiculo_mecanico1_idx (mecanico_id_mecanico),
  INDEX fk_veiculo_cliente1_idx (cliente_id_cliente),
  CONSTRAINT fk_veiculo_mecanico1
  FOREIGN KEY (mecanico_id_mecanico)
  REFERENCES mecanico (id_mecanico),
  CONSTRAINT fk_veiculo_cliente1
  FOREIGN KEY (cliente_id_cliente)
  REFERENCES cliente (id_cliente)
    );
insert into veiculo (id_veiculo, placa, ano, renavam, marca, modelo, mecanico_id_mecanico, cliente_id_cliente) 
	      values('12','rmv7c39','2022','123456789','chevrolet','celta','1','01'),
				('13','qul0995','2019','789456123','ford','ka','3','02'),
                ('14','rmv7c38','2022','987456789','volkswagen','Gol','2','03');
-- -----------------------------------------------------
-- Tabela revisão
-- -----------------------------------------------------
-- select * from veiculo;
-- desc revisao;
-- select count(*) from revisao;

CREATE TABLE revisao (
  id_revisao INT(11) NOT NULL,
  data DATE NULL,
  horario TIME NULL,
  valor FLOAT NULL,
  mecanico_id_mecanico INT NOT NULL,
  veiculo_id_veiculo INT NOT NULL,
  PRIMARY KEY (id_revisao),
  INDEX fk_revisao_mecanico_idx (mecanico_id_mecanico),
  INDEX fk_revisao_veiculo1_idx (veiculo_id_veiculo),
  CONSTRAINT fk_revisao_mecanico
  FOREIGN KEY (mecanico_id_mecanico)
  REFERENCES mecanico (id_mecanico),
  CONSTRAINT fk_revisao_veiculo1
  FOREIGN KEY (veiculo_id_veiculo)
  REFERENCES veiculo (id_veiculo)
    );
insert into revisao (id_revisao, data, horario, valor, mecanico_id_mecanico, veiculo_id_veiculo) 
	      values('123','date','011100','30,00','1','12'),
				('124','date','011101','45,00','3','13'),
                ('125','date','011102','987','2','14');

-- -----------------------------------------------------
-- Tabela item revisado
-- -----------------------------------------------------
-- desc item_revisado;
select * from item_revisado;
UPDATE item_revisado
SET valor_mobra = 150
WHERE troca = 1;
CREATE TABLE item_revisado (
  id_item_revisado INT NOT NULL,
  peca VARCHAR(45) NULL,
  troca TINYINT(1) NULL,
  valor_mobra FLOAT NULL,
  valor_peca FLOAT NULL,
  revisao_id_revisao INT(11) NOT NULL,
  PRIMARY KEY (id_item_revisado),
  INDEX fk_item_revisado_revisao1_idx (revisao_id_revisao),
  CONSTRAINT fk_item_revisado_revisao1
  FOREIGN KEY (revisao_id_revisao)
  REFERENCES revisao (id_revisao)
    );
    insert into item_revisado (id_item_revisado, peca, troca, valor_mobra, valor_peca, revisao_id_revisao) 
	      values('321','roda','1','100','121','123'),
				('654','valvula','1','100','363','124'),
                ('987','escapamento','1','100','562','125');

