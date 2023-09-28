SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

create database complain_registration;
use complain_registration;

CREATE TABLE `admin` (
  `admin_id` int(5) NOT NULL,
  `admin_username` varchar(30) NOT NULL,
  `admin_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_password`) VALUES
(1, 'admin', 'admin');



CREATE TABLE `complain` (
  `complain_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `department_id` int(5) NOT NULL,
  `complain_text` varchar(500) NOT NULL,
  `state_id` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `complain` (`complain_id`, `user_id`, `department_id`, `complain_text`, `state_id`) VALUES
(2, 13, 1, 'I have no drinking water in my home.', 2),
(3, 13, 3, 'I want electricity cut off in my house.', 1),
(4, 11, 5, 'there was a man taking bribe in liscence exam, Gurjudhara.', 4),
(5, 11, 6, 'I cannot find my nail cutter.', 5),
(6, 11, 1, 'I want drinking water pipe fitted in my home, But it is taking time.', 3),
(9, 11, 6, 'dari is chor', 4),
(11, 15, 4, 'i have a complain', 1),
(12, 14, 2, 'Mero bus ko side ma baseko kt ko number', 2);



CREATE TABLE `department` (
  `department_id` int(5) NOT NULL,
  `department_name` varchar(30) NOT NULL,
  `department_username` varchar(30) NOT NULL,
  `department_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `department` (`department_id`, `department_name`, `department_username`, `department_password`) VALUES
(1, 'drinking_water', 'drinking_water', 'drinking_water'),
(2, 'transportation', 'transportation', 'transportation'),
(3, 'electricity', 'electricity', 'electricity'),
(4, 'sewage', 'sewage', 'sewage'),
(5, 'curroption', 'curroption', 'curroption'),
(6, 'police', 'police', 'police'),
(7, 'Girl', 'girl', 'girl');



CREATE TABLE `state` (
  `state_id` int(1) NOT NULL,
  `state_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Complain Registered, Waiting for Approval'),
(2, 'Approved by Admin'),
(3, 'In Process'),
(4, 'Work Completed'),
(5, 'Complain Rejected');



CREATE TABLE `user` (
  `user_id` int(5) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `mname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `citizenship_no` varchar(14) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `user` (`user_id`, `fname`, `mname`, `lname`, `address`, `contact_no`, `citizenship_no`, `user_email`, `user_password`) VALUES
(11, 'Subodh', '', 'Barakoti', 'Thankot', '9840530961', '1234567', 'subodhbarakoti17@gmail.com', 'abdeviliers17'),
(13, 'Pratik', '', 'Shrestha', 'Satungal', '9861365946', '123456789321', 'pratikshrestha123@gmail.com', 'pratik'),
(14, 'Kushal', '', 'Rijal', 'Kirtipur', '010101', '123456', 'Kushalrijal@gmail.com', '12345'),
(15, 'shyam', '', 'bahadur', 'kathmandu', '9821223543', '1234567654', 'shyambahadur@gmail.com', '123456');


ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);


ALTER TABLE `complain`
  ADD PRIMARY KEY (`complain_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `state_id` (`state_id`);


ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);


ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);


ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);


ALTER TABLE `admin`
  MODIFY `admin_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `complain`
  MODIFY `complain_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `department`
  MODIFY `department_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `state`
  MODIFY `state_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `user`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


ALTER TABLE `complain`
  ADD CONSTRAINT `complain_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `complain_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `complain_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);
COMMIT;

