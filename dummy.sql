INSERT INTO users (user_id, email, password, user_type_id, first_name, last_name, birthday, num_followers, num_following, seller_name, valid_id_type_id, valid_id_path, location, rate, is_approved, boundary)
VALUES (1, 'superadmin@farmvest.com', '', 3, 'Super', 'Admin', '1998-08-21', 0, 0, '', 5, '1500000000.png', 69, 0, 1, ''),
(2, 'ronaldostarosa@gmail.com', '', 1, 'Ronaldo', 'Sta. Rosa', '1975-01-15', 10, 0, 'Ronaldo Sta. Rosa Goods', 7, '1500000001.png', 69, 5, 1, 'Manila'),
(3, 'renatolansangan@gmail.com', '', 1, 'Renato', 'Lansangan', '1975-02-15', 15, 1, 'Renato Lansangan Rice', 7, '1500000002.png', 94, 5, 1, 'Manila, Tarlac, Pampanga'),
(4, 'cristinamercado@gmail.com', '', 1, 'Cristina', 'Mercado', '1975-03-15', 20, 2, 'Cristina Mercado Market', 7, '1500000003.png', 111, 5, 1, 'Tarlac, Pampanga'),

(5, 'juandelacruz@gmail.com', '', 2, 'Juan', 'Dela Cruz', '1985-04-15', 3, 0, '', 7, '1500000004.png', 69, 0, 1, 'Manila, Tarlac, Pampanga'),
(6, 'kristianmanato@gmail.com', '', 2, 'Kristian', 'Manato', '1985-05-15', 1, 0, '', 7, '1500000005.png', 69, 0, 1, 'Manila'),
(7, 'jomerroluna@gmail.com', '', 2, 'Jomer', 'Roluna', '1985-06-15', 2, 0, '', 7, '1500000006.png', 94, 0, 1, 'Tarlac, Pampanga'),
(8, 'esmeraldavillan@gmail.com', '', 1, 'Esmeralda', 'Villan', '1966-06-06', 2, 0, '', 7, '1500000007.png', 69, 0, 1, 'Manila, Tarlac, Pampanga'),
(9, 'cinthymardoc@gmail.com', '', 1, 'Cinthy', 'Mardoc', '1966-06-06', 2, 0, '', 7, '1500000008.png', 69, 0, 1, 'Manila, Tarlac, Pampanga');

UPDATE users SET `password` = "$2y$10$68RUKzJOEeIH9tSWaxOLtubg.KOuyIvnIRHn49B7BKD4IeqywT6Ta";







INSERT INTO products (product_id, seller_id, product_name, price, total_stocks, rem_stocks, min_buyable_stocks, description, product_img_path)
VALUES (1, 2, 'Jasmin Rice', 300, 100, 85, 5, 'Fresh Jasmin Rice\n-Excellent Quality\n-Freshly Milled\n-100% local rice', '2000000000.jfif'),
(2, 2, 'Sinandomeng Rice', 290, 150, 140, 2, 'Bigas na paborito ng mga Pilipino. Sinandomerng Rice para sa inyo.', '2000000001.jpg'),
(3, 3, 'Jasmin Rice', 300, 50, 40, 5, 'Masarap at mabangong bigas para sa mga tao.', '2000000002.jfif'),
(4, 3, 'Sinandomeng Rice', 290, 50, 40, 5, 'Bigas para sa lahat.', '2000000003.jpg'),
(5, 4, 'Jasmin Rice', 300, 70, 50, 5, 'Amoy palang kanin na.', '2000000004.jpg'),
(6, 4, 'Sinandomeng Rice', 290, 70, 60, 5, 'Hinahanap hanap ng ulam niyo.', '2000000005.jpg'),
(7, 4, 'Talong', 30, 100, 100, 5, 'Mahaba, malaki, at masarap lalo na kapag mainit-init.', '2000000006.jpg');



INSERT INTO purchases (product_id, buyer_id, purchase_status_id, bought_stocks, price, payable, date_purchased, date_received)
VALUES (3, 5, 4, 5, 300, 1500, '2020-07-10', '2020-07-13'),
(3, 6, 4, 5, 300, 1500, '2020-07-07', '2020-07-13'),
(4, 6, 4, 10, 290, 2900, '2020-07-24', '2020-07-26'),
(1, 6, 4, 15, 300, 4500, '2020-08-05', '2020-08-10'),
(1, 7, 4, 10, 300, 3000, '2020-08-06', '2020-08-10'),
(2, 6, 4, 10, 290, 2900, '2020-08-12', '2020-08-17'),
(2, 7, 4, 10, 290, 2900, '2020-08-15', '2020-08-17'),
(5, 5, 4, 10, 300, 3000, '2020-07-20', '2020-07-26'),
(5, 6, 4, 10, 300, 3000, '2020-07-24', '2020-07-26'),
(6, 6, 4, 5, 290, 1450, '2020-07-24', '2020-07-26'),
(6, 7, 4, 5, 290, 1450, '2020-07-24', '2020-07-26');




INSERT INTO reports (violator_id, violation_id, reporter_id, admin_id, cause, message, is_user_removed, date_reported, date_responded)
VALUES (8, 3, 5, 1, 'Plastic ang mga bigas na binebenta niya.', '', 1, '2020-07-10', '2020-07-10'),
(8, 1, 5, 1, 'Madugang seller. Scammer', '', 0, '2020-08-10', '');


        
INSERT INTO articles (author_id, title, body) 
VALUES (1, 'Republic Act (RA) 11321 or the Sagip Saka Act', 'PRESIDENT Rodrigo R. Duterte signed into law a measure expanding the government’s enterprise development program for farmers and fisherfolk, which goes into the books as Republic Act 11321 or the Sagip Saka Act.
Mr. Duterte signed the measure on April 17. The Palace e-mailed copies of the law to reporters on Monday.\n
The new law establishes the “Farmers and Fisherfolk Enterprise Development Program,” which refers to the “comprehensive set of objectives, targets, and holistic approach in promoting the establishment of enterprises involving agricultural and fishery products.”\n
The law requires the program to adopt a science-based approach in identifying and prioritizing agricultural and fishery products to be covered.\n
In a statement, Senator Francis N. Pangilinan, the principal author and sponsor of the law, said: “Ang pagsasabatas ng Sagip Saka ay tagumpay ng mga magsasaka at mangingisda, ang mahigit 10 milyong Pilipinong nagpapakain sa atin.” (The law’s enactment is a victory for over 10 million Filipinos who grow our food.”)\n\n
Source: https://www.bworldonline.com/duterte-signs-sagip-saka-law-boosting-direct-procurement-of-agricultural-goods/'),
(1, 'Law institutionalizing a Farmers and Fisherfolk Enterprise Development Program', 'MANILA, Philippines (UPDATED) – In a bid to improve the agriculture and fisheries sector, the Philippine government passed a law institutionalizing a Farmers and Fisherfolk Enterprise Development Program.\n
To do this, the program will provide assistance like agricultural extension services; skills development; provision of production inputs, equipment, and facilities; and infrastructure for production and post-production activities.
\n\n
It should also help improve farmers\' and fisherfolk\'s access to credit grants, crop insurance, and new technologies. Another form of assistance is helping their trade grow by improving their access to markets. \n
It also imposes a slew of tax incentives and exemptions to encourage assistance for farmers and fisherfolk.\n\n
Source: https://rappler.com/nation/sagip-saka-act-farmers-fisherfolk-signed-into-law'),
(1, 'Republic Act No. 11203', 'An act liberalizing the importation, exportation and trading of rice, lifting for the purpose the quantitative import restriction on rice, and for other purposes.');



INSERT INTO news (author_id, title, body, date_published)
VALUES (1, 'For Philippine farmers reeling from disasters, lockdown is another pain point', '•	Farmers in the Bicol region in the Philippines are experiencing the brunt of the lockdown, imposed since March 16 to contain the COVID-19 pandemic.\n
•	The situation is especially hard for rice farmers, most of them still reeling from the impacts of successive typhoons, drought, and cheap imported rice.\n
•	The Philippine government has allotted a 1.17 trillion peso ($23.2 billion) stimulus package, including support for some 18 million families most affected by the lockdown. In Bicol, more than one million families are expected to receive support.\n
•	The Philippine lockdown is expected to lift by May 15, although the government says the country may have to continue dealing with COVID-19 for the new two years.
\n\n
Ramon Oliva, a rice farmer from the Philippine province of Camarines Sur, has been tasked to look after the main dam at Mount Isarog in the town of Pili. The dam provides water to irrigate 34 hectares (84 acres) of rice farms in the village of Concepcion Grande in Naga City, some 385 kilometers (240 miles) south of the capital, Manila.\n
Oliva visits the facility twice a week but has been shut out of the dam since March 16, following a lockdown, or enhanced community quarantine (ECQ), imposed by the national government to stem the COVID-19 pandemic, which has affected 10,343 people and caused 685 deaths in the Philippines as of May 7.
The stringent measures aren’t surprising; in the Bicol region, which covers six provinces, a total of 55 COVID-19 positive cases have been recorded as of May 6.\n
“Not being able to maintain the irrigation facility will have a devastating impact on our rice farms,” Oliva tells Mongabay. “We’re harvesting by the end of May. If I don’t look after the irrigation, the farms will dry up.” He was only able to access the dam in the first week of April through a renewable certificate; the latest will expire on May 31.\n
These restrictions come on top of bigger problems local farmers face: the fields in town have been hit by extreme weather events. The past two years have been difficult for low-income farmers like Oliva, as they reel from successive typhoons and El Niño-driven droughts.\n
The Bicol region is disaster-prone. Typhoons, volcanic eruptions, floods and drought ravage vulnerable locations in rural areas where nearly 80% of the population live. The main livelihoods here are farming and fishing.
\n\n
Source: https://news.mongabay.com/2020/05/for-philippine-farmers-reeling-from-disasters-lockdown-is-another-pain-point/
', '2020-05-07'),
(1, 'The Plight of Filipino Rice Farmers', 'I have written in several columns past how important I think our farming and agriculture is here in the Philippines. There was a time when this boosted the economy and put us on the map in Southeast Asia. In fact, we taught several of our neighbors the trade and showed them how to grow and harvest rice. Those were the good days.\n
Today, our rice farming industry is up against the ropes and our own government is the one who put it there. What was once the centerpiece of our agriculture industry is now barely making ends meet and is threatened with extinction every single day. The worst part is that we are doing this to ourselves and we are effectively killing our own industry, and periphery industries along with it.\n
Nothing exists in a vacuum in the country, especially in smaller rural provinces. Once the main source of livelihood suffers, everything in the town suffers along with it. So when rice farmers in the provinces are feeling the pinch all of the town’s periphery businesses are going to suffer alongside them. And when more and more towns end up with ailing businesses and citizens struggling to make ends meet it’s going to spell disaster for the country.\n
I don’t understand how the government can just watch and do nothing as imported rice floods the markets and our own local farmers struggle to make less than P200 a day – an amount that no business or family can survive on in this day and age. After the inflation on the prices of basic goods and services how can we pay people less and still expect them to survive?\n
It’s extremely disappointing because one of the promises of the administration was to revamp and revitalize the already struggling agriculture sector. Unfortunately not much has been done to this effect and now with the signing of the Philippine Rice Tariffication Law, it seems we are giving more importance to rice from outside sources and leaving our own local rice farmers to suffer the consequences.\n
Sadly, anyone who had read the law could see this outcome coming from a mile away. It’s a pity the government could not – or would not. This is not the first time we have sacrificed our own citizens over foreign convenience and interest. And it’s surprising given that President Duterte is so committed to helping the poor that he is constantly making things harder for them and easier for others (mainly the Chinese). He is exhibiting the very behavior he blasted other officials for more than once.
Since the Rice Tariffication Law could not be stopped the only hope for stakeholders was to include provisions in the Implementing Rules and Regulations (IRR) that might offer them some form of protection. They originally asked for protection for farmers who may have no traders to buy their crops that the government would implement a “rolling buffer stock” to release their rice bought from farmers into the market and regularly buy grains anew.\n
Source: https://www.philstar.com/opinion/2019/09/17/1952474/plight-filipino-rice-farmers
', '2019-09-17');


INSERT INTO stocks (measurement_id, season_id, product_name, date_start, date_end, value_start, value_end)
VALUES (3, 1, 'Rice', '2019-07-01', '2020-07-31', 1099, 1099),
(3, 1, 'Rice', '2020-06-01', '2020-06-30', 891, 891),
(3, 1, 'Rice', '2020-07-01', '2020-07-31', 808, 891);


        
  