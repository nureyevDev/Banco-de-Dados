USE `banco`;
DROP TABLE IF EXISTS `vendedores`;

CREATE TABLE  `vendedores` (
	`ID_Vendedor` INT PRIMARY KEY,
	`Nome` VARCHAR(50) NOT NULL,
	`Sobrenome` VARCHAR(100),
	`Email` VARCHAR(100),
	`Data_Nascimento` DATE,
	`ID_Loja` INT NOT NULL
);



