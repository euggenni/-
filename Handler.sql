-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июн 08 2018 г., 00:57
-- Версия сервера: 5.5.25
-- Версия PHP: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `Handler`
--

-- --------------------------------------------------------

--
-- Структура таблицы `administrators`
--

CREATE TABLE IF NOT EXISTS `administrators` (
  `AdministratorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Login` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`AdministratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `anomalies`
--

CREATE TABLE IF NOT EXISTS `anomalies` (
  `AnomalyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TimeRegister` datetime NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `ClientID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AnomalyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ClientID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Login` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `clusters`
--

CREATE TABLE IF NOT EXISTS `clusters` (
  `ClusterID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ClusterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `DataID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Time` datetime NOT NULL,
  `Value` float NOT NULL,
  `SensorID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `labels`
--

CREATE TABLE IF NOT EXISTS `labels` (
  `LabelID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Start` datetime NOT NULL,
  `End` datetime NOT NULL,
  `AnomalyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`LabelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `LogID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TimeRegister` datetime NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sensors`
--

CREATE TABLE IF NOT EXISTS `sensors` (
  `SensorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `ClusterID` int(11) unsigned DEFAULT NULL,
  `MaxValue` float DEFAULT NULL,
  `MinValue` float DEFAULT NULL,
  `ClientID` int(11) unsigned NOT NULL,
  `ValidInterv` float DEFAULT NULL,
  `IntervalPeace` int(11) DEFAULT NULL,
  PRIMARY KEY (`SensorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `signatures`
--

CREATE TABLE IF NOT EXISTS `signatures` (
  `SignatureID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Value` float NOT NULL,
  `AnomalyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SignatureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
