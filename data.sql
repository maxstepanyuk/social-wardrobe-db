-- PostgreSQL

-- data

INSERT INTO "user" (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3'),
('user4', 'user4@example.com', 'password4'),
('user5', 'user5@example.com', 'password5');

INSERT INTO "user" (username, email, password, registration_date) VALUES 
('john_doe', 'john@example.com', 'password1', '2024-01-01 08:00:00'),
('jane_smith', 'jane@example.com', 'password2', '2024-01-02 09:00:00'),
('alex_jones', 'alex@example.com', 'password3', '2024-01-03 10:00:00'),
('emily_wilson', 'emily@example.com', 'password4', '2024-01-04 11:00:00'),
('michael_clark', 'michael@example.com', 'password5', '2024-01-05 12:00:00'),
('sarah_brown', 'sarah@example.com', 'password6', '2024-01-06 13:00:00'),
('david_thomas', 'david@example.com', 'password7', '2024-01-07 14:00:00'),
('laura_martin', 'laura@example.com', 'password8', '2024-01-08 15:00:00'),
('chris_hill', 'chris@example.com', 'password9', '2024-01-09 16:00:00'),
('jessica_scott', 'jessica@example.com', 'password10', '2024-01-10 17:00:00'),
('matt_wright', 'matt@example.com', 'password11', '2024-01-11 18:00:00'),
('olivia_green', 'olivia@example.com', 'password12', '2024-01-12 19:00:00'),
('ryan_evans', 'ryan@example.com', 'password13', '2024-01-13 20:00:00'),
('hannah_king', 'hannah@example.com', 'password14', '2024-01-14 21:00:00'),
('tom_hall', 'tom@example.com', 'password15', '2024-01-15 22:00:00'),
('lucy_adams', 'lucy@example.com', 'password16', '2024-01-16 23:00:00'),
('peter_wilson', 'peter@example.com', 'password17', '2024-01-17 00:00:00'),
('rachel_baker', 'rachel@example.com', 'password18', '2024-01-18 01:00:00'),
('jack_carter', 'jack@example.com', 'password19', '2024-01-19 02:00:00'),
('amy_morris', 'amy@example.com', 'password20', '2024-01-20 03:00:00');

SELECT * FROM "user";

INSERT INTO "gender" (name) VALUES
('Male'),
('Female'),
('Other');

SELECT * FROM "gender";


INSERT INTO "profile" (user_id, birthdate, contact, address, gender_id, biography, avatar) VALUES
(1, '1990-01-01', '+123456789', 'Address 1', 1, 'Bio for user 1', 'avatar1.jpg'),
(2, '1991-02-02', '+987654321', 'Address 2', 2, 'Bio for user 2', 'avatar2.jpg'),
(3, '1992-03-03', '+111222333', 'Address 3', 1, 'Bio for user 3', 'avatar3.jpg'),
(4, '1993-04-04', '+444555666', 'Address 4', 2, 'Bio for user 4', 'avatar4.jpg'),
(5, '1994-05-05', '+777888999', 'Address 5', 1, 'Bio for user 5', 'avatar5.jpg');

INSERT INTO "profile" (user_id, birthdate, contact, address, gender_id, biography, avatar) VALUES
(6, '1995-06-06', '+111111111', 'Address 6', 1, 'Bio for user 6', 'avatar6.jpg'),
(7, '1996-07-07', '+222222222', 'Address 7', 2, 'Bio for user 7', 'avatar7.jpg'),
(8, '1997-08-08', '+333333333', 'Address 8', 1, 'Bio for user 8', 'avatar8.jpg'),
(9, '1998-09-09', '+444444444', 'Address 9', 2, 'Bio for user 9', 'avatar9.jpg'),
(10, '1999-10-10', '+555555555', 'Address 10', 1, 'Bio for user 10', 'avatar10.jpg'),
(11, '2000-11-11', '+666666666', 'Address 11', 1, 'Bio for user 11', 'avatar11.jpg'),
(12, '2001-12-12', '+777777777', 'Address 12', 2, 'Bio for user 12', 'avatar12.jpg'),
(13, '2002-01-01', '+888888888', 'Address 13', 1, 'Bio for user 13', 'avatar13.jpg'),
(14, '2003-02-02', '+999999999', 'Address 14', 2, 'Bio for user 14', 'avatar14.jpg'),
(15, '2004-03-03', '+1010101010', 'Address 15', 1, 'Bio for user 15', 'avatar15.jpg'),
(16, '2005-04-04', '+1111111111', 'Address 16', 2, 'Bio for user 16', 'avatar16.jpg'),
(17, '2006-05-05', '+1212121212', 'Address 17', 1, 'Bio for user 17', 'avatar17.jpg'),
(18, '2007-06-06', '+1313131313', 'Address 18', 2, 'Bio for user 18', 'avatar18.jpg'),
(19, '2008-07-07', '+1414141414', 'Address 19', 1, 'Bio for user 19', 'avatar19.jpg'),
(20, '2009-08-08', '+1515151515', 'Address 20', 2, 'Bio for user 20', 'avatar20.jpg'),
(21, '2010-09-09', '+1616161616', 'Address 21', 1, 'Bio for user 21', 'avatar21.jpg'),
(22, '2011-10-10', '+1717171717', 'Address 22', 2, 'Bio for user 22', 'avatar22.jpg'),
(23, '2012-11-11', '+1818181818', 'Address 23', 1, 'Bio for user 23', 'avatar23.jpg'),
(24, '2013-12-12', '+1919191919', 'Address 24', 2, 'Bio for user 24', 'avatar24.jpg'),
(25, '2014-01-01', '+2020202020', 'Address 25', 1, 'Bio for user 25', 'avatar25.jpg');

select * from "profile";

INSERT INTO "garment_type" (name) VALUES
('Shirt'),
('Pants'),
('Dress'),
('Skirt'),
('Jacket');

INSERT INTO "garment_type" (name) VALUES
('T-Shirt'),
('Blouse'),
('Shorts'),
('Coat'),
('Sweater'),
('Suit'),
('Trousers'),
('Top'),
('Jeans'),
('Jumper'),
('Blazer'),
('Dress Shirt'),
('Leggings'),
('Cardigan'),
('Chinos'),
('Hoodie'),
('Parka'),
('Vest');

select * from garment_type;



INSERT INTO garment (user_id, garment_type_id, photo, date_worn) VALUES
(1, 1, 'shirt1.jpg', '2024-01-01'),
(2, 2, 'pants1.jpg', '2024-01-02'),
(3, 3, 'dress1.jpg', '2024-01-03'),
(4, 4, 'skirt1.jpg', '2024-01-04'),
(5, 5, 'jacket1.jpg', '2024-01-05');

INSERT INTO garment (user_id, garment_type_id, photo, date_worn) VALUES
(6, 6, 'shirt2.jpg', '2024-01-06'),
(7, 7, 'pants2.jpg', '2024-01-07'),
(8, 8, 'dress2.jpg', '2024-01-08'),
(9, 9, 'skirt2.jpg', '2024-01-09'),
(10, 10, 'jacket2.jpg', '2024-01-10'),
(11, 1, 'shirt3.jpg', '2024-01-11'),
(12, 2, 'pants3.jpg', '2024-01-12'),
(13, 3, 'dress3.jpg', '2024-01-13'),
(14, 4, 'skirt3.jpg', '2024-01-14'),
(15, 5, 'jacket3.jpg', '2024-01-15'),
(16, 6, 'shirt4.jpg', '2024-01-16'),
(17, 7, 'pants4.jpg', '2024-01-17'),
(18, 8, 'dress4.jpg', '2024-01-18'),
(19, 9, 'skirt4.jpg', '2024-01-19'),
(20, 10, 'jacket4.jpg', '2024-01-20'),
(21, 1, 'shirt5.jpg', '2024-01-21'),
(22, 2, 'pants5.jpg', '2024-01-22'),
(23, 3, 'dress5.jpg', '2024-01-23'),
(24, 4, 'skirt5.jpg', '2024-01-24'),
(25, 5, 'jacket5.jpg', '2024-01-25');

select * from garment;


INSERT INTO outfit_type (name) VALUES
('Casual'),
('Formal'),
('Sportswear'),
('Business'),
('Party');

INSERT INTO outfit_type (name) VALUES
('Beachwear'),
('Athleisure'),
('Smart Casual'),
('Workout'),
('Evening Wear'),
('Sleepwear'),
('Streetwear'),
('Business Casual'),
('Festival'),
('Vacation'),
('Loungewear'),
('Cocktail'),
('Outdoor'),
('Travel'),
('Gym'),
('Performance'),
('Wedding'),
('Clubbing'),
('Date Night'),
('Interview');

select * from outfit_type;

INSERT INTO outfits (user_id, name, outfit_type_id, date_worn, cover_photo) VALUES
(1, 'Outfit 1', 1, '2024-01-01', 'outfit1.jpg'),
(2, 'Outfit 2', 2, '2024-01-02', 'outfit2.jpg'),
(3, 'Outfit 3', 3, '2024-01-03', 'outfit3.jpg'),
(4, 'Outfit 4', 4, '2024-01-04', 'outfit4.jpg'),
(5, 'Outfit 5', 5, '2024-01-05', 'outfit5.jpg');

INSERT INTO outfits (user_id, name, outfit_type_id, date_worn, cover_photo) VALUES
(6, 'Outfit 6', 6, '2024-01-06', 'outfit6.jpg'),
(7, 'Outfit 7', 7, '2024-01-07', 'outfit7.jpg'),
(8, 'Outfit 8', 8, '2024-01-08', 'outfit8.jpg'),
(9, 'Outfit 9', 9, '2024-01-09', 'outfit9.jpg'),
(10, 'Outfit 10', 10, '2024-01-10', 'outfit10.jpg'),
(11, 'Outfit 11', 11, '2024-01-11', 'outfit11.jpg'),
(12, 'Outfit 12', 12, '2024-01-12', 'outfit12.jpg'),
(13, 'Outfit 13', 13, '2024-01-13', 'outfit13.jpg'),
(14, 'Outfit 14', 14, '2024-01-14', 'outfit14.jpg'),
(15, 'Outfit 15', 15, '2024-01-15', 'outfit15.jpg'),
(16, 'Outfit 16', 16, '2024-01-16', 'outfit16.jpg'),
(17, 'Outfit 17', 17, '2024-01-17', 'outfit17.jpg'),
(18, 'Outfit 18', 18, '2024-01-18', 'outfit18.jpg'),
(19, 'Outfit 19', 19, '2024-01-19', 'outfit19.jpg'),
(20, 'Outfit 20', 20, '2024-01-20', 'outfit20.jpg'),
(21, 'Outfit 21', 1, '2024-01-21', 'outfit21.jpg'),
(22, 'Outfit 22', 2, '2024-01-22', 'outfit22.jpg'),
(23, 'Outfit 23', 3, '2024-01-23', 'outfit23.jpg'),
(24, 'Outfit 24', 4, '2024-01-24', 'outfit24.jpg'),
(25, 'Outfit 25', 5, '2024-01-25', 'outfit25.jpg');

select * from outfits;


-- TODO

INSERT INTO garments_outfits (garment_id , outfit_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(2, 2),
(1, 3),
(4, 4),
(5, 5);

INSERT INTO garments_outfits (garment_id , outfit_id) VALUES
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
(6, 11),
(7, 12),
(8, 13),
(9, 14),
(10, 15),
(11, 16),
(12, 17),
(13, 18),
(14, 19),
(15, 20),
(16, 21),
(17, 22),
(18, 23),
(19, 24),
(20, 25),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

select * from garments_outfits;


INSERT INTO followers (follower_id, following_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1),
(1, 5);

INSERT INTO followers (follower_id, following_id) VALUES
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17),
(17, 18),
(18, 19),
(19, 20),
(20, 21),
(21, 22),
(22, 23),
(23, 24),
(24, 25),
(25, 1);

select * from followers;


INSERT INTO ratings (outfit_id, user_id, rating) VALUES
(1, 2, 4),
(2, 3, 5),
(3, 4, 3),
(4, 5, 4),
(5, 1, 5);

INSERT INTO ratings (outfit_id, user_id, rating) VALUES
(6, 7, 4),
(7, 8, 3),
(8, 9, 5),
(9, 10, 4),
(10, 11, 2),
(11, 12, 4),
(12, 13, 3),
(13, 14, 5),
(14, 15, 4),
(15, 16, 3),
(16, 17, 5),
(17, 18, 4),
(18, 19, 3),
(19, 20, 2),
(20, 21, 4),
(21, 22, 5),
(22, 23, 4),
(23, 24, 3),
(24, 25, 5),
(25, 1, 4);

INSERT INTO ratings (outfit_id, user_id, rating) VALUES
(1, 2, 4),
(1, 3, 5),
(1, 4, 3),
(1, 5, 4),
(1, 1, 5);

select * from ratings;

INSERT INTO comments (outfit_id, user_id, comment) VALUES
(1, 3, 'Nice outfit!'),
(2, 4, 'Love it!'),
(3, 5, 'Great style!'),
(4, 1, 'I woulnd thought of this combo!'),
(5, 2, 'Ok');

INSERT INTO comments (outfit_id, user_id, comment) VALUES
(6, 7, 'Looking great!'),
(7, 8, 'Fantastic choice!'),
(8, 9, 'Stylish outfit!'),
(9, 10, 'Love the color combination!'),
(10, 11, 'Not my style, but still looks good!'),
(11, 12, 'Perfect for the occasion!'),
(12, 13, 'Very elegant!'),
(13, 14, 'Classy and chic!'),
(14, 15, 'Great attention to detail!'),
(15, 16, 'Nice outfit for the season!'),
(16, 17, 'Amazing!'),
(17, 18, 'Simple yet stylish!'),
(18, 19, 'Love the accessories!'),
(19, 20, 'Looks comfortable!'),
(20, 21, 'Perfect fit!'),
(21, 22, 'Stunning!'),
(22, 23, 'Great choice of shoes!'),
(23, 24, 'Beautiful outfit!'),
(24, 25, 'Love the patterns!'),
(25, 1, 'Impressive!');


INSERT INTO comments (outfit_id, user_id, comment) VALUES
(1, 3, 'Nice outfit!'),
(2, 4, 'Love it!'),
(1, 5, 'Great style!'),
(2, 1, 'I woulnd thought of this combo!'),
(1, 2, 'Ok');

select * from "comments";
