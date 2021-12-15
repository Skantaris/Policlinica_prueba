-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 11:24 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `policlinica`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Nombre_Admin` varchar(100) NOT NULL,
  `Contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Nombre_Admin`, `Contrasena`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `citas`
--

CREATE TABLE `citas` (
  `Codigo_cita` int(100) NOT NULL,
  `Hora_asignada` time NOT NULL,
  `Fecha_asignada` date NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `Permisos` varchar(100) NOT NULL,
  `clinica_name` varchar(100) NOT NULL,
  `Rol_usuario` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `Cedula_usuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `citas`
--

INSERT INTO `citas` (`Codigo_cita`, `Hora_asignada`, `Fecha_asignada`, `especialidad`, `Permisos`, `clinica_name`, `Rol_usuario`, `fecha_creacion`, `Cedula_usuario`) VALUES
(322, '10:38:00', '2021-12-30', 'Neurología', 'admin', 'Grupo Vive', 2, '2021-12-10 21:38:55', '1234'),
(323, '15:55:00', '2021-12-24', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-10 22:55:55', '111'),
(324, '16:26:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:26:44', '1233'),
(325, '17:33:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:33:37', '1233'),
(326, '16:34:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:34:36', '1233'),
(327, '16:37:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:37:11', '1233'),
(328, '16:37:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:37:59', '1233'),
(329, '17:38:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:38:14', '1233'),
(330, '16:38:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:38:54', '1233'),
(331, '16:40:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:40:21', '1233'),
(332, '16:40:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:40:59', '1233'),
(333, '15:41:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:41:32', '1233'),
(334, '15:42:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:42:29', '1233'),
(335, '16:42:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:42:55', '1233'),
(336, '15:50:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 00:49:38', '1233'),
(337, '13:00:00', '2021-12-18', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-11 01:11:36', '1233'),
(339, '17:37:00', '2021-12-17', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-14 00:37:52', '1'),
(340, '15:43:00', '2021-12-23', 'Dermatología', 'admin', 'Consultorios América', 2, '2021-12-14 00:43:32', '1');

-- --------------------------------------------------------

--
-- Table structure for table `clinicas`
--

CREATE TABLE `clinicas` (
  `Nombre_clinica` varchar(100) NOT NULL,
  `Direccion_clinica` varchar(100) NOT NULL,
  `Permisos` varchar(100) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinicas`
--

INSERT INTO `clinicas` (`Nombre_clinica`, `Direccion_clinica`, `Permisos`, `fecha_creacion`) VALUES
('Consultorios América', 'Brazilian Beauty Valaq, Vía España, Panama City', 'admin', '2021-12-08 23:30:26'),
('Grupo Vive', 'Calle 76B Oeste, Panamá', 'admin', '2021-12-08 23:28:46'),
('Home Care Saasa', 'Vía España, Frente al Hospital Pediatrico de la C.s.s', 'admin', '2021-12-08 23:29:50'),
('La Casa Del Médico', 'Calle 44 Este, Panamá', 'admin', '2021-12-08 23:28:28'),
('Vitalmedic', 'Avenida Justo Arosemena, Calle 44 Este', 'admin', '2021-12-08 23:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--

CREATE TABLE `especialidades` (
  `Nombre_Especialidades` varchar(100) NOT NULL,
  `Permisos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `especialidades`
--

INSERT INTO `especialidades` (`Nombre_Especialidades`, `Permisos`) VALUES
('Dermatología', 'admin'),
('Neurología', 'admin'),
('Oftalmología', 'admin'),
('Psiquiatría', 'admin'),
('Urología', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `medicos`
--

CREATE TABLE `medicos` (
  `ID_medico` int(100) NOT NULL,
  `Especialidad` varchar(100) NOT NULL,
  `Cedula_medico` varchar(15) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `hora_desde` time NOT NULL,
  `fecha_desde` date DEFAULT NULL,
  `hora_hasta` time NOT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `clinica_labor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicos`
--

INSERT INTO `medicos` (`ID_medico`, `Especialidad`, `Cedula_medico`, `fecha_creacion`, `hora_desde`, `fecha_desde`, `hora_hasta`, `fecha_hasta`, `clinica_labor`) VALUES
(38, 'Dermatología', '3-748-410', '2021-12-09 00:19:49', '13:00:00', '2021-12-11', '20:00:00', '2021-12-31', 'Consultorios América'),
(39, 'Neurología', '8-156-4836', '2021-12-09 00:21:44', '08:00:00', '2021-12-11', '11:55:00', '2021-12-31', 'Grupo Vive'),
(40, 'Oftalmología', '8-957-1617', '2021-12-09 00:22:10', '19:00:00', '2021-12-11', '23:55:00', '2021-12-31', 'Home Care Saasa'),
(41, 'Psiquiatría', '8-966-1043', '2021-12-09 00:22:40', '18:00:00', '2021-12-11', '23:55:00', '2021-12-31', 'La Casa Del Médico'),
(42, 'Urología', '8-970-994', '2021-12-09 00:23:04', '01:00:00', '2021-12-11', '09:00:00', '2021-12-31', 'Vitalmedic'),
(43, 'Oftalmología', '1234', '2021-12-10 22:33:59', '11:33:00', '2021-12-17', '15:33:00', '2021-12-31', 'Grupo Vive');

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `ID_paciente` int(11) NOT NULL,
  `Cedula` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`ID_paciente`, `Cedula`) VALUES
(68, '1'),
(63, '111'),
(65, '111'),
(70, '123'),
(67, '1233'),
(64, '1234'),
(39, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL,
  `Descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ID`, `Descripcion`) VALUES
(1, 'Admin'),
(2, 'Paciente'),
(3, 'Medico');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `Cedula` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Contrasena` varchar(30) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `dia` int(31) NOT NULL,
  `mes` varchar(20) NOT NULL,
  `anio` year(4) NOT NULL,
  `Rol` int(11) NOT NULL,
  `Permisos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`Cedula`, `Nombre`, `Apellido`, `Contrasena`, `Correo`, `dia`, `mes`, `anio`, `Rol`, `Permisos`) VALUES
('1', '1', '1', '1', 'dsad@sadasd', 1, 'enero', 2001, 2, 'admin'),
('111', '111', '111', '1234', 'wyming.zeng@utp.ac.pa', 11, 'enero', 2001, 2, 'admin'),
('123', '123', '123', 'Tomyonen1!', 'dasdasdasd@asdasd', 1, 'enero', 2001, 2, 'admin'),
('1233', '111', '111', '111', 'toms_7101@hotmail.com', 1, 'enero', 2001, 2, 'admin'),
('1234', '1234', '1234', '123', 'tomyzeng@gmail.com', 1, 'enero', 2001, 3, 'admin'),
('3-748-410', 'Kevin', 'Feng', 'med3', 'med3@gmail.com', 5, 'enero', 1969, 3, 'admin'),
('8-156-4836', 'Benito', 'Chan', 'med4', 'med4@gmail.com', 3, 'noviembre', 1986, 3, 'admin'),
('8-957-1617', 'Roberto', 'Zhan', 'med1', 'med1@gmail.com', 3, 'marzo', 1975, 3, 'admin'),
('8-966-1043', 'Tomy', 'Zeng', 'med5', 'med5@gmail.com', 9, 'enero', 1985, 3, 'admin'),
('8-970-994', 'Anthony', 'Wen', 'med2', 'med2@gmail.com', 7, 'marzo', 1986, 3, 'admin'),
('admin', 'admin', 'admin', 'admin', 'admin@admin.com', 0, 'enero', 2000, 1, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Nombre_Admin`);

--
-- Indexes for table `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`Codigo_cita`),
  ADD KEY `clinica_nombre_FK` (`clinica_name`),
  ADD KEY `cedula_usuario_FK` (`Cedula_usuario`);

--
-- Indexes for table `clinicas`
--
ALTER TABLE `clinicas`
  ADD PRIMARY KEY (`Nombre_clinica`),
  ADD KEY `Admin_nombre_FK` (`Permisos`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`Nombre_Especialidades`),
  ADD KEY `Admin_name_FK` (`Permisos`);

--
-- Indexes for table `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`ID_medico`),
  ADD KEY `medico_ced` (`Cedula_medico`),
  ADD KEY `Especialidad_FK` (`Especialidad`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID_paciente`),
  ADD KEY `Cedula_paciente` (`Cedula`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Cedula`),
  ADD KEY `Rol_Usuario` (`Rol`),
  ADD KEY `Admin_FK` (`Permisos`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `citas`
--
ALTER TABLE `citas`
  MODIFY `Codigo_cita` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT for table `medicos`
--
ALTER TABLE `medicos`
  MODIFY `ID_medico` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `ID_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `cedula_usuario_FK` FOREIGN KEY (`Cedula_usuario`) REFERENCES `usuarios` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clinica_nombre_FK` FOREIGN KEY (`clinica_name`) REFERENCES `clinicas` (`Nombre_clinica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clinicas`
--
ALTER TABLE `clinicas`
  ADD CONSTRAINT `Admin_nombre_FK` FOREIGN KEY (`Permisos`) REFERENCES `admin` (`Nombre_Admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD CONSTRAINT `Admin_name_FK` FOREIGN KEY (`Permisos`) REFERENCES `admin` (`Nombre_Admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `Especialidad_FK` FOREIGN KEY (`Especialidad`) REFERENCES `especialidades` (`Nombre_Especialidades`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medico_ced` FOREIGN KEY (`Cedula_medico`) REFERENCES `usuarios` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `Cedula_paciente` FOREIGN KEY (`Cedula`) REFERENCES `usuarios` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `Admin_FK` FOREIGN KEY (`Permisos`) REFERENCES `admin` (`Nombre_Admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Rol_Usuario` FOREIGN KEY (`Rol`) REFERENCES `roles` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
