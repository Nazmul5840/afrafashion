/* 31/08/2020 added by mehedi */
ALTER TABLE `jilancollection`  ADD `price` DECIMAL(10,2) NOT NULL DEFAULT '0'  AFTER `description`,  ADD `dimension` TEXT NULL DEFAULT NULL  AFTER `price`,  ADD `featured` VARCHAR(255) NULL DEFAULT NULL  AFTER `dimension`;

ALTER TABLE `jilanmedia`  ADD `video_name` VARCHAR(128) NULL DEFAULT NULL  AFTER `title`;

/* 01-08-2020 */
ALTER TABLE `jilancollection`  ADD `model_size` VARCHAR(56) NULL DEFAULT NULL  AFTER `featured`;


/* 12-11-2020 */
ALTER TABLE `jilancollection`  ADD `new_arrival` ENUM('yes','no') NOT NULL DEFAULT 'no'  AFTER `model_size`;
ALTER TABLE `jilancollection`  ADD `cart_photo` VARCHAR(60) NULL DEFAULT NULL  AFTER `model_size`;