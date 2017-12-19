-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2017 at 09:04 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csis`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `transcript` (IN `id_input` INT, OUT `code` VARCHAR(10), OUT `description` VARCHAR(255), OUT `SsemesterName` VARCHAR(255), OUT `GRADE` VARCHAR(2), OUT `gradepoint` DOUBLE)  BEGIN

SELECT course.code,course.description,CONCAT_WS(" ",semester.name, YEAR(semester.startDate)) as semesterName ,courseregistration.Grade, courseregistration.gradepoint from courseregistration LEFT OUTER JOIN semestercourse on (courseregistration.semesterCourse_id = semestercourse.id) join course on (semestercourse.course_id =course.course_id) join semester on (semestercourse.semester_id= semester.semester_id) where courseregistration.student_id=id_input;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `department` int(11) NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `code`, `description`, `department`, `credit`) VALUES
(1, 'COMP6411', 'Comparative study of programming language', 5, 4),
(4, 'SOEN 228', 'System Hardware ', 9, 4),
(5, 'SOEN 422', 'Embedded Systems and Software', 9, 4),
(6, 'SOEN 423', ' Distributed Systems', 9, 4),
(7, 'SOEN 487', 'Web Services and Applications', 9, 4),
(8, 'SOEN 490', 'Capstone Software Engineering Design Project', 9, 4),
(9, 'COMP 248', 'Object-Oriented Programming I', 5, 4),
(10, 'COMP 249', 'Object-Oriented Programming I\r\n', 5, 4),
(11, 'COMP 353', 'Databases', 5, 4),
(12, 'COMP 371', 'Computer Graphics', 5, 4),
(13, 'COMP 426', 'Multicore Programming', 5, 4),
(14, 'COMP 6482', 'Parallel Programming', 5, 4),
(15, 'COMP 442', 'Compiler Design', 5, 4),
(18, 'SOEN 342', 'Software Requirements and Specifications', 9, 4),
(19, 'SOEN 343', 'Software Architecture and Design', 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `courseadvisor`
--

CREATE TABLE `courseadvisor` (
  `advisor_id` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courseregistration`
--

CREATE TABLE `courseregistration` (
  `student_id` int(11) NOT NULL,
  `semesterCourse_id` int(11) NOT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  `gradepoint` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseregistration`
--

INSERT INTO `courseregistration` (`student_id`, `semesterCourse_id`, `Grade`, `Status`, `gradepoint`) VALUES
(1, 2, 'A-', 'completed', 3.7),
(1, 4, 'B+', 'completed', 3.3),
(1, 6, 'B+', 'in-process', 3.3),
(2, 6, '', 'in-process', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL,
  `name` text NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `name`, `code`) VALUES
(5, 'Computer Science', 'COMP'),
(9, 'Software Engineering', 'SOEN'),
(10, 'Information Security', 'INSE'),
(11, 'computers', 'COMP'),
(12, 'computers', 'COMP'),
(13, 'Computer Science', 'COMP');

-- --------------------------------------------------------

--
-- Table structure for table `feespayment`
--

CREATE TABLE `feespayment` (
  `id` int(11) NOT NULL,
  `semester_fee_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `finaltrans`
--
CREATE TABLE `finaltrans` (
`name` varchar(511)
,`DOB` date
,`depart` text
,`program` varchar(255)
,`requiredCredit` int(11)
,`code` varchar(10)
,`description` text
,`student_id` int(11)
,`semesterName` varchar(25)
,`Grade` varchar(2)
,`gradepoint` double
);

-- --------------------------------------------------------

--
-- Table structure for table `lecturehalls`
--

CREATE TABLE `lecturehalls` (
  `id` int(11) NOT NULL,
  `building` varchar(255) NOT NULL,
  `room_number` varchar(30) NOT NULL,
  `space` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturehalls`
--

INSERT INTO `lecturehalls` (`id`, `building`, `room_number`, `space`) VALUES
(1, 'Hall Building', 'H-2012', 1),
(2, 'Hall Building', 'H-2001', 10),
(3, 'Hall Building', 'H-2002', 20),
(4, 'Hall Building', 'H3001', 30),
(5, 'Hall Building', 'H3002', 30),
(6, 'Hall Building', 'H3003', 30);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `id` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`id`, `department`, `user_id`) VALUES
(3, 5, 'e_attuq'),
(4, 5, 't_fe'),
(5, 9, 'n_nartey');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` varchar(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  `State` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `role_id`, `State`, `password`) VALUES
('Admin', 1, 'Active', 'c3218f5b6385f6ab75be03912951cd3f'),
('e_attuq', 3, 'Activated', 'c3218f5b6385f6ab75be03912951cd3f'),
('e_daniels', 2, 'FirstTime', 'c3218f5b6385f6ab75be03912951cd3f'),
('n_nartey', 3, 'Activated', 'c3218f5b6385f6ab75be03912951cd3f'),
('sun_test', 2, 'Activated', 'c3218f5b6385f6ab75be03912951cd3f'),
('t_fe', 3, 'Activated', 'c3218f5b6385f6ab75be03912951cd3f');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Department` int(11) NOT NULL,
  `requiredCredit` int(11) NOT NULL,
  `termFees` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `Name`, `Department`, `requiredCredit`, `termFees`) VALUES
(1, 'Master of Engineering Computer Science', 5, 45, 7500),
(2, 'Master of Science Computer Science', 5, 45, 7500),
(4, 'Master of Engineering Computer Science', 13, 45, 7500);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`) VALUES
(1, 'Admin'),
(2, 'Student'),
(3, 'Lecturer'),
(4, 'Course Advisor');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `DNE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `name`, `startDate`, `endDate`, `DNE`) VALUES
(1, 'Winter', '2018-01-07', '2018-05-20', '2018-03-12'),
(2, 'Fall', '2017-09-05', '2017-12-20', '2017-11-06'),
(3, 'Summer 1', '2018-06-04', '2018-07-18', '2018-06-15'),
(4, 'Fall', '2018-08-08', '2018-12-20', '2018-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `semestercourse`
--

CREATE TABLE `semestercourse` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `lecture_hall` int(11) NOT NULL,
  `lecturer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semestercourse`
--

INSERT INTO `semestercourse` (`id`, `course_id`, `semester_id`, `day`, `start_time`, `end_time`, `lecture_hall`, `lecturer`) VALUES
(1, 1, 2, 'Monday', '17:45:00', '20:15:00', 1, 3),
(2, 10, 1, 'Monday', '17:45:00', '20:15:00', 2, 3),
(3, 1, 1, 'Monday', '17:45:00', '20:15:00', 3, 3),
(4, 1, 1, 'Friday', '17:45:00', '20:15:00', 2, 3),
(5, 9, 3, 'Monday', '17:45:00', '20:15:00', 1, 3),
(6, 12, 1, 'Wednessday', '17:45:00', '20:15:00', 1, 4),
(7, 13, 1, 'Tuesday', '17:45:00', '20:15:00', 3, 3),
(8, 1, 3, 'Monday', '17:45:00', '20:15:00', 6, 4),
(10, 1, 1, 'Monday', '17:45:00', '20:15:00', 5, 4),
(11, 13, 4, 'Monday', '08:45:00', '11:11:00', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `semesterfees`
--

CREATE TABLE `semesterfees` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesterfees`
--

INSERT INTO `semesterfees` (`id`, `program_id`, `semester_id`, `amount`, `student_id`) VALUES
(0, 1, 1, 6500, 1),
(1, 1, 1, 6500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `program` int(11) NOT NULL,
  `admission_date` date NOT NULL,
  `completion_date` date NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `program`, `admission_date`, `completion_date`, `user_id`, `status`) VALUES
(1, 2, '2017-09-09', '2020-08-31', 'e_daniels', 'In-Progress'),
(2, 2, '2018-01-07', '2020-05-01', 'sun_test', 'In-Progress');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `email` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `DOB`, `email`, `phone`, `Address`) VALUES
('Admin', 'George', 'Ekow-Daniels', '2017-10-16', 'ekowpo@yahoo.com', '5145729132', 'apt 124 2070 boul de maisonneuve'),
('e_attuq', 'eugene', 'r', '1977-12-02', 'r@f.com', '5145729132', 'ff'),
('e_daniels', 'Ekow', 'Daniels', '1989-10-05', 'ekowpo@yahoo.com', '5145729132', '2070 Boulevard de Maisonneuve'),
('n_nartey', 'nii', 'nartey', '1998-01-01', 'n_narty@gmail.com', '5145729132', '2090 boulved de maisonneuve'),
('sun_test', 'test', 'data', '2017-12-05', 'test_data@gmail.com', '313-323-3232', 'djlncadnca.'),
('t_fe', 'Thomas G', 'Fevens', '1987-03-16', 'ft.@concordia.ca', '5148827881', 'h3h17d');

-- --------------------------------------------------------

--
-- Structure for view `finaltrans`
--
DROP TABLE IF EXISTS `finaltrans`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `finaltrans`  AS  select concat_ws(' ',`user`.`first_name`,`user`.`last_name`) AS `name`,`user`.`DOB` AS `DOB`,`department`.`name` AS `depart`,`programs`.`Name` AS `program`,`programs`.`requiredCredit` AS `requiredCredit`,`course`.`code` AS `code`,`course`.`description` AS `description`,`student`.`student_id` AS `student_id`,concat_ws(' ',`semester`.`name`,year(`semester`.`startDate`)) AS `semesterName`,`courseregistration`.`Grade` AS `Grade`,`courseregistration`.`gradepoint` AS `gradepoint` from (((((((`courseregistration` left join `semestercourse` on((`courseregistration`.`semesterCourse_id` = `semestercourse`.`id`))) join `course` on((`semestercourse`.`course_id` = `course`.`course_id`))) join `semester` on((`semestercourse`.`semester_id` = `semester`.`semester_id`))) join `student` on((`courseregistration`.`student_id` = `student`.`student_id`))) join `programs` on((`student`.`program` = `programs`.`id`))) join `department` on((`programs`.`Department` = `department`.`departmentId`))) join `user` on((`student`.`user_id` = `user`.`user_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department` (`department`);

--
-- Indexes for table `courseadvisor`
--
ALTER TABLE `courseadvisor`
  ADD PRIMARY KEY (`advisor_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `department` (`department`);

--
-- Indexes for table `courseregistration`
--
ALTER TABLE `courseregistration`
  ADD PRIMARY KEY (`student_id`,`semesterCourse_id`),
  ADD KEY `semesterCourse_id` (`semesterCourse_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- Indexes for table `feespayment`
--
ALTER TABLE `feespayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_fee_id` (`semester_fee_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `lecturehalls`
--
ALTER TABLE `lecturehalls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `department` (`department`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `semestercourse`
--
ALTER TABLE `semestercourse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `lecture_hall` (`lecture_hall`),
  ADD KEY `lecturer` (`lecturer`);

--
-- Indexes for table `semesterfees`
--
ALTER TABLE `semesterfees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD KEY `program` (`program`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `feespayment`
--
ALTER TABLE `feespayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lecturehalls`
--
ALTER TABLE `lecturehalls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `semestercourse`
--
ALTER TABLE `semestercourse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `courseadvisor`
--
ALTER TABLE `courseadvisor`
  ADD CONSTRAINT `courseadvisor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `courseadvisor_ibfk_2` FOREIGN KEY (`department`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `courseregistration`
--
ALTER TABLE `courseregistration`
  ADD CONSTRAINT `courseregistration_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `courseregistration_ibfk_2` FOREIGN KEY (`semesterCourse_id`) REFERENCES `semestercourse` (`id`);

--
-- Constraints for table `feespayment`
--
ALTER TABLE `feespayment`
  ADD CONSTRAINT `feespayment_ibfk_1` FOREIGN KEY (`semester_fee_id`) REFERENCES `semesterfees` (`id`),
  ADD CONSTRAINT `feespayment_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `lecturer_ibfk_2` FOREIGN KEY (`department`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `semestercourse`
--
ALTER TABLE `semestercourse`
  ADD CONSTRAINT `semestercourse_ibfk_1` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`),
  ADD CONSTRAINT `semestercourse_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `semestercourse_ibfk_3` FOREIGN KEY (`lecture_hall`) REFERENCES `lecturehalls` (`id`),
  ADD CONSTRAINT `semestercourse_ibfk_4` FOREIGN KEY (`lecturer`) REFERENCES `lecturer` (`id`);

--
-- Constraints for table `semesterfees`
--
ALTER TABLE `semesterfees`
  ADD CONSTRAINT `semesterfees_ibfk_1` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`),
  ADD CONSTRAINT `semesterfees_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `semesterfees_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`program`) REFERENCES `programs` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
