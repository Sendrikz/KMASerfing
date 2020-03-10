CREATE TABLE `serfing`.`role` (
  id INT NOT NULL AUTO_INCREMENT,
  description varchar(255) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE `serfing`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `birthday` DATETIME NULL,
  `gender` VARCHAR(255) NULL,
  `university_role` VARCHAR(255) NULL,
  `living_place` VARCHAR(255) NULL,
  `phone` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `registration_date` DATETIME NULL,
  `notes` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `serfing`.`user_role` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `role_user_fk_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `user_role_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `serfing`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `role_user_fk`
    FOREIGN KEY (`role_id`)
    REFERENCES `serfing`.`role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `serfing`.`friendship` (
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `friend_id`),
  INDEX `friend_user_fk_idx` (`friend_id` ASC) VISIBLE,
  CONSTRAINT `user_friend_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `serfing`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `friend_user_fk`
    FOREIGN KEY (`friend_id`)
    REFERENCES `serfing`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `serfing`.`room` (
  `id` INT NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `roomcol` VARCHAR(255) NOT NULL,
  `people_count` VARCHAR(255) NOT NULL,
  `dates` VARCHAR(255) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_owner_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_owner_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `serfing`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `serfing`.`room_request` (
  `id` INT NOT NULL,
  `date_in` DATETIME NOT NULL,
  `date_out` DATETIME NOT NULL,
  `status` VARCHAR(255) NULL,
  `created` DATETIME NULL,
  `comments` VARCHAR(255) NULL,
  `room_id` INT NOT NULL,
  `owner_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `room_request_fk_idx` (`room_id` ASC) VISIBLE,
  INDEX `owner_request_fk_idx` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `room_request_fk`
    FOREIGN KEY (`room_id`)
    REFERENCES `serfing`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owner_request_fk`
    FOREIGN KEY (`owner_id`)
    REFERENCES `serfing`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



 CREATE TABLE `serfing`.`review` (
   `id` INT NOT NULL,
   `comment` VARCHAR(255) NOT NULL,
   `rate` INT NOT NULL,
   `room_request_id` INT NULL,
   PRIMARY KEY (`id`),
   INDEX `request_review_fk_idx` (`room_request_id` ASC) VISIBLE,
   CONSTRAINT `request_review_fk`
     FOREIGN KEY (`room_request_id`)
     REFERENCES `serfing`.`room_request` (`id`)
     ON DELETE CASCADE
     ON UPDATE CASCADE);


CREATE TABLE `serfing`.`photo` (
  `id` INT NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `user_id` INT NULL,
  `room_id` INT NULL,
  `review_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_photo_fk_idx` (`user_id` ASC) VISIBLE,
  INDEX `room_photo_fk_idx` (`room_id` ASC) VISIBLE,
  INDEX `review_photo_fk_idx` (`review_id` ASC) VISIBLE,
  CONSTRAINT `user_photo_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `serfing`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `room_photo_fk`
    FOREIGN KEY (`room_id`)
    REFERENCES `serfing`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `review_photo_fk`
    FOREIGN KEY (`review_id`)
    REFERENCES `serfing`.`review` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

