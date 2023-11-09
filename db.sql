--
-- Base de données : `prendsTaGoDb`
--

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `roles` JSON,
    `password` VARCHAR(255) NOT NULL,
    `firstName` VARCHAR(255),
    `lastName` VARCHAR(255),
    `phone` VARCHAR(20),
    `age` INT,
    `gender` VARCHAR(10),
    `address_id` INT,
    `creationDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `newsLetter` TINYINT,
    `verified` TINYINT,
    `status` TINYINT,
    FOREIGN KEY (`address_id`) REFERENCES `Address`(`address_id`)
);

-- --------------------------------------------------------

--
-- Structure de la table `Adress`
--

DROP TABLE IF EXISTS `Adress`;
CREATE TABLE IF NOT EXISTS `Adress` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `address` VARCHAR(255),
    `city` VARCHAR(255),
    `code` VARCHAR(20),
    `country` VARCHAR(255),
    `status` TINYINT
);

-- --------------------------------------------------------

--
-- Structure de la table `Car`
--

DROP TABLE IF EXISTS `Car`;
CREATE TABLE IF NOT EXISTS `Car` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `brand` VARCHAR(255),
    `passengers` INT,
    `price` INT,
    `manual` TINYINT,
    `type` VARCHAR(255),
    `minAge` INT,
    `nbDoor` INT,
    `location` VARCHAR(255),
    `unavailables` JSON,
    `status` TINYINT
);

-- --------------------------------------------------------

--
-- Structure de la table `Pilote`
--

DROP TABLE IF EXISTS `Pilote`;
CREATE TABLE IF NOT EXISTS `Pilote` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `firstName` VARCHAR(255),
    `lastName` VARCHAR(255),
    `email` VARCHAR(255),
    `phone` VARCHAR(20),
    `status` TINYINT
);

-- --------------------------------------------------------

--
-- Structure de la table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
CREATE TABLE IF NOT EXISTS `Reservation` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `carId` INT,
    `userId` INT,
    `protection` TINYINT,
    `price` INT,
    `beginning` DATE,
    `ending` DATE,
    `nbDoor` INT,
    `finish` TINYINT,
    `beginningState` VARCHAR(255),
    `endingState` VARCHAR(255),
    `addFees` FLOAT,
    `status` TINYINT,
    FOREIGN KEY (`carId`) REFERENCES `Car`(`id`),
    FOREIGN KEY (`userId`) REFERENCES `User`(`id`)
);

-- --------------------------------------------------------

--
-- Structure de la table `Commentary`
--

DROP TABLE IF EXISTS `Commentary`;
CREATE TABLE IF NOT EXISTS `Commentary` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `carId` INT,
    `userId` INT,
    `commentary` TEXT,
    `rank` INT,
    `creationDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `status` TINYINT,
    FOREIGN KEY (`carId`) REFERENCES `Car`(`id`),
    FOREIGN KEY (`userId`) REFERENCES `User`(`id`)
);