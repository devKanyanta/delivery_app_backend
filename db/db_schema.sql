CREATE TABLE `parcel_deliveries`(
    `delivery_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `oder_id` BIGINT NOT NULL,
    `driver_id` BIGINT NOT NULL,
    `pickup_location` TEXT NOT NULL,
    `dropoff_location` TEXT NOT NULL,
    `delivery_status` LINESTRING NOT NULL,
    `delivery_date` DATETIME NOT NULL,
    `delivery_note` TEXT NOT NULL
);
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` TEXT NOT NULL,
    `username` TEXT NOT NULL,
    `password` LINESTRING NOT NULL,
    `phone_number` INT NOT NULL,
    `address` TEXT NOT NULL,
    `role` TEXT NOT NULL
);
CREATE TABLE `restaurants`(
    `restaurant_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `contact_number` TEXT NOT NULL,
    `menu_id` BIGINT NOT NULL
);
CREATE TABLE `menu_item`(
    `item_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `restaurant_id` BIGINT NOT NULL,
    `name` LINESTRING NOT NULL,
    `description` MULTILINESTRING NOT NULL,
    `price` LINESTRING NOT NULL
);
CREATE TABLE `oders`(
    `order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `restaurant_id` BIGINT NOT NULL,
    `total_amount` LINESTRING NOT NULL,
    `oder_status` LINESTRING NOT NULL,
    `oder_date` DATETIME NOT NULL,
    `delivery_address` TEXT NOT NULL,
    `payment_status` TINYINT(1) NOT NULL
);
CREATE TABLE `drivers`(
    `driver_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `vehicle_type` TEXT NOT NULL,
    `license_plate` TEXT NOT NULL,
    `availability_status` TINYINT(1) NOT NULL,
    `latitude` DOUBLE(8, 2) NOT NULL,
    `longitude` BIGINT NOT NULL
);
CREATE TABLE `food_delivery`(
    `delivery_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT NOT NULL,
    `driver_id` BIGINT NOT NULL,
    `delivery_status` LINESTRING NOT NULL,
    `delivery_date` DATETIME NOT NULL,
    `delivery_note` TEXT NOT NULL
);
ALTER TABLE
    `oders` ADD CONSTRAINT `oders_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `restaurants` ADD CONSTRAINT `restaurants_menu_id_foreign` FOREIGN KEY(`menu_id`) REFERENCES `menu_item`(`item_id`);
ALTER TABLE
    `drivers` ADD CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `food_delivery` ADD CONSTRAINT `food_delivery_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `oders`(`order_id`);
ALTER TABLE
    `parcel_deliveries` ADD CONSTRAINT `parcel_deliveries_driver_id_foreign` FOREIGN KEY(`driver_id`) REFERENCES `drivers`(`driver_id`);
ALTER TABLE
    `parcel_deliveries` ADD CONSTRAINT `parcel_deliveries_oder_id_foreign` FOREIGN KEY(`oder_id`) REFERENCES `oders`(`order_id`);
ALTER TABLE
    `menu_item` ADD CONSTRAINT `menu_item_restaurant_id_foreign` FOREIGN KEY(`restaurant_id`) REFERENCES `restaurants`(`restaurant_id`);
ALTER TABLE
    `food_delivery` ADD CONSTRAINT `food_delivery_driver_id_foreign` FOREIGN KEY(`driver_id`) REFERENCES `drivers`(`driver_id`);
ALTER TABLE
    `oders` ADD CONSTRAINT `oders_restaurant_id_foreign` FOREIGN KEY(`restaurant_id`) REFERENCES `restaurants`(`restaurant_id`);