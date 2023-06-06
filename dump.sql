-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` varchar(5) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Mégarama','7 Quai des Queyries','33100','Bordeaux'),(2,'CGR Le Français','9 rue Montesquieu','33000','Bordeaux'),(3,'Cinéma Grand Ecran','26 rue Adrien Piquet','33560','Sainte-Eulalie'),(4,'UGC','6 Quai Virginie Hériot','33300','Bordeaux');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_user`
--

DROP TABLE IF EXISTS `cinema_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cinema` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cinema` (`id_cinema`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `cinema_user_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cinema_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_user`
--

LOCK TABLES `cinema_user` WRITE;
/*!40000 ALTER TABLE `cinema_user` DISABLE KEYS */;
INSERT INTO `cinema_user` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,1,2),(6,2,2),(7,3,2),(8,4,2),(9,1,3),(10,2,4),(11,3,5),(12,4,6);
/*!40000 ALTER TABLE `cinema_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Animation'),(3,'Aventure'),(4,'Comédie'),(5,'Drame'),(6,'Famille'),(7,'Fantastique'),(8,'Historique'),(9,'Romance'),(10,'Science-fiction'),(11,'Thriller');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `duration` time NOT NULL,
  `director` varchar(255) NOT NULL,
  `synopsis` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Fast and Furious 10','02:21:00','Louis Leterrier','Après bien des missions et contre toute attente, Dom Toretto et sa famille ont su déjouer, devancer, surpasser et distancer tous les adversaires qui ont croisé leur route. Ils sont aujourd\'\'hui face à leur ennemi le plus terrifiant et le plus intime : émergeant des brumes du passé, ce revenant assoiffé de vengeance est bien déterminé à décimer la famille en réduisant à néant tout ce à quoi, et surtout à qui Dom ait jamais tenu. Dans FAST &amp; FURIOUS 5 en 2011, Dom et son équipe avaient fait tomber l\'\'infâme ponte de la drogue brésilienne, Hernan Reyes, en précipitant son empire du haut d\'\'un pont de Rio De Janeiro. Ils étaient loin de se douter que son fils Dante, avait assisté impuissant à la scène et qu\'\'il avait passé ces douze dernières années à échafauder le plan infernal qui exigerait de Dom un prix ultime. Dante va débusquer et traquer Dom et sa famille aux quatre coins du monde, de Los Angeles aux catacombes de Rome, du Brésil à Londres et de l\'\'Antarctique au Portugal. De nouvelles alliances vont se forger et de vieux ennemis réapparaitre. Mais tout va basculer quand Dom va comprendre que la cible principale de Dante n\'\'est autre que son fils à peine âgé de 8 ans.'),(2,'La petite sirène','02:16:00','Rob Marshall','Les années 1830, dans les eaux d\'\'une île fictive des Caraïbes. Ariel, la benjamine des filles du roi Triton, est une jeune sirène belle et fougueuse dotée d\'\'un tempérament d\'\'aventurière. Rebelle dans l\'\'âme, elle n\'\'a de cesse d\'\'être attirée par le monde qui existe par-delà les flots. Au détour de ses escapades à la surface, elle va tomber sous le charme du prince Eric. Alors qu\'\'il est interdit aux sirènes d\'\'interagir avec les humains, Ariel sent pourtant qu\'\'elle doit suivre son cœur. Elle conclut alors un accord avec Ursula, la terrible sorcière des mers, qui lui octroie le pouvoir de vivre sur la terre ferme, mais sans se douter que ce pacte met sa vie - et la couronne de son père - en danger...'),(3,'Les gardiens de la galaxie 3','02:30:00','James Gunn','Notre bande de marginaux favorite a quelque peu changé. Peter Quill, qui pleure toujours la perte de Gamora, doit rassembler son équipe pour défendre l\'\'univers et protéger l\'\'un des siens. En cas d\'\'échec, cette mission pourrait bien marquer la fin des Gardiens tels que nous les connaissons.'),(4,'Transformers : Rise of the beasts','02:08:00','Steven Caple Jr','Transformers : Rise of the Beasts renoue avec l\'\'action et le grand spectacle qui ont séduit des millions de spectateurs à travers le monde. Ce nouveau volet se déroule au cœur des années 90 et nous emmène aux quatre coins du globe. Une toute nouvelle faction de robots Transformers - les Maximals - se joindront aux Autobots dans l\'\'éternelle bataille qu\'\'ils livrent face aux Decepticons.'),(5,'Super Mario Bros','01:32:00','Aaron Horvath','Alors qu\'\'ils tentent de réparer une canalisation souterraine, Mario et son frère Luigi, tous deux plombiers, se retrouvent plongés dans un nouvel univers féerique à travers un mystérieux conduit. Mais lorsque les deux frères sont séparés, Mario s\'\'engage dans une aventure trépidante pour retrouver Luigi. Dans sa quête, il peut compter sur l\'\'aide du champignon Toad, habitant du Royaume Champignon, et les conseils avisés, en matière de techniques de combat, de la Princesse Peach, guerrière déterminée à la tête du Royaume. C\'\'est ainsi que Mario réussit à mobiliser ses propres forces pour aller au bout de sa mission.'),(6,'Jeanne du Barry','01:56:00','Maïwenn','Ce film est présenté en ouverture du Festival de Cannes 2023 Jeanne Vaubernier, fille du peuple avide de s\'\'élever socialement, met à profit ses charmes pour sortir de sa condition. Son amant le comte Du Barry, qui s\'\'enrichit largement grâce aux galanteries lucratives de Jeanne, souhaite la présenter au Roi. Il organise la rencontre via l\'\'entremise de l\'\'influent duc de Richelieu. Celle-ci dépasse ses attentes : entre Louis XV et Jeanne, c\'\'est le coup de foudre… Avec la courtisane, le Roi retrouve le goût de vivre – à tel point qu\'\'il ne peut plus se passer d\'\'elle et décide d\'\'en faire sa favorite officielle. Scandale : personne ne veut d\'\'une fille des rues à la Cour.');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_genre` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_genre` (`id_genre`),
  KEY `id_movie` (`id_movie`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (1,1,1),(2,3,2),(3,6,2),(4,7,2),(5,1,3),(6,7,3),(7,10,3),(8,1,4),(9,10,4),(10,2,5),(11,4,5),(12,6,5),(13,5,6),(14,8,6),(15,9,6);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_theater`
--

DROP TABLE IF EXISTS `movie_theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_theater` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `id_cinema` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cinema` (`id_cinema`),
  CONSTRAINT `movie_theater_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_theater`
--

LOCK TABLES `movie_theater` WRITE;
/*!40000 ALTER TABLE `movie_theater` DISABLE KEYS */;
INSERT INTO `movie_theater` VALUES (1,'1',200,1),(2,'2',140,1),(3,'3',140,1),(4,'4',100,1),(5,'5',160,1),(6,'PREMIUM',110,1),(7,'1',90,2),(8,'2',104,2),(9,'3',82,2),(10,'4',90,2),(11,'1',80,3),(12,'2',110,3),(13,'3',80,3),(14,'PREMIUM',60,4),(15,'1',114,4),(16,'2',120,4),(17,'3',102,4),(18,'4',165,4);
/*!40000 ALTER TABLE `movie_theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,'Plein tarif',9.20),(2,'Etudiant',7.60),(3,'Moins de 14 ans',5.90);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` datetime NOT NULL,
  `id_movie` int(11) NOT NULL,
  `id_movie_theater` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_movie` (`id_movie`),
  KEY `id_movie_theater` (`id_movie_theater`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `session_ibfk_2` FOREIGN KEY (`id_movie_theater`) REFERENCES `movie_theater` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'2023-06-02 21:00:00',1,1),(2,'2023-06-02 20:25:00',1,14),(3,'2023-06-02 20:30:00',1,12),(4,'2023-06-02 21:00:00',2,6),(5,'2023-06-02 21:00:00',2,3),(6,'2023-06-02 18:00:00',2,8),(7,'2023-06-02 20:30:00',2,16),(8,'2023-06-02 20:30:00',2,18),(9,'2023-06-02 18:30:00',3,4),(10,'2023-06-02 14:30:00',3,11),(11,'2023-06-02 20:45:00',3,8),(12,'2023-06-02 18:30:00',4,13),(13,'2023-06-02 21:00:00',4,17),(14,'2023-06-02 16:30:00',5,11),(15,'2023-06-02 16:30:00',5,17),(16,'2023-06-02 17:30:00',5,7),(17,'2023-06-02 17:30:00',5,2),(18,'2023-06-02 20:30:00',6,9),(19,'2023-06-02 20:45:00',6,11);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `id_session` int(11) DEFAULT NULL,
  `id_rate` int(11) DEFAULT NULL,
  `purchase_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_session` (`id_session`),
  KEY `id_rate` (`id_rate`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_rate`) REFERENCES `rate` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (10,'Dématérialisé',3,1,'2023-06-02 18:07:40'),(11,'Matérialisé',14,3,'2023-06-02 18:07:40'),(12,'Matérialisé',14,1,'2023-06-02 18:07:40'),(13,'Dématérialisé',5,2,'2023-06-02 18:07:40'),(14,'Dématérialisé',5,2,'2023-06-02 18:07:40'),(15,'Dématérialisé',11,1,'2023-06-02 18:07:40'),(16,'Dématérialisé',11,1,'2023-06-02 18:07:40'),(17,'Matérialisé',19,1,'2023-06-02 18:07:40'),(18,'Matérialisé',10,2,'2023-06-02 18:07:40');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Angèle','Balderston','abalderston0@ed.com','$2y$10$hVaJmB4JnYOw7E/EmhYLNeby0NfPSabzHoYMPDCxctbg08zllWOMO'),(2,'Bernard','Coats','bcoats8@msn.com','$2y$10$JzsoKUmRlcO7AoXt9fxCcuvYcMdCH9nRrMfYwZqJ/7.s2l/msvyoG'),(3,'Stéphanie','Pashley','spashley3@icq.com','$2y$10$9J0mVHYmtZMgjILOpf0s7OFzXKwgkad7cXC86Xs2WXpS7ptarCTMW'),(4,'Bruce','Handslip','bhandslip10@scribd.com','$2y$10$pZBHSfsarxacFvvRLk1Wl.gmrHKhoEHwc0DtCevHnAOFfBZFtikGu'),(5,'Garrek','Sidebotham','gsidebotham2r@ibm.com','$2y$10$ubENk.hLjfCJoEIfP8BgTeBijurrM/vCtUx8JQ8enFNftRi5eeZv6'),(6,'Zoé','Blum','zblum4@psu.fr','$2y$10$vx3BlswIoUzeWRwZsnhbReJ22Ow4FepCU2D0aGWF77sawUQOi1KWu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-05 17:31:47
