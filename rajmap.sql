/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.0.67-community-nt : Database - rajmap
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`rajmap` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rajmap`;

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `prn` varchar(50) default NULL,
  `place` varchar(100) default NULL,
  `name` varchar(100) default NULL,
  `phone` varchar(12) default NULL,
  `email` varchar(50) default NULL,
  `num_tickets` int(11) default NULL,
  `visit_date` varchar(50) default NULL,
  `amount` double default NULL,
  `txn_status` varchar(50) default NULL,
  `visit_status` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookings` */

insert  into `bookings`(`prn`,`place`,`name`,`phone`,`email`,`num_tickets`,`visit_date`,`amount`,`txn_status`,`visit_status`) values ('390308617','Mehrangarh, Jodhpur','vaibhav','5623154634','vaibhavvijay97@gmail.com',2,'2018-03-21',400,'Pending','Unvisited'),('348488887','Amber Fort, Jaipur','vaibhav','8562359856','vaibhavvijay97@gmail.com',2,'2018-03-21',600,'Pending','Unvisited'),('507704830','Keoladeo National Park, Bharatpur','vaibhav','4554455145','vaibhavvijay97@gmail.com',2,'2018-03-22',400,'Pending','Unvisited'),('459826057','Desert National Park, Jaisalmer','vineet','8645123698','vaibhavvijay97@gmail.com',4,'2018-03-29',1600,'Pending','Unvisited'),('579853463','Junagarh Fort, Bikaner','airu','9563265896','vaibhavvijay97@gmail.com',2,'2018-03-21',600,'Pending','Unvisited');

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` int(10) default NULL,
  `location_name` varchar(150) default NULL,
  `description` varchar(20000) default NULL,
  `lat` double default NULL,
  `long` double default NULL,
  `image_url` varchar(500) default NULL,
  `fare` int(10) default NULL,
  `location_type` varchar(40) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `locations` */

insert  into `locations`(`location_id`,`location_name`,`description`,`lat`,`long`,`image_url`,`fare`,`location_type`) values (1,'Amber Fort, Jaipur','Amer Fort is a fort located in Amer, Rajasthan, India. Amer is a town with an area of 4 square kilometres (1.5 sq mi) located 11 kilometres (6.8 mi) from Jaipur, the capital of Rajasthan. Located high on a hill, it is the principal tourist attraction in Jaipur.The town of Amer was originally built by Meenas, and later it was ruled by Raja Man Singh I (December 21, 1550 – July 6, 1614). Amer Fort is known for its artistic Hindu style elements. With its large ramparts and series of gates and cobbled paths, the fort overlooks Maota Lake,which is the main source of water for the Amer Palace.',26.9855,75.8513,'https://farm1.staticflickr.com/793/40196633604_65c081608d_b.jpg',300,'palace'),(2,'Ranthambore National Park','Ranthambhore National Park or Ranthambhore is the fortieth largest national park in northern India, covering 392 km². Ranthambhore was established as the Sawai Madhopur Game Sanctuary in 1955 by the Government of India and was declared one of the Project Tiger reserves in 1973. Ranthambhore became a national park in 1980. In 1984, the adjacent forests were declared the Sawai Man Singh Sanctuary and Keladevi Sanctuary, and in 1991 the tiger reserve was enlarged to include the Sawai Man Singh and Keladevi sanctuaries.Ranthambhore wildlife sanctuary is known for its Bengal tigers, and is one of the best places in India to see these animals in their natural jungle habitat. Tigers can be easily spotted even in the daytime.',26.0173,76.5026,'https://farm1.staticflickr.com/800/40196633444_c43124a0c3_b.jpg',400,'wildlife'),(3,'Mehrangarh, Jodhpur','Mehrangarh (Mehran Fort), located in Jodhpur, Rajasthan, is one of the largest forts in India. Built around 1460 by Rao Jodha, the fort is situated 410 feet (125 m) above the city and is enclosed by imposing thick walls. Inside its boundaries there are several palaces known for their intricate carvings and expansive courtyards. A winding road leads to and from the city below. The imprints of the impact of cannonballs fired by attacking armies of Jaipur can still be seen on the second gate. To the left of the fort is the chhatri of Kirat Singh Soda, a soldier who fell on the spot defending the Mehrangarh fort.',26.2981,73.0184,'https://farm5.staticflickr.com/4777/40196633384_40b4cac186_b.jpg',200,'palace'),(4,'Keoladeo National Park, Bharatpur','Keoladeo National Park or Keoladeo Ghana National Park formerly known as the Bharatpur Bird Sanctuary in Bharatpur, Rajasthan, India is a famous avifauna sanctuary that hosts thousands of birds, especially during the winter season. Over 230 species of birds are known to be resident. It is also a major tourist centre with scores of ornithologists arriving here in the hibernal season. It was declared a protected sanctuary in 1971. It is also a World Heritage Site.',27.217,77.4895,'https://farm5.staticflickr.com/4776/40905083381_864e38af0d_h.jpg',200,'wildlife'),(5,'City Palace, Jaipur','City Palace, Udaipur, is a palace complex situated in the city of Udaipur, Rajasthan. It was built over a period of nearly 400 years, with contributions from several rulers of the Mewar dynasty. Its construction began in 1553, started by Maharana Udai Singh II of the Sisodia Rajput family as he shifted his capital from the erstwhile Chittor to the new found city of Udaipur.The palace is located on the east bank of Lake Pichola and has several palaces built within its complex.',24.5764,73.6835,'https://farm5.staticflickr.com/4774/40011143155_1a26004a98_b.jpg',300,'palace'),(6,'Desert National Park, Jaisalmer','Desert National Park, Rajasthan, India, is situated in the west Indian state of Rajasthan near the town of Jaisalmer. This is one of the largest national parks, covering an area of 3162 km². The Desert National Park is an excellent example of the ecosystem of the Thar Desert. Sand dunes form around 20% of the Park.',26.9157,70.9083,'https://farm5.staticflickr.com/4788/40205642364_864f754fbd_b.jpg',400,'wildlife'),(7,'Junagarh Fort, Bikaner','Junagarh Fort is a fort in the city of Bikaner, Rajasthan, India. The fort was originally called Chintamani and was renamed Junagarh or Old Fort in the early 20th century when the ruling family moved to Lalgarh Palace outside the fort limits. It is one of the few major forts in Rajasthan which is not built on a hilltop. The modern city of Bikaner has developed around the fort.',28.0229,73.3119,'https://farm1.staticflickr.com/813/26041356177_91ce257ee1_b.jpg',300,'palace'),(8,'Chittor Fort','The Chittor Fort or Chittorgarh is one of the largest forts in India. It is a UNESCO World Heritage Site. The fort was the capital of Mewar and is located in the present-day town of Chittorgarh. It sprawls over a hill 180 m (590.6 ft) in height spread over an area of 280 ha (691.9 acres) above the plains of the valley drained by the Berach River.',24.8887,74.6269,'https://farm1.staticflickr.com/783/40020692705_29277a4506_b.jpg',350,'palace'),(9,'Achalgarh Fort, Mount Abu','Mount Abu is a popular hill station in the Aravalli Range in Sirohi district of Rajasthan state in western India, near the border with Gujarat. The mountain forms a distinct rocky plateau 22 km long by 9 km wide. The highest peak on the mountain is Guru Shikhar at 1,722 m (5,650 ft) above sea level. It is referred to as \'an oasis in the desert\' as its heights are home to rivers, lakes, waterfalls and evergreen forests.',24.5926,72.7156,'https://farm1.staticflickr.com/798/40914523831_ef23061e1f_b.jpg',300,'palace');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
