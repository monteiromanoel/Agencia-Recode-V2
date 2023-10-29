-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: agencia_viagem
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `nome` varchar(50) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(80) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('Manoel Monteiro','Rua 1, 110 - Centro','Suzano','12345-123','SP','(11) 96852-2292','123.456.789-23',1,'manoel1@email.com','12345','1996-02-28'),('Maria Cardoso','Rua 123, 5 - Bairro Alto','Santos','32134-512','SP','11123456789','321421421215',2,'maria@email.com','3123412','1990-08-12'),('Alberto dos Santos','Rua 3, 200 - Centro','Rio de Janeiro','98765-022','','0912345678','432134564',3,'alberto@email.com','1234567','1975-10-05'),('Fabio Amaral','Rua das Flores, 150','São Paulo','23123-141','SP','(21) 12312-3412','123.123.512-31',5,'fabioAmaral@email.com','12345','1989-12-05'),('Rosana Santos','Rua das Rosas, 200','Belo Horizonte','12341-234','MG','(32) 11231-4141','565.623.456-23',6,'rosanaSantos@email.com','12345678','1995-06-12');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_passageiros` int NOT NULL,
  `data_reserva` date DEFAULT NULL,
  `preco` double(10,2) DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `idViagem` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCliente_idx` (`idCliente`),
  KEY `idViagem_idx` (`idViagem`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `idViagem` FOREIGN KEY (`idViagem`) REFERENCES `viagem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,2,'2023-09-21',19780.00,1,2),(7,3,'2023-09-23',3450.00,3,6),(8,2,'2023-10-29',6512.00,5,8),(16,1,'2023-10-26',11890.99,1,3),(17,1,'2023-10-26',9835.00,1,7),(18,2,'2023-10-29',26700.00,2,5);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `destino` varchar(50) NOT NULL,
  `preco` double(10,2) NOT NULL,
  `data_ida` date DEFAULT NULL,
  `data_volta` date DEFAULT NULL,
  `descricao_curta` varchar(255) DEFAULT NULL,
  `adicional` varchar(100) DEFAULT NULL,
  `tipo_pacote` varchar(45) NOT NULL,
  `imagem` longtext,
  `localidade` varchar(45) DEFAULT NULL,
  `descricao_longa` longtext,
  `label_promocao` varchar(45) DEFAULT NULL,
  `imagem2` longtext,
  `imagem3` longtext,
  `imagem4` longtext,
  `preco_antigo` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` VALUES (2,'Veneza',9899.00,'2023-11-05','2023-11-17','Aproveite as belezas de Veneza','Hospedagem e Tour','convencional','https://i.postimg.cc/9Xk4wKKY/veneza-1.jpg','Itália','<p>Explore a magia de Veneza, uma cidade que parece ter emergido diretamente de um conto de fadas. Com suas pitorescas ruas de paralelep&iacute;pedos e canais sinuosos que serpenteiam pela cidade, Veneza &eacute; verdadeiramente &uacute;nica no mundo. Ao passear pelas pontes hist&oacute;ricas e pra&ccedil;as encantadoras, voc&ecirc; ser&aacute; envolvido pela rica heran&ccedil;a art&iacute;stica e cultural que permeia cada canto desta cidade.</p>\r\n<p>Sinta a atmosfera rom&acirc;ntica enquanto faz um passeio de g&ocirc;ndola pelos canais, sob as pontes ornamentadas e ao lado das elegantes fachadas dos pal&aacute;cios venezianos. Explore os famosos pontos tur&iacute;sticos, como a deslumbrante Bas&iacute;lica de S&atilde;o Marcos e o ic&ocirc;nico Pal&aacute;cio Ducal, que contam hist&oacute;rias de uma era de esplendor e poder.</p>\r\n<p>Deleite-se com a culin&aacute;ria veneziana, onde pratos de frutos do mar frescos s&atilde;o preparados com maestria. N&atilde;o se esque&ccedil;a de experimentar o \"risotto al nero di seppia\", um arroz negro delicadamente temperado com tinta de lula, uma especialidade local.</p>\r\n<p>&Agrave; noite, enquanto o sol se p&otilde;e sobre os canais, Veneza ganha uma aura m&aacute;gica. As luzes suaves refletem na &aacute;gua, criando um cen&aacute;rio verdadeiramente rom&acirc;ntico. Percorra as ruas &agrave; luz de lanternas e descubra pequenas trattorias e bares de vinho, onde voc&ecirc; pode saborear um bom vinho italiano e se perder no charme inigual&aacute;vel de Veneza.</p>\r\n<p>Em Veneza, cada esquina revela uma nova surpresa, cada canal conta uma hist&oacute;ria e cada vista &eacute; uma obra de arte. Esta cidade &eacute; uma experi&ecirc;ncia que ficar&aacute; gravada na mem&oacute;ria para sempre.</p>','','https://h8f7z4t2.stackpathcdn.com/wp-content/uploads/2015/10/grand-canal-veneza-e1596744121749.jpg',NULL,NULL,0.00),(3,'Disney World',11890.99,'2023-12-10','2023-12-25','Divirta-se no mundo mágico da Disney','Hospedagem e alimentação','promocional','https://i.postimg.cc/d18WZGt8/disney-1-1.jpg','Orlando','\n<strong>Experiência Mágica na Disney:</strong>\n\n\nEmbarque em uma jornada inesquecível para o mundo encantado da Disney! Nosso pacote de viagem exclusivo oferece uma imersão completa no reino da magia, onde sonhos se tornam realidade.\n\n\nDestaques:\n\nAlojamento Confortável: Hospede-se em acomodações cuidadosamente selecionadas, proporcionando conforto e conveniência após os dias cheios de aventuras.\n\nIngressos Park Hopper: Acesse os parques temáticos icônicos da Disney à vontade, aproveitando a liberdade de visitar múltiplos parques no mesmo dia.\n\nEncontros com Personagens: Conheça e cumprimente seus personagens favoritos, capturando momentos preciosos com fotos memoráveis.\n\nShows Espetaculares: Maravilhe-se com espetáculos emocionantes, paradas coloridas e fogos de artifício deslumbrantes, criando memórias que durarão para sempre.\n\nExperiências Gastronômicas: Delicie-se com uma variedade de opções culinárias, desde pratos internacionais até guloseimas icônicas da Disney.\n\nTransporte Conveniente: Desfrute de transporte seguro e confortável entre o aeroporto, os parques e outras atrações selecionadas.\n\nAssistência Personalizada: Nossa equipe dedicada está sempre disponível para garantir que sua viagem seja perfeita em todos os detalhes.\n\n\nExtras Opcionais:\n\nEncontros VIP com Personagens: Desfrute de encontros exclusivos e personalizados com personagens especiais, garantindo momentos mágicos inesquecíveis.\n\nExperiências Exclusivas nos Bastidores: Descubra os segredos e a magia por trás dos bastidores dos parques temáticos.\n\nEsta é sua chance de criar memórias que durarão toda a vida em um dos destinos mais mágicos do mundo. Reserve agora e embarque em uma jornada inesquecível para a Disney!\n\n','Pacote Familiar',NULL,NULL,NULL,13050.00),(4,'Las Vegas',7299.50,'2023-12-10','2023-12-25','Visite Las Vegas, a cidade que nunca dorme','Hospedagem e tour','convencional','https://i.postimg.cc/PJSQ1yG8/lasvegas-1-1.jpg','Nevada',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Tokio',13350.00,'2023-12-10','2023-12-25','Conheça o Japão','Hospedagem e tour','promocional','https://i.postimg.cc/zfh74Th9/japao-1.jpg','Japão',NULL,'Tour Completo',NULL,NULL,NULL,15999.00),(6,'Balneário Camboriú',1150.00,'2023-11-08','2023-11-18','Conheça Balneário e suas praias','Hospedagem e alimentação','convencional','https://i.postimg.cc/52d6nvxH/balneario-1.jpg','Brasil','<p>Conhecida por suas deslumbrantes praias e paisagens costeiras, &eacute; um dos destinos tur&iacute;sticos mais populares da regi&atilde;o sul do pa&iacute;s. Com uma mistura encantadora de belezas naturais e infraestrutura urbana bem desenvolvida, Balne&aacute;rio Cambori&uacute; oferece uma experi&ecirc;ncia &uacute;nica para visitantes de todas as idades.</p>\r\n<p>Suas praias de areias finas e &aacute;guas cristalinas s&atilde;o o ponto alto da cidade. A Praia Central &eacute; o cora&ccedil;&atilde;o do movimento, com uma ampla orla que convida a caminhadas relaxantes e pr&aacute;tica de esportes &agrave; beira-mar. Al&eacute;m disso, o telef&eacute;rico que liga a Praia Central ao Morro da Aguada proporciona uma vista panor&acirc;mica espetacular, revelando a exuberante beleza da regi&atilde;o.</p>\r\n<p>Balne&aacute;rio Cambori&uacute; tamb&eacute;m &eacute; conhecida por sua vida noturna agitada e diversificada. A Avenida Atl&acirc;ntica, que margeia a praia, abriga uma infinidade de bares, restaurantes e casas noturnas, oferecendo op&ccedil;&otilde;es para todos os gostos e estilos.</p>\r\n<p>Al&eacute;m das praias e vida noturna, a cidade conta com uma variada oferta de entretenimento e lazer. O Parque Unipraias &eacute; uma atra&ccedil;&atilde;o imperd&iacute;vel, proporcionando aventuras em meio &agrave; natureza, com trilhas e tirolesas que revelam paisagens deslumbrantes.</p>\r\n<p>Com uma atmosfera vibrante e acolhedora, Balne&aacute;rio Cambori&uacute; se destaca como um destino completo, capaz de agradar tanto aos que buscam relaxamento &agrave; beira-mar quanto aos que procuram atividades emocionantes e uma vida noturna animada. &Eacute; um lugar onde a natureza se une &agrave; modernidade, oferecendo uma experi&ecirc;ncia memor&aacute;vel a todos que t&ecirc;m a oportunidade de explorar seus encantos.</p>','-15%','https://www.bc.sc.gov.br/arquivos/imprensa/UY3JE9NG.jpg','https://i0.statig.com.br/bancodeimagens/6w/jj/88/6wjj88wjxf5i48g1fwma3j8vj.jpg',NULL,1389.00),(7,'Roma',9835.00,'2023-12-10','2023-12-25','Visite a maravilhosa Madrid','Hospedagem e Tour','promocional','https://i.postimg.cc/x8XcF3Jm/roma-1-1.jpg','Madrid',NULL,'Cultura e Lazer',NULL,NULL,NULL,11090.00),(8,'Campos do Jordão',3256.00,'2023-11-01','2023-11-15','Montanhas e Charme em São Paulo','Hospedagem e Tour','promocional','https://conteudo.imguol.com.br/c/entretenimento/4d/2021/08/09/campos-do-jordao-1628534716035_v2_4x3.jpg','Brasil','<p>Campos do Jord&atilde;o, localizada no estado de S&atilde;o Paulo, &eacute; um ref&uacute;gio encantador nas montanhas da Serra da Mantiqueira. Conhecida como a \"Su&iacute;&ccedil;a Brasileira\", a cidade atrai visitantes o ano todo com seu clima ameno, ar puro e paisagens deslumbrantes. Durante o inverno, as baixas temperaturas criam um ambiente acolhedor, perfeito para desfrutar de fondues, chocolate quente e lareiras acesas. Al&eacute;m disso, a cidade oferece uma rica variedade de trilhas, parques e jardins bem cuidados, proporcionando aos visitantes a oportunidade de explorar a natureza exuberante da regi&atilde;o. Com sua arquitetura europeia e charmosos vilarejos, Campos do Jord&atilde;o tamb&eacute;m &eacute; famosa por seus festivais de m&uacute;sica cl&aacute;ssica e eventos culturais. &Eacute; o destino ideal para quem busca uma escapada rom&acirc;ntica, contato com a natureza e uma experi&ecirc;ncia &uacute;nica de montanha no cora&ccedil;&atilde;o do Brasil.</p>','Descanso e Sofisticação','https://a.cdn-hotels.com/gdcs/production73/d639/bbc78384-7a78-4cf9-967b-939d031b432d.jpg',NULL,NULL,3899.00);
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'agencia_viagem'
--

--
-- Dumping routines for database 'agencia_viagem'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 15:53:15
