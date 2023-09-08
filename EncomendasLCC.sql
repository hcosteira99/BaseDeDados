-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BaseDeDados
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BaseDeDados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BaseDeDados` DEFAULT CHARACTER SET utf8 ;
USE `BaseDeDados` ;

-- -----------------------------------------------------
-- Table `BaseDeDados`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseDeDados`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Telemovel` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Morada` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseDeDados`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseDeDados`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Morada` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseDeDados`.`Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseDeDados`.`Item` (
  `idItem` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Peso` VARCHAR(45) NOT NULL,
  `idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idItem`, `idFornecedor`),
  INDEX `fk_Item_Fornecedor_idx` (`idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Item_Fornecedor`
    FOREIGN KEY (`idFornecedor`)
    REFERENCES `BaseDeDados`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseDeDados`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseDeDados`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Telemovel` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseDeDados`.`Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseDeDados`.`Encomenda` (
  `idEncomenda` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Preço` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idEncomenda`, `Cliente_idCliente`, `idFuncionario`),
  INDEX `fk_Encomenda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Encomenda_Funcionario1_idx` (`idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Encomenda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `BaseDeDados`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encomenda_Funcionario1`
    FOREIGN KEY (`idFuncionario`)
    REFERENCES `BaseDeDados`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseDeDados`.`EncomendaItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseDeDados`.`EncomendaItem` (
  `idEncomenda` INT NOT NULL,
  `idItem` INT NOT NULL,
  PRIMARY KEY (`idEncomenda`, `idItem`),
  INDEX `fk_Encomenda_has_Item_Item1_idx` (`idItem` ASC) VISIBLE,
  INDEX `fk_Encomenda_has_Item_Encomenda1_idx` (`idEncomenda` ASC) VISIBLE,
  CONSTRAINT `fk_Encomenda_has_Item_Encomenda1`
    FOREIGN KEY (`idEncomenda`)
    REFERENCES `BaseDeDados`.`Encomenda` (`idEncomenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encomenda_has_Item_Item1`
    FOREIGN KEY (`idItem`)
    REFERENCES `BaseDeDados`.`Item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- DROP database BaseDeDados;

-- Mostrar as informações dos Clientes
SELECT Nome as Nome, Telemovel as Telemovel,Email, Morada as Morada
	From Cliente
ORDER BY Nome ASC;

-- Mostrar os itens disponveis para venda como os seus respetivos fornecedores
SELECT Item.Nome as Nome, Item.Peso as Peso, Fornecedor.Nome as Fornecedor
	FROM Item
		INNER JOIN Fornecedor
			ON Fornecedor.idFornecedor = Item.idFornecedor;
            
-- Mostrar as informações dos Funcionarios
SELECT Nome as Nome, Telemovel as Telemovel, Email as Email 
	From Funcionario
ORDER BY Nome ASC;

-- Mostrar os Fornecedores disponiveis
SELECT Nome as Nome, Morada as Morada
	From Fornecedor;
    
-- Mostrar o que um certo fornecedor tem disponivel 

SELECT Fornecedor.Nome as Nome, Item.Nome as Item_Disponivel
	From Item 
		INNER JOIN Fornecedor
			ON Fornecedor.idFornecedor = Item.idFornecedor
            WHERE Fornecedor.Nome = 'Taberna Belga';
            
-- Mostrar as encomendas de todos os Clientes	
SELECT Cliente.Nome as Nome, Encomenda.Data as Data, Encomenda.Preço as Preço, Item.Nome as Item
	From EncomendaItem
		INNER JOIN Item
			ON EncomendaItem.idItem = Item.idItem
		INNER JOIN Encomenda
			On EncomendaItem.idEncomenda = Encomenda.idEncomenda
		INNER JOIN Cliente 
			ON Cliente.idCliente = Encomenda.Cliente_idCLiente;
            
-- Mostrar o funcionario responsavel por casa encomenda
SELECT Funcionario.Nome as Funcionario,Cliente.Nome as Cliente, Item.Nome as Item, Encomenda.Preço as Preço
	From EncomendaItem
		INNER JOIN Item
			ON EncomendaItem.idItem = Item.idItem
		INNER JOIN Encomenda
			On EncomendaItem.idEncomenda = Encomenda.idEncomenda
		INNER JOIN Funcionario
			On Encomenda.idFuncionario = Funcionario.idFuncionario
		INNER JOIN Cliente 
			ON Cliente.idCliente = Encomenda.Cliente_idCLiente;
            
-- Mostrar o funcionario com mais vendas   
SELECT Funcionario.Nome as Funcionario, COUNT(*) AS `Encomendas Realizadas`
	From Encomenda
		INNER JOIN Funcionario
			ON Encomenda.idFuncionario = Funcionario.idFuncionario
GROUP BY Funcionario
ORDER BY `Encomendas Realizadas` DESC
Limit 1;

-- Mostrar o item mais comprado 
SELECT Item.Nome as Item , COUNT(*) AS `Encomendas Realizadas`
		From EncomendaItem
			INNER JOIN Item
				ON EncomendaItem.idItem = Item.idItem
GROUP BY Item
ORDER BY `Encomendas Realizadas` DESC
limit 1;


-- Mostrar o numero de encomendas entre o mês 8 a 12 
SELECT Item.Nome as Item, COUNT(*) AS `Numero de vezes vendidos`
	From EncomendaItem
		INNER JOIN Encomenda
			ON EncomendaItem.idEncomenda = Encomenda.idEncomenda
		INNER JOIN Item
			ON EncomendaItem.idItem = Item.idItem
WHERE DATE(Encomenda.Data) BETWEEN "2022-08-01" AND "2022-12-31"
GROUP BY Item
ORDER BY `Numero de vezes vendidos` DESC;		

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
