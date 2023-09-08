USE `BaseDeDados` ;

INSERT INTO `BaseDeDados`.`Cliente`
	(idCliente,Nome,Telemovel,Email,Morada) 
VALUES
	(1,'Liam Neeson',963462872,'emailnadafalso@gmail.com','Rua da Universidade'),
	(2,'Ewan McGregor',963629639,'emailfalso@gmail.com','Rua da Esquina'),
	(3,'Natalie Portman',917368936,'falsoemail@gmail.com','Rua do Bp'),
	(4,'Joao Pedro',923752816,'gordinho@gmail.com','Rua Pinheiro'),
    (5,'Eden Hazard',967236892,'realmadrid@gmail.com','Rua de Espanha'),
    (6,'Enzo Fernandes',916438278,'enzito@gmail.com','Rua do Benfica'),
    (7,'Leo Messi',936482223,'baixinho@gmail.com','Rua do Roubo'),
    (8,'Cristiano Ronaldo',919689678,'thegoat@gmail.com','Rua das Arabias');
    
 INSERT INTO `BaseDeDados`.`Funcionario`
	(idFuncionario,Nome,Telemovel,Email) 
VALUES
	(1,'Hugo Costeira',9123437865,'hugocosteira44@gmail.com'),
	(2,'Tiago Rodriguez',923477553,'messiboy@gmail.com'),
	(3,'Joao Nuno',923499881,'onlyone@gmail.com'),
	(4,'Joao Goulart',967744339,'ourinhos@gmail.com');
    
    
    INSERT INTO `BaseDeDados`.`Encomenda`
	(idEncomenda,Data,Preço,Cliente_idCliente,idFuncionario) 
VALUES
	(1,'2022-10-11','20€',6,1),
	(2,'2022-11-22','10€',3,1),
	(3,'2022-2-11','2€',5,2),
    (4,'2022-3-2','14€',1,2),
    (5,'2022-6-4','17€',2,3),
    (6,'2022-12-11','30€',6,3),
    (7,'2022-10-30','24€',8,4),
    (8,'2022-2-27','45€',7,1),
    (9,'2022-1-18','100€',5,3),
    (10,'2022-8-19','26€',2,4),
    (11,'2022-9-12','8€',8,4),
    (12,'2022-2-5','56€',4,2),
    (13,'2022-5-8','67€',1,4),
	(14,'2022-6-4','39€',7,1);
    
     INSERT INTO `BaseDeDados`.`Fornecedor`
	(idFornecedor,Nome,Morada) 
VALUES
	(1,'Nike','Rua Sapatilha'),
	(2,'Adidas','Rua Messi'),
	(3,'Taberna Belga','Rua da Francesinha'),
	(4,'Venezuelana','Rua do Frango'),
    (5,'Fnac','Rua do Braga Parque');
    
    
      INSERT INTO `BaseDeDados`.`Item`
	(idItem,Nome,Peso,idFornecedor) 
VALUES
	(1,'AirForce','1kg',1),
	(2,'SuperStar','1kg',2),
	(3,'Livro Harry Potter','1kg',5),
    (4,'Frango Assado','3kg',4),
    (5,'Francesinha','2kg',3),
    (6,'Prego no Prato','1,5kg',3),
    (7,'Casaco','1kg',1),
    (8,'Calças','1kg',1),
    (9,'Chapeu','1kg',2),
    (10,'Costelinha','2kg',4),
    (11,'Mousse','0,5kg',3),
    (12,'Hoddie','0,5kg',2),
    (13,'Hoddie','1kg',1),
    (14,'Bola','0,5kg',1),
    (15,'Boneco','0,2kg',5),
	(16,'Funko','0.1kg',5);
    
    INSERT INTO `BaseDeDados`.`EncomendaItem`
	(idEncomenda,idItem) 
VALUES
	(1,14),
	(2,1),
	(3,12),
    (4,13),
    (5,10),
    (6,9),
    (7,2),
    (8,3),
    (9,7),
    (10,16),
    (11,2),
    (12,11),
    (13,4),
	(14,5);
    
   
    
    
  