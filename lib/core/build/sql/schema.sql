
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- chart
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `chart`;

CREATE TABLE `chart`
(
	`id` VARCHAR(5) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`theme` VARCHAR(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`last_modified_at` DATETIME NOT NULL,
	`metadata` VARCHAR(4096) NOT NULL,
	`deleted` TINYINT(1) DEFAULT 0,
	`deleted_at` DATETIME,
	`author_id` INTEGER NOT NULL,
	`show_in_gallery` TINYINT(1) DEFAULT 0,
	PRIMARY KEY (`id`),
	INDEX `chart_FI_1` (`author_id`),
	CONSTRAINT `chart_FK_1`
		FOREIGN KEY (`author_id`)
		REFERENCES `user` (`id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- user
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`
(
	`id` INTEGER NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(512) NOT NULL,
	`pwd` VARCHAR(512) NOT NULL,
	`token` VARCHAR(512) NOT NULL,
	`role` TINYINT DEFAULT 2 NOT NULL,
	`language` VARCHAR(5) DEFAULT 'en',
	`created_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;