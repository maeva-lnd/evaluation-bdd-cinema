-- Création de la base de données
CREATE DATABASE IF NOT EXISTS cinema CHARACTER SET utf8 COLLATE utf8_general_ci;

use cinema;

-- Création d'un administrateur ayant tous les privilèges
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'C9Y6vckP48';
GRANT ALL PRIVILEGES ON cinema.* TO 'admin'@'localhost';


-- Création d'un utilisateur ayant accès qu'à la lecture de la BDD
CREATE USER 'reader'@'localhost' IDENTIFIED BY 'm6eS8QLa93';
GRANT SELECT ON cinema.* TO 'reader'@'localhost';


-- Création de la table cinéma
CREATE TABLE cinema
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    postcode VARCHAR(5) NOT NULL,
    city VARCHAR(100)
) ENGINE=INNODB;


-- Création de la table salle
CREATE TABLE movie_theater
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    capacity INT NOT NULL,
    id_cinema INT NOT NULL,
    FOREIGN KEY (id_cinema)
        REFERENCES cinema (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=INNODB;


-- Création de la table film
CREATE TABLE movie
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration TIME NOT NULL,
    director VARCHAR(255) NOT NULL,
    synopsis TEXT NULL
) ENGINE=INNODB;


-- Création de la table genre
CREATE TABLE genre
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
) ENGINE=INNODB;


-- Création de la table séance
CREATE TABLE session
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    schedule DATETIME NOT NULL,
    id_movie INT NOT NULL,
    id_movie_theater INT NOT NULL,
    FOREIGN KEY (id_movie) REFERENCES movie (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_movie_theater) REFERENCES movie_theater (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=INNODB;


-- Création de la table tarif
CREATE TABLE rate
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
) ENGINE=INNODB;


-- Création de la table ticket
CREATE TABLE ticket
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(100) NOT NULL,
    purchase_date DATETIME NOT NULL DEFAULT NOW(),
    id_session INT,
    id_rate INT,
    FOREIGN KEY (id_session) REFERENCES session (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (id_rate) REFERENCES rate (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=INNODB;

-- Création de la table d'association des tables genre et film
CREATE TABLE movie_genre
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_genre INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_genre) REFERENCES genre (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_movie) REFERENCES movie (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=INNODB;


-- Création de la table utilisateur
CREATE TABLE user
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
) ENGINE=INNODB;


-- Création de la table d'association des tables cinema et user
CREATE TABLE cinema_user
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cinema INT NOT NULL,
    id_user INT NOT NULL,
    FOREIGN KEY (id_cinema) REFERENCES cinema (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_user) REFERENCES user (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=INNODB;


-- Insertion de données dans la table cinéma
INSERT INTO cinema (name, address, postcode, city)
VALUES
    ('Mégarama', '7 Quai des Queyries', '33100', 'Bordeaux'),
    ('CGR Le Français', '9 rue Montesquieu', '33000', 'Bordeaux'),
    ('Cinéma Grand Ecran', '26 rue Adrien Piquet', '33560', 'Sainte-Eulalie'),
    ('UGC', '6 Quai Virginie Hériot', '33300', 'Bordeaux');


-- Insertion de données dans la table salle
INSERT INTO movie_theater (name, capacity, id_cinema)
VALUES
    ('1', 200, 1),
    ('2', 140, 1),
    ('3', 140, 1),
    ('4', 100, 1),
    ('5', 160, 1),
    ('PREMIUM', 110, 1),
    ('1', 90, 2),
    ('2', 104, 2),
    ('3', 82, 2),
    ('4', 90, 2),
    ('1', 80, 3),
    ('2', 110, 3),
    ('3', 80, 3),
    ('PREMIUM', 60, 4),
    ('1', 114, 4),
    ('2', 120, 4),
    ('3', 102, 4),
    ('4', 165, 4);


-- Insertion de données dans la table film
INSERT INTO movie (title, duration, director, synopsis)
VALUES
    ('Fast and Furious 10', '02:21:00', 'Louis Leterrier', "Après bien des missions et contre toute attente, Dom Toretto et sa famille ont su déjouer, devancer, surpasser et distancer tous les adversaires qui ont croisé leur route. Ils sont aujourd''hui face à leur ennemi le plus terrifiant et le plus intime : émergeant des brumes du passé, ce revenant assoiffé de vengeance est bien déterminé à décimer la famille en réduisant à néant tout ce à quoi, et surtout à qui Dom ait jamais tenu. Dans FAST &amp; FURIOUS 5 en 2011, Dom et son équipe avaient fait tomber l''infâme ponte de la drogue brésilienne, Hernan Reyes, en précipitant son empire du haut d''un pont de Rio De Janeiro. Ils étaient loin de se douter que son fils Dante, avait assisté impuissant à la scène et qu''il avait passé ces douze dernières années à échafauder le plan infernal qui exigerait de Dom un prix ultime. Dante va débusquer et traquer Dom et sa famille aux quatre coins du monde, de Los Angeles aux catacombes de Rome, du Brésil à Londres et de l''Antarctique au Portugal. De nouvelles alliances vont se forger et de vieux ennemis réapparaitre. Mais tout va basculer quand Dom va comprendre que la cible principale de Dante n''est autre que son fils à peine âgé de 8 ans."),
    ('La petite sirène', '02:16:00', 'Rob Marshall', "Les années 1830, dans les eaux d''une île fictive des Caraïbes. Ariel, la benjamine des filles du roi Triton, est une jeune sirène belle et fougueuse dotée d''un tempérament d''aventurière. Rebelle dans l''âme, elle n''a de cesse d''être attirée par le monde qui existe par-delà les flots. Au détour de ses escapades à la surface, elle va tomber sous le charme du prince Eric. Alors qu''il est interdit aux sirènes d''interagir avec les humains, Ariel sent pourtant qu''elle doit suivre son cœur. Elle conclut alors un accord avec Ursula, la terrible sorcière des mers, qui lui octroie le pouvoir de vivre sur la terre ferme, mais sans se douter que ce pacte met sa vie - et la couronne de son père - en danger..."),
    ('Les gardiens de la galaxie 3', '02:30:00', 'James Gunn', "Notre bande de marginaux favorite a quelque peu changé. Peter Quill, qui pleure toujours la perte de Gamora, doit rassembler son équipe pour défendre l''univers et protéger l''un des siens. En cas d''échec, cette mission pourrait bien marquer la fin des Gardiens tels que nous les connaissons."),
    ('Transformers : Rise of the beasts', '02:08:00', 'Steven Caple Jr', "Transformers : Rise of the Beasts renoue avec l''action et le grand spectacle qui ont séduit des millions de spectateurs à travers le monde. Ce nouveau volet se déroule au cœur des années 90 et nous emmène aux quatre coins du globe. Une toute nouvelle faction de robots Transformers - les Maximals - se joindront aux Autobots dans l''éternelle bataille qu''ils livrent face aux Decepticons."),
    ('Super Mario Bros', '01:32:00', 'Aaron Horvath', "Alors qu''ils tentent de réparer une canalisation souterraine, Mario et son frère Luigi, tous deux plombiers, se retrouvent plongés dans un nouvel univers féerique à travers un mystérieux conduit. Mais lorsque les deux frères sont séparés, Mario s''engage dans une aventure trépidante pour retrouver Luigi. Dans sa quête, il peut compter sur l''aide du champignon Toad, habitant du Royaume Champignon, et les conseils avisés, en matière de techniques de combat, de la Princesse Peach, guerrière déterminée à la tête du Royaume. C''est ainsi que Mario réussit à mobiliser ses propres forces pour aller au bout de sa mission."),
    ('Jeanne du Barry', '01:56:00', 'Maïwenn', "Ce film est présenté en ouverture du Festival de Cannes 2023 Jeanne Vaubernier, fille du peuple avide de s''élever socialement, met à profit ses charmes pour sortir de sa condition. Son amant le comte Du Barry, qui s''enrichit largement grâce aux galanteries lucratives de Jeanne, souhaite la présenter au Roi. Il organise la rencontre via l''entremise de l''influent duc de Richelieu. Celle-ci dépasse ses attentes : entre Louis XV et Jeanne, c''est le coup de foudre… Avec la courtisane, le Roi retrouve le goût de vivre – à tel point qu''il ne peut plus se passer d''elle et décide d''en faire sa favorite officielle. Scandale : personne ne veut d''une fille des rues à la Cour.");


-- Insertion de données dans la table genre
INSERT INTO genre (name)
VALUES
    ('Action'),
    ('Animation'),
    ('Aventure'),
    ('Comédie'),
    ('Drame'),
    ('Famille'),
    ('Fantastique'),
    ('Historique'),
    ('Romance'),
    ('Science-fiction'),
    ('Thriller');


-- Insertion de données dans la table séance
INSERT INTO session (schedule, id_movie, id_movie_theater)
VALUES
    ('2023-06-02 21:00:00', 1, 1),
    ('2023-06-02 20:25:00', 1, 14),
    ('2023-06-02 20:30:00', 1, 12),
    ('2023-06-02 21:00:00', 2, 6),
    ('2023-06-02 21:00:00', 2, 3),
    ('2023-06-02 18:00:00', 2, 8),
    ('2023-06-02 20:30:00', 2, 16),
    ('2023-06-02 20:30:00', 2, 18),
    ('2023-06-02 18:30:00', 3, 4),
    ('2023-06-02 14:30:00', 3, 11),
    ('2023-06-02 20:45:00', 3, 8),
    ('2023-06-02 18:30:00', 4, 13),
    ('2023-06-02 21:00:00', 4, 17),
    ('2023-06-02 16:30:00', 5, 11),
    ('2023-06-02 16:30:00', 5, 17),
    ('2023-06-02 17:30:00', 5, 7),
    ('2023-06-02 17:30:00', 5, 2),
    ('2023-06-02 20:30:00', 6, 9),
    ('2023-06-02 20:45:00', 6, 11);


-- Insertion de données dans la table tarif
INSERT INTO rate (name, price)
VALUES
    ('Plein tarif', 9.20),
    ('Etudiant', 7.60),
    ('Moins de 14 ans', 5.90);


-- Insertion de données dans la table ticket
INSERT INTO ticket (type, id_session, id_rate)
VALUES
    ('Dématérialisé', 3, 1),
    ('Matérialisé', 14, 3),
    ('Matérialisé', 14, 1),
    ('Dématérialisé', 5, 2),
    ('Dématérialisé', 5, 2),
    ('Dématérialisé', 11, 1),
    ('Dématérialisé', 11, 1),
    ('Matérialisé', 19, 1),
    ('Matérialisé', 10, 2);


-- Insertion de données dans la table movie_genre
INSERT INTO movie_genre (id_genre, id_movie)
VALUES
    (1, 1),
    (3, 2),
    (6, 2),
    (7, 2),
    (1, 3),
    (7, 3),
    (10, 3),
    (1, 4),
    (10, 4),
    (2, 5),
    (4, 5),
    (6, 5),
    (5, 6),
    (8, 6),
    (9, 6);


-- Insertion de données dans la table utilisateur
INSERT INTO user (firstname, lastname, email, password)
VALUES
    ('Angèle', 'Balderston', 'abalderston0@ed.com', '$2y$10$hVaJmB4JnYOw7E/EmhYLNeby0NfPSabzHoYMPDCxctbg08zllWOMO'),
    ('Bernard', 'Coats', 'bcoats8@msn.com', '$2y$10$JzsoKUmRlcO7AoXt9fxCcuvYcMdCH9nRrMfYwZqJ/7.s2l/msvyoG'),
    ('Stéphanie', 'Pashley', 'spashley3@icq.com', '$2y$10$9J0mVHYmtZMgjILOpf0s7OFzXKwgkad7cXC86Xs2WXpS7ptarCTMW'),
    ('Bruce', 'Handslip', 'bhandslip10@scribd.com', '$2y$10$pZBHSfsarxacFvvRLk1Wl.gmrHKhoEHwc0DtCevHnAOFfBZFtikGu'),
    ('Garrek', 'Sidebotham', 'gsidebotham2r@ibm.com', '$2y$10$ubENk.hLjfCJoEIfP8BgTeBijurrM/vCtUx8JQ8enFNftRi5eeZv6'),
    ('Zoé', 'Blum', 'zblum4@psu.fr', '$2y$10$vx3BlswIoUzeWRwZsnhbReJ22Ow4FepCU2D0aGWF77sawUQOi1KWu');


-- Insertion de données dans la table cinema_user
INSERT INTO cinema_user (id_cinema, id_user)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (1, 3),
    (2, 4),
    (3, 5),
    (4, 6);
