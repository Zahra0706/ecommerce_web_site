-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 14 déc. 2023 à 20:58
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce_web_site`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `commande_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `telephone`, `adresse`, `email`, `ville`, `code_postal`, `commande_id`) VALUES
(59, 'Chokri', 'Zahra', '0600610294', 'derb ghallef', 'zahraechokrii@gmail.com', 'El Jadida', '24000', 69),
(60, 'Aatfaoui', 'Aya', '0630168993', 'hay salam', 'ayaaatfaoui38@gmail.com', 'El Jadida', '24000', 70);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `commande_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_commande` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`commande_id`, `user_id`, `date_commande`) VALUES
(69, 4, '2023-12-14 18:43:27'),
(70, 5, '2023-12-14 18:46:22');

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `commande_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`commande_id`, `product_id`, `quantite`) VALUES
(69, 44, 1),
(69, 47, 2),
(69, 51, 1),
(70, 45, 1),
(70, 49, 3);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `material` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `cheminImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `material`, `capacity`, `price`, `categorie`, `stock`, `cheminImage`) VALUES
(43, 'Bouteille rose', 'Plastique', 500, '39.99', 'Plastique', 100, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.46_f95634ff.jpg'),
(44, 'Bouteille noire', 'Verre', 300, '29.99', 'Verre', 39, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.45_646a481e.jpg'),
(45, 'Bouteilles', 'Verre', 400, '49.00', 'Paque ', 39, 'images/WhatsApp Image 2023-12-07 Ã  16.31.31_53b63c66.jpg'),
(46, 'Bouteille transparente', 'Verre', 300, '29.00', 'Verre Transparente', 50, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.35_d0e18bb5.jpg'),
(47, 'Bouteille ', 'Verre', 500, '25.00', 'Verre ', 38, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.34_f8c57636.jpg'),
(48, 'Bouteille ', 'Verre plastifie', 300, '29.99', 'Verre plastifie', 30, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.41_74877871.jpg'),
(49, 'Bouteille ', 'Verre', 500, '25.00', 'Verre', 47, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.36_74f92da0.jpg'),
(50, 'Bouteille ', 'Verre', 500, '29.99', 'Verre', 50, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.31_f8b07391.jpg'),
(51, 'Bouteille transparente', 'Verre', 500, '29.99', 'Verre', 49, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.32_d6a50378.jpg'),
(52, 'Bouteille nike', 'Plastique', 500, '35.00', 'Plastique', 33, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.41_40b0c1f4.jpg'),
(53, 'Bouteille transparente', 'Verre', 300, '29.00', 'Verre', 30, 'images/WhatsApp Image 2023-12-07 Ã  22.09.02_1d007a46.jpg'),
(54, 'Bouteille ', 'Plastique', 500, '39.99', 'Verre plastifie', 300, 'uploadss/WhatsApp Image 2023-12-07 Ã  16.31.44_25046e48.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `logemail` varchar(100) NOT NULL,
  `logpass` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `phonenumber`, `logemail`, `logpass`, `profile_picture`, `isAdmin`) VALUES
(2, 'Ayaa', 'Aatfaoui', '0630168993', 'ayaaatfaoui38@gmail.com', '5678', 'uploads/2_profile_1702379303.jpg', 0),
(3, 'Soumaya', 'MOUBANE', '0649284243', 'moubanesoumaya@gmail.com', '91011', 'uploads/3_profile_1701509473.jpg', 0),
(4, 'zahra', 'chokri', '0600610294', 'zahraechokrii@gmail.com', 'hhhhh', 'uploads/4_profile_1702579338.jpg', 0),
(5, 'Zahra', 'chokrii', '0600610294', 'zahraechokrii@gmail.com', '777', 'uploads/5_profile_1702579476.jpg', 0),
(15, 'zahra', 'chokri', '0600610294', 'zahraechokrii@gmail.com', '1234', NULL, 1),
(17, 'aya', 'aatfaoui', '0630168993', 'ayaaatfaoui38@gmail.com', '5678', NULL, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_commande_id` (`commande_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`commande_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`commande_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `commande_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `details_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `details_commande_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
