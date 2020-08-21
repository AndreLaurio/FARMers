INSERT INTO users (user_id, email, password, user_type_id, first_name, last_name, birthday, num_followers, num_following, seller_name, valid_id_type_id, valid_id_path, location, rate, is_approved, boundary)
VALUES (10, 'johnvincenttayong@gmail.com', '', 1, 'John Vincent', 'Tayong', '1990-08-21', 0, 0, 'Benta ni Tayong', 5, '1500000009.png', 69, 0, 0, 'Tarlac'),
(11, 'shariepanganiban@gmail.com', '', 1, 'Sharie', 'Panganiban', '1992-01-15', 10, 0, 'Bili na! Tindahan', 7, '1500000010.png', 69, 0, 0, 'Manila');


UPDATE stocks SET value_start = 1099.67, value_end = 1099.67 WHERE value_start = 1099;
UPDATE stocks SET value_start = 891.40, value_end = 891.40 WHERE value_start = 891;
UPDATE stocks SET value_start = 808.55, value_end = 808.55 WHERE value_start = 808;

UPDATE stocks SET date_end = '2019-07-31' WHERE date_start = '2019-07-01'