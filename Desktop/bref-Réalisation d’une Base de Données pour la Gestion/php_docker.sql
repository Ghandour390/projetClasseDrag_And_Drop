-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : mer. 11 déc. 2024 à 22:56
-- Version du serveur : 8.0.40
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `php_docker`
--

-- --------------------------------------------------------

--
-- Structure de la table `BDE`
--

CREATE TABLE `BDE` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `id` int NOT NULL,
  `dat` date NOT NULL,
  `sujet` varchar(255) NOT NULL,
  `bdeID` int NOT NULL,
  `sponsorID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participent`
--

CREATE TABLE `participent` (
  `id` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `evenementID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `php_docker_table`
--

CREATE TABLE `php_docker_table` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `php_docker_table`
--

INSERT INTO `php_docker_table` (`id`, `title`, `body`, `date_created`) VALUES
(1, 'first post', 'first body text', '2022-09-01'),
(2, 'second post', 'second body text', '2022-09-03');

-- --------------------------------------------------------

--
-- Structure de la table `seponsor`
--

CREATE TABLE `seponsor` (
  `id` int NOT NULL,
  `telephone` varchar(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `nom_societie` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `BDE`
--
ALTER TABLE `BDE`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_evenment_sponsor` (`sponsorID`),
  ADD KEY `FK_evenment_bde` (`bdeID`);

--
-- Index pour la table `participent`
--
ALTER TABLE `participent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_evenment_participent` (`evenementID`);

--
-- Index pour la table `php_docker_table`
--
ALTER TABLE `php_docker_table`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `seponsor`
--
ALTER TABLE `seponsor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `BDE`
--
ALTER TABLE `BDE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participent`
--
ALTER TABLE `participent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `php_docker_table`
--
ALTER TABLE `php_docker_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `seponsor`
--
ALTER TABLE `seponsor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `BDE`
--
ALTER TABLE `BDE`
  ADD CONSTRAINT `FK_evenemment_BDE` FOREIGN KEY (`id`) REFERENCES `evenemment` (`id`);

--
-- Contraintes pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD CONSTRAINT `FK_evenment_bde` FOREIGN KEY (`bdeID`) REFERENCES `BDE` (`id`),
  ADD CONSTRAINT `FK_evenment_sponsor` FOREIGN KEY (`sponsorID`) REFERENCES `seponsor` (`id`);

--
-- Contraintes pour la table `participent`
--
ALTER TABLE `participent`
  ADD CONSTRAINT `FK_evenemment_participent` FOREIGN KEY (`evenementID`) REFERENCES `evenemment` (`id`),
  ADD CONSTRAINT `FK_evenment_participent` FOREIGN KEY (`evenementID`) REFERENCES `evenements` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
