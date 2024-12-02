-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 02 déc. 2024 à 14:43
-- Version du serveur : 10.11.6-MariaDB-0+deb12u1
-- Version de PHP : 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `arcane_game`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `role` enum('superadmin','moderator') DEFAULT 'moderator',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`, `email`, `full_name`, `role`, `created_at`, `last_login`, `is_active`) VALUES
(1, 'admin', '$2y$10$A8hQyePbz8kjLhPuGZMkO.9KyW3Tq/nP8bRT2SfyIykbOllvToX0y', 'admin@example.com', 'Admin User', 'superadmin', '2024-12-02 08:14:17', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `health_points` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `special_ability` text DEFAULT NULL,
  `city_image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cards`
--

INSERT INTO `cards` (`id`, `name`, `image`, `health_points`, `attack`, `defense`, `special_ability`, `city_image`, `price`) VALUES
(1, 'Vi', 'images/cards/vi.jpg', 120, 30, 10, 'Force brute – Double les dégâts pendant 3 tours.', 'images/villes/zaun.jpg', 1000),
(2, 'Jinx', 'images/cards/jinx.jpg', 100, 25, 5, 'Folie – Lance une attaque surprise tous les 2 tours.', 'images/villes/zaun.jpg', 2000),
(3, 'Caitlyn', 'images/cards/caitlyn.jpg', 110, 20, 15, 'Tir précis – Augmente les chances de critique.', 'images/villes/piltover.jpg', 3000),
(4, 'Silco', 'images/cards/silco.jpg', 150, 20, 25, 'Manipulation – Restaure 10 PV tous les 3 tours.', 'images/villes/zaun.jpg', 1500),
(5, 'Jayce', 'images/cards/jayce.jpg', 130, 35, 12, 'Transformation – Change de forme, doublant les dégâts d\'attaque à chaque transformation.', 'images/villes/piltover.jpg', 2500),
(6, 'Ekko', 'images/cards/ekko.jpg', 110, 28, 12, 'Réwind – Annule les dégâts subis au tour précédent.', 'images/villes/zaun.jpg', 3500),
(7, 'Vander/Warwick', 'images/cards/vander.jpg', 180, 15, 40, 'Gardien – Réduit les dégâts subis de 50% pendant 2 tours.', 'images/villes/zaun.jpg', 4000),
(8, 'Heimerdinger', 'images/cards/heimerdinger.png', 90, 18, 18, 'Tourelle – Place une tourelle qui attaque chaque tour.', 'images/villes/piltover.jpg', 6000),
(9, 'Orianna', 'images/cards/orianna.jpg', 95, 22, 20, 'Ball d\'Orianna – Déplace la balle sur le champ de bataille pour des dégâts supplémentaires.', 'images/villes/piltover.jpg', 4500),
(10, 'Viktor', 'images/cards/viktor.jpg', 140, 20, 35, 'Système de perfection – Augmente son attaque chaque fois qu\'il subit des dégâts.', 'images/villes/zaun.jpg', 5000),
(11, 'Ziggs', 'images/cards/ziggs.jpg', 100, 30, 5, 'Explosion – Fait exploser une zone, infligeant des dégâts à toutes les cartes ennemies.', 'images/villes/zaun.jpg', 5500),
(12, 'Sevika', 'images/cards/sevika.png', 140, 25, 20, 'Force mécanique – Augmente la défense chaque fois qu\'elle attaque.', 'images/villes/zaun.jpg', 2000),
(13, 'Mel', 'images/cards/mel.jpg', 100, 18, 30, 'Diplomatie – Réduit les attaques ennemies de 50% pendant un tour.', 'images/villes/piltover.jpg', 1000),
(14, 'Jhin', 'images/cards/jhin.jpg', 80, 40, 10, 'Tir fatal – Augmente l\'attaque chaque fois qu\'un ennemi est éliminé.', 'images/villes/noxus.jpg', 1500),
(15, 'Singed', 'images/cards/singed.jpg', 150, 20, 10, 'Gaz toxique – Dégâts de poison chaque tour pour les cartes ennemies proches.', 'images/villes/zaun.jpg', 2500),
(16, 'Lux', 'images/cards/lux.jpg', 110, 22, 15, 'Lumière radieuse – Lance une attaque de lumière qui inflige des dégâts à toutes les cartes ennemies.', 'images/villes/demacia.jpg', 3000),
(17, 'Kennen', 'images/cards/kennen.jpg', 85, 30, 12, 'Tempête d\'éclairs – Réduit la défense ennemie de 20% pendant 2 tours.', 'images/villes/ixtal.jpg', 4000),
(18, 'Zed', 'images/cards/zed.jpg', 100, 35, 10, 'Ombres – Inflige des dégâts supplémentaires à chaque attaque surprise.', 'images/villes/ionia.jpg', 3500),
(19, 'Teemo', 'images/cards/teemo.jpg', 75, 25, 5, 'Champignon empoisonné – Place un champignon qui inflige des dégâts de poison pendant 3 tours.', 'images/villes/bandle_city.jpg', 4500),
(20, 'Blitzcrank', 'images/cards/blitzcrank.jpg', 140, 20, 30, 'Attraper – Attire une carte ennemie et inflige des dégâts supplémentaires.', 'images/villes/zaun.jpg', 6000),
(21, 'Riven', 'images/cards/riven.jpg', 120, 35, 10, 'Epée brisée – Augmente les dégâts à chaque fois que sa santé descend en dessous de 50%.', 'images/villes/noxus.jpg', 5000);

-- --------------------------------------------------------

--
-- Structure de la table `decks`
--

CREATE TABLE `decks` (
  `deck_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deck_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `decks`
--

INSERT INTO `decks` (`deck_id`, `user_id`, `deck_name`) VALUES
(9, 4, 'Hugo');

-- --------------------------------------------------------

--
-- Structure de la table `deck_cards`
--

CREATE TABLE `deck_cards` (
  `deck_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `deck_cards`
--

INSERT INTO `deck_cards` (`deck_id`, `card_id`) VALUES
(9, 1),
(9, 2),
(9, 5);

-- --------------------------------------------------------

--
-- Structure de la table `purshased_cards`
--

CREATE TABLE `purshased_cards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `date_achat` datetime DEFAULT current_timestamp(),
  `quantite` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `bio` text DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `shards` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `bio`, `profile_picture`, `shards`) VALUES
(4, 'souyak', 'souyak94@gmail.com', '$2y$10$nQx11meHYIGPH54cgrgxl.keTJBY6hcnE7.7.G3IbmCcTHAVoCSk6', '2024-11-26 10:26:17', '', 'images/default_profile_picture.jpg', 100);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `decks`
--
ALTER TABLE `decks`
  ADD PRIMARY KEY (`deck_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `deck_cards`
--
ALTER TABLE `deck_cards`
  ADD PRIMARY KEY (`deck_id`,`card_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Index pour la table `purshased_cards`
--
ALTER TABLE `purshased_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`card_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `decks`
--
ALTER TABLE `decks`
  MODIFY `deck_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `purshased_cards`
--
ALTER TABLE `purshased_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `decks`
--
ALTER TABLE `decks`
  ADD CONSTRAINT `decks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `deck_cards`
--
ALTER TABLE `deck_cards`
  ADD CONSTRAINT `deck_cards_ibfk_1` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`deck_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deck_cards_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purshased_cards`
--
ALTER TABLE `purshased_cards`
  ADD CONSTRAINT `purshased_cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purshased_cards_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
