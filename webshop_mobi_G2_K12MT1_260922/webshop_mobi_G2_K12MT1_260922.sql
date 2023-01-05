-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 26, 2022 lúc 09:45 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `crs`
--
DROP DATABASE IF EXISTS `crs`;
CREATE DATABASE IF NOT EXISTS `crs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crs`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fir_details`
--

DROP TABLE IF EXISTS `fir_details`;
CREATE TABLE IF NOT EXISTS `fir_details` (
  `F_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `time` datetime NOT NULL,
  `description` varchar(45) NOT NULL,
  `status` varchar(15) NOT NULL,
  `crime_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`F_id`),
  KEY `FK_fir_details_1` (`crime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fir_forward`
--

DROP TABLE IF EXISTS `fir_forward`;
CREATE TABLE IF NOT EXISTS `fir_forward` (
  `F_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `define` varchar(45) NOT NULL,
  `status` varchar(15) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`F_id`),
  KEY `FK_fir_forward_1` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_area`
--

DROP TABLE IF EXISTS `mstr_area`;
CREATE TABLE IF NOT EXISTS `mstr_area` (
  `area_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `area_name` varchar(45) NOT NULL,
  `pincode` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`area_id`),
  KEY `FK_mstr_area_1` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_city`
--

DROP TABLE IF EXISTS `mstr_city`;
CREATE TABLE IF NOT EXISTS `mstr_city` (
  `city_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_crimetype`
--

DROP TABLE IF EXISTS `mstr_crimetype`;
CREATE TABLE IF NOT EXISTS `mstr_crimetype` (
  `crime_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `crime_type` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`crime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_designation`
--

DROP TABLE IF EXISTS `mstr_designation`;
CREATE TABLE IF NOT EXISTS `mstr_designation` (
  `desi_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `desi_name` varchar(45) NOT NULL,
  PRIMARY KEY (`desi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_login`
--

DROP TABLE IF EXISTS `mstr_login`;
CREATE TABLE IF NOT EXISTS `mstr_login` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `last_logindatetime` datetime NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `mstr_login`
--

INSERT INTO `mstr_login` (`username`, `password`, `type`, `status`, `last_logindatetime`) VALUES
('shyam', 'maheta', 'user', '1', '2010-04-05 10:10:00'),
('viral', 'thakkar', 'victim', '1', '2010-04-03 08:15:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_missingcitizens`
--

DROP TABLE IF EXISTS `mstr_missingcitizens`;
CREATE TABLE IF NOT EXISTS `mstr_missingcitizens` (
  `missing_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gander` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `area_id` int(10) UNSIGNED NOT NULL,
  `special_clue` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`missing_id`),
  KEY `FK_mstr_missingcitizens_1` (`city_id`),
  KEY `FK_mstr_missingcitizens_2` (`area_id`),
  KEY `FK_mstr_missingcitizens_3` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_officer`
--

DROP TABLE IF EXISTS `mstr_officer`;
CREATE TABLE IF NOT EXISTS `mstr_officer` (
  `username` varchar(45) NOT NULL,
  `Jdate` datetime NOT NULL,
  `Ldate` datetime NOT NULL,
  `desi_id` int(10) UNSIGNED NOT NULL,
  `police_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`username`),
  KEY `FK_mstr_officer_1` (`police_id`),
  KEY `FK_mstr_officer_2` (`desi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_police`
--

DROP TABLE IF EXISTS `mstr_police`;
CREATE TABLE IF NOT EXISTS `mstr_police` (
  `police_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `area_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` decimal(10,0) NOT NULL,
  `Email_id` varchar(45) NOT NULL,
  `contact_person` varchar(45) NOT NULL,
  `starting_date` datetime NOT NULL,
  PRIMARY KEY (`police_id`),
  KEY `FK_mstr_police_1` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_policestation`
--

DROP TABLE IF EXISTS `mstr_policestation`;
CREATE TABLE IF NOT EXISTS `mstr_policestation` (
  `policestation_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `area_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` decimal(10,0) NOT NULL,
  `Email_id` varchar(45) NOT NULL,
  `contact_person` varchar(45) NOT NULL,
  `starting_date` datetime NOT NULL,
  PRIMARY KEY (`policestation_id`) USING BTREE,
  KEY `FK_mstr_police_1` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mstr_profile`
--

DROP TABLE IF EXISTS `mstr_profile`;
CREATE TABLE IF NOT EXISTS `mstr_profile` (
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(5) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `Dob` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` decimal(10,0) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `profile_photo` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`first_name`),
  KEY `FK_mstr_profile_1` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `fir_details`
--
ALTER TABLE `fir_details`
  ADD CONSTRAINT `FK_fir_details_1` FOREIGN KEY (`crime_id`) REFERENCES `mstr_crimetype` (`crime_id`);

--
-- Các ràng buộc cho bảng `fir_forward`
--
ALTER TABLE `fir_forward`
  ADD CONSTRAINT `FK_fir_forward_1` FOREIGN KEY (`username`) REFERENCES `mstr_login` (`username`);

--
-- Các ràng buộc cho bảng `mstr_area`
--
ALTER TABLE `mstr_area`
  ADD CONSTRAINT `FK_mstr_area_1` FOREIGN KEY (`city_id`) REFERENCES `mstr_city` (`city_id`);

--
-- Các ràng buộc cho bảng `mstr_missingcitizens`
--
ALTER TABLE `mstr_missingcitizens`
  ADD CONSTRAINT `FK_mstr_missingcitizens_1` FOREIGN KEY (`city_id`) REFERENCES `mstr_city` (`city_id`),
  ADD CONSTRAINT `FK_mstr_missingcitizens_2` FOREIGN KEY (`area_id`) REFERENCES `mstr_area` (`area_id`),
  ADD CONSTRAINT `FK_mstr_missingcitizens_3` FOREIGN KEY (`username`) REFERENCES `mstr_login` (`username`);

--
-- Các ràng buộc cho bảng `mstr_officer`
--
ALTER TABLE `mstr_officer`
  ADD CONSTRAINT `FK_mstr_officer_1` FOREIGN KEY (`police_id`) REFERENCES `mstr_police` (`police_id`),
  ADD CONSTRAINT `FK_mstr_officer_2` FOREIGN KEY (`desi_id`) REFERENCES `mstr_designation` (`desi_id`);

--
-- Các ràng buộc cho bảng `mstr_police`
--
ALTER TABLE `mstr_police`
  ADD CONSTRAINT `FK_mstr_police_1` FOREIGN KEY (`area_id`) REFERENCES `mstr_area` (`area_id`);

--
-- Các ràng buộc cho bảng `mstr_policestation`
--
ALTER TABLE `mstr_policestation`
  ADD CONSTRAINT `FK_mstr_policestation_1` FOREIGN KEY (`area_id`) REFERENCES `mstr_area` (`area_id`);

--
-- Các ràng buộc cho bảng `mstr_profile`
--
ALTER TABLE `mstr_profile`
  ADD CONSTRAINT `FK_mstr_profile_1` FOREIGN KEY (`username`) REFERENCES `mstr_login` (`username`);
--
-- Cơ sở dữ liệu: `phpmyadmin`
--
DROP DATABASE IF EXISTS `phpmyadmin`;
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

DROP TABLE IF EXISTS `pma__bookmark`;
CREATE TABLE IF NOT EXISTS `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

DROP TABLE IF EXISTS `pma__central_columns`;
CREATE TABLE IF NOT EXISTS `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`db_name`,`col_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

DROP TABLE IF EXISTS `pma__column_info`;
CREATE TABLE IF NOT EXISTS `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

DROP TABLE IF EXISTS `pma__designer_settings`;
CREATE TABLE IF NOT EXISTS `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Đang đổ dữ liệu cho bảng `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

DROP TABLE IF EXISTS `pma__export_templates`;
CREATE TABLE IF NOT EXISTS `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

DROP TABLE IF EXISTS `pma__favorite`;
CREATE TABLE IF NOT EXISTS `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

DROP TABLE IF EXISTS `pma__history`;
CREATE TABLE IF NOT EXISTS `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

DROP TABLE IF EXISTS `pma__navigationhiding`;
CREATE TABLE IF NOT EXISTS `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Đang đổ dữ liệu cho bảng `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'category_path', 'table', 'web_oneshop_mobile', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

DROP TABLE IF EXISTS `pma__pdf_pages`;
CREATE TABLE IF NOT EXISTS `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

DROP TABLE IF EXISTS `pma__recent`;
CREATE TABLE IF NOT EXISTS `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Đang đổ dữ liệu cho bảng `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"web_oneshop_mobile\",\"table\":\"category\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"banner_image\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"product_image\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"product\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"order_details\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"order\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"manufacturer\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"category_path\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"customer\"},{\"db\":\"web_oneshop_mobile\",\"table\":\"contact\"}]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

DROP TABLE IF EXISTS `pma__relation`;
CREATE TABLE IF NOT EXISTS `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

DROP TABLE IF EXISTS `pma__savedsearches`;
CREATE TABLE IF NOT EXISTS `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

DROP TABLE IF EXISTS `pma__table_coords`;
CREATE TABLE IF NOT EXISTS `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

DROP TABLE IF EXISTS `pma__table_info`;
CREATE TABLE IF NOT EXISTS `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

DROP TABLE IF EXISTS `pma__table_uiprefs`;
CREATE TABLE IF NOT EXISTS `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

DROP TABLE IF EXISTS `pma__tracking`;
CREATE TABLE IF NOT EXISTS `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

DROP TABLE IF EXISTS `pma__userconfig`;
CREATE TABLE IF NOT EXISTS `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-09-26 07:45:00', '{\"Console\\/Mode\":\"show\",\"lang\":\"vi\",\"Console\\/Height\":43.99159,\"Export\\/file_template_server\":\"webshop_mobi_G2_K12MT1_260922\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

DROP TABLE IF EXISTS `pma__usergroups`;
CREATE TABLE IF NOT EXISTS `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N',
  PRIMARY KEY (`usergroup`,`tab`,`allowed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

DROP TABLE IF EXISTS `pma__users`;
CREATE TABLE IF NOT EXISTS `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`usergroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';
--
-- Cơ sở dữ liệu: `test`
--
DROP DATABASE IF EXISTS `test`;
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phukien`
--

DROP TABLE IF EXISTS `phukien`;
CREATE TABLE IF NOT EXISTS `phukien` (
  `MaPhuKien` int(11) NOT NULL AUTO_INCREMENT,
  `Ten` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HanBaoHanh` int(11) DEFAULT NULL,
  `GiaTien` float DEFAULT NULL,
  `ChatLuong` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KhoHang` bit(1) DEFAULT NULL,
  PRIMARY KEY (`MaPhuKien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phukien`
--

INSERT INTO `phukien` (`MaPhuKien`, `Ten`, `HanBaoHanh`, `GiaTien`, `ChatLuong`, `KhoHang`) VALUES
(1, 'tai nghe', 6, 1.2, 'A', b'1'),
(2, 'sạc sam sung', 12, 4.2, 'B', b'1'),
(3, 'Pin Iphone11', 12, 36.3, 'A', b'1'),
(4, 'pin sam sung', 12, 5.3, 'B', b'1');
--
-- Cơ sở dữ liệu: `web_oneshop_mobile`
--
DROP DATABASE IF EXISTS `web_oneshop_mobile`;
CREATE DATABASE IF NOT EXISTS `web_oneshop_mobile` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `web_oneshop_mobile`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner_image`
--

DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `title` varchar(64) DEFAULT NULL,
  `sub_title` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `banner_image`
--

INSERT INTO `banner_image` (`banner_id`, `link`, `image`, `sort_order`, `title`, `sub_title`, `description`, `price`, `status`) VALUES
(1, 'index.php?route=product/manufacturer/info&manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0, 'HP Banner', '', '', '0.0000', 0),
(2, '/product-info.php?product_id=63', 'catalog/banners/177a1ef23c2bc971ce48aeac42ea3ec7.jpg', 1, 'iPhone 6', '', '<p><span style=\"background-color: rgb(255, 0, 0);\">Quá đẹp,&nbsp;</span></p><p><span style=\"background-color: rgb(255, 0, 0);\">Quá hoàn mĩ</span></p>', '21000000.0000', 1),
(3, '/product-info.php?product_id=69', 'catalog/banners/iphone-banner-1.jpg', 2, 'iPhone 7', 'Sieu pham cua Apple', '', '0.0000', 1),
(4, 'https://www.apple.com/iphone-x/', 'catalog/banners/f5b52368104c58091a146f4aa4a177c0.jpg', 0, 'iPhone X', 'Say Hello to Future !', '<p><br></p>', '16000000.0000', 1),
(5, 'https://www.nintendo.com', 'catalog/manufacturers/300px-Nintendo_Logo.png', 0, 'chưa có tựa đề', '', '<p><br></p>', '0.0000', 0),
(6, 'http://www.acer.com', '', 0, 'chưa có tựa đề', '', '<p><br></p>', '0.0000', 0),
(7, 'http://www.asus.com', '', 0, 'chưa có tựa đề', '', '<p><br></p>', '0.0000', 0),
(8, 'http://www.canon.com', 'catalog/manufacturers/Canon_logo.png', 0, 'chưa có tựa đề', '', '<p><br></p>', '0.0000', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`, `name`, `description`, `featured`) VALUES
(18, 'catalog/demo/hp_2.jpg', 69, 1, 0, 2, 1, '2009-01-05 21:49:15', '2017-03-03 17:27:09', 'Túi Chống Nước', '<p>\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.</p>\r\n', 0),
(20, 'catalog/banners/banner-1-370x240.jpg', 0, 1, 0, 5, 1, '2009-01-05 21:49:43', '2017-03-03 17:21:01', 'Loại Khác ...', '<p>Desktops deliver more power and flexibility than you can get from a \r\nlaptop, and there are more designs than ever to choose from. Here\'s our \r\nbuying advice, along with our list of the best models we\'ve tested.\r\n            </p><p><span></span></p><p style=\"\">Why on Earth would you want to buy a desktop PC or Mac\r\n in 2016? Simply put, there are computing needs that mobile devices like\r\n laptops and tablets can\'t fulfill as well as the stalwart desktop. \r\nHere\'s what to consider when deciding on your next desktop PC.</p>\r\n\r\n<p style=\"\"><b>It\'s About the Power</b><br>\r\n Desktop-class CPUs and graphics processors are simply more powerful \r\nthan their mobile counterparts for the same money. They give you the \r\npower to finish whatever task you\'re working on in less time. Desktop \r\ncomponents are less expensive in general, so instead of buying a $500 \r\nlaptop with a competent Intel Atom processor, you can buy a $500 desktop\r\n with a powerful Intel Core i5 desktop CPU in it.</p><p></p>', 0),
(24, 'catalog/banners/TemplateMonster/OpenCart/53398/6c1ab453395537ac8fc9cbfb9eb7ffa8.jpg', 0, 1, 0, 3, 1, '2009-01-20 02:36:26', '2018-05-09 17:33:09', 'Camera Phones', 'We always stay in touch with the latest fashion tendencies and hi-tech achievements.', 1),
(25, 'catalog/products/It-peripherals.png', 69, 1, 0, 5, 1, '2009-01-31 01:04:25', '2017-03-03 17:24:55', 'Gậy Selfie', '<div class=\"post-content__excerpt\" itemprop=\"description\">\r\n                    <p>Year by year, the world is migrating from 1080p. \r\n1440p is now become the sweet spot even for mid-range graphics cards. \r\nEven consoles are making a break for the 4K horizon, courtesy of the PS4\r\n Pro and Microsoft\'s Project Scorpio.</p>\r\n<p>But if you want to purchase a 4K monitor today, it\'s not enough to do\r\n it for gaming. There has to be a productivity benefit. So over the last\r\n few months, I\'ve been using one of LG\'s latest 4K monitors - the \r\n27UD88-W, a $900 4K monitor with an IPS panel, FreeSync and a very \r\nversatile USB-C port.                </p></div>', 0),
(26, '', 20, 0, 0, 3, 1, '2009-01-31 01:55:14', '2021-04-20 21:50:36', '4G', '<p><br></p>', 0),
(27, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:34', '2021-04-20 21:50:05', '2G', '<p>https://en.wikipedia.org/wiki/2G</p><p>https://bkaii.com.vn/tin-tuc/306-su-khac-biet-giua-cac-loai-mang-di-dong-gsm-3g-4g-5g</p><p><br></p><p>Trước tiên ta cùng tìm hiểu về mạng 2G:</p><p><br></p><p>Đây chính là thế hệ mạng di động thứ 2 với tên gọi đầy đủ là hệ thống thông tin di động toàn cầu. Mạng 2G có tên tiếng anh là Global System for Mobile Communications hay còn gọi là GSM. Mạng 2G có khả năng phủ sóng rộng khắp, làm cho những chiếc điện thoại có thể được sử dụng ở nhiều nơi trên thế giới. GSM gồm nhiều các trạm thu phát sóng để những điện thoại di động có thể kết nối mạng qua việc tìm kiếm các trạm thu phát gần nhất.</p><p><br></p><p>Mạng 2G chia làm 2 nhánh chính: nền TDMA và CDMA và nhiều dạng kết nối tùy theo yêu cầu sử dụng. Các chuẩn thương mại chính: D-AMPS, GSM/GPRS/EDGE, cdmaOne.</p><p><br></p><p>Khi mạng 2G xuất hiện, chất lượng cuốc gọi được cải thiện đáng kể, tín hiệu và tốc độ cũng tốt hơn rất nhiều so với thế hệ trước đó. Thời gian và chi phí được tiết kiệm khi mã hóa dữ liệu theo dạng kĩ thuật số. Những thiết bị được thiết kế nhỏ gọn và nhẹ hơn, ngoài ra chúng còn có thể thực hiện tin nhắn dạng SMS.</p><p><br></p><p>Những modem truyền thông trong công nghiệp như F2103 cũng sử dụng công nghệ mạng 2G này để thực hiện truyền tải dữ liệu. Nói chung mạng 2G có những tác động khá lớn tới ngành thông tin liên lạc và truyền tải dữ liệu.</p>', 0),
(28, '', 69, 0, 0, 1, 1, '2009-02-02 13:11:12', '2017-03-03 17:21:33', 'Thẻ Nhớ', '<p><br></p>', 0),
(29, '', 69, 0, 0, 1, 1, '2009-02-02 13:11:37', '2017-03-03 17:27:47', 'Pin Sạc Dự Phòng', '<p><br></p>', 0),
(30, '', 69, 0, 0, 1, 1, '2009-02-02 13:11:59', '2017-03-03 17:22:33', 'Tai Nghe', '<p><br></p>', 0),
(31, '', 69, 0, 0, 1, 1, '2009-02-03 14:17:24', '2017-03-03 17:23:39', 'Loa', '<p><br></p>', 0),
(32, '', 69, 0, 0, 1, 1, '2009-02-03 14:17:34', '2017-03-03 17:26:03', 'Móc Dán Điện Thoại', '<p><br></p>', 0),
(45, '', 69, 0, 0, 1, 1, '2009-09-24 18:29:16', '2017-03-03 17:28:20', 'Đế Điện Thoại', '<p>https://www.thegioididong.com/phu-kien-khac?g=de-dien-thoai<br></p>', 0),
(46, '', 69, 0, 0, 0, 1, '2009-09-24 18:29:31', '2017-03-03 17:28:30', 'Cáp Sạc', '<p><br></p>', 0),
(57, 'catalog/demo/category/ipad-2-black.jpg', 69, 1, 0, 1, 1, '2011-04-26 08:53:16', '2017-03-03 17:24:16', 'Miếng Dán Màn Hình', '<span><p style=\"\">There are countless tablets on the market, but which one is right for you? Whether you\'re eyeing an iPad, one of the many <a target=\"_blank\" href=\"http://www.pcmag.com/article2/0,2817,2483566,00.asp\">Android tablets</a> available, or a <a href=\"http://www.pcmag.com/article2/0,2817,2417564,00.asp\" target=\"_blank\">Windows slate</a>\r\n for productivity, here are the key factors you need to consider when \r\nshopping, along with some of the top-rated models we\'ve tested.</p>\r\n\r\n<p style=\"\">We\'d like to make one \r\nnote for the fall: Apple\'s iPad lineup is starting to look a bit old. \r\nIt\'s been almost two full years since the company updated its midrange <a href=\"http://www.pcmag.com/article2/0,2817,2470708,00.asp\">iPad Air</a>\r\n series. It\'s still a fine tablet, but we\'d suggest holding off, if you \r\ncan, to see if Apple announces a late October update, if you\'re looking \r\nfor an iOS tablet that\'s not an iPad Pro.</p></span>', 0),
(69, 'catalog/banners/TemplateMonster/OpenCart/53398/26c78fc586aa2df1afd7c5483d92df0b.jpg', 0, 1, 0, 4, 1, '2015-06-14 04:59:18', '2018-05-09 17:33:31', 'Phụ Kiện', '<p>Our products have some advantages such as durability and reliability. </p>', 1),
(70, '', 0, 1, 0, 1, 1, '2016-02-23 13:58:14', '2017-03-03 17:25:16', 'Điện Thoại Thông Minh', '<p><br></p>', 0),
(71, '', 0, 1, 0, 0, 1, '2016-02-23 13:58:39', '2017-03-03 17:05:19', 'Điện Thoại Cao Cấp', '<p><br></p>', 0),
(72, '', 0, 1, 0, 2, 1, '2016-02-23 13:59:01', '2017-03-03 17:26:01', 'Điện Thoại Phổ Thông', '<p><br></p>', 0),
(73, '', 20, 0, 0, 100, 1, '2016-02-23 14:12:20', '2021-04-20 21:51:01', 'PDA', '<p><br></p>', 0),
(74, 'catalog/banners/TemplateMonster/OpenCart/53398/54097190c9dd11a7b268d5376c0f9825.jpg', 69, 0, 0, 0, 1, '2017-02-17 15:06:36', '2018-05-10 20:06:50', 'Ốp Lưng', '<p>We always stay in touch with the latest fashion tendencies and hi-tech achievements. </p>', 1),
(75, '', 20, 0, 0, 2, 1, '2021-04-20 21:49:29', '2021-04-20 21:50:20', '3G', '<p>https://en.wikipedia.org/wiki/3G</p><p>https://bkaii.com.vn/tin-tuc/306-su-khac-biet-giua-cac-loai-mang-di-dong-gsm-3g-4g-5g<br></p><p>Mạng 3G</p><p><br></p><p>Thế hệ thứ 3 của chuẩn công nghệ điện thoại di động chính là mạng 3G Third-generation technology, cho phép truyền cả dữ liệu thoại như nghe gọi, nhắn tin và dữ liệu ngoài thoại như gửi mail, tải dữ liệu, hình ảnh. Nhờ có 3G ta có thể truy cập Internet cho cả thuê bao cố định hay di chuyển ở các tốc độ khác nhau. Đa số các smart phone hiện nay đều hỗ trợ công nghệ 3G. Hiện nay công nghệ 3G được xây dựng với 4 chuẩn chính: W-CDMA, CDMA2000, TD-CDMA, TD-SCDMA.</p><p><br></p><p>Mạng 3G cải thiện chất lượng cuộc gọi, tín hiệu, tốc độ so với 2G. Ta có thể truy cập Internet tốc độ cao ngay khi đang di chuyển, truy cập thế giới nội dung đa phương tiện: nhạc, phim, hình ảnh chất lượng cao. Người dùng có thể trò chuyện mọi nơi với chi phí rẻ hơn rất nhiều qua các ứng dụng hỗ trợ như: zalo, Viber, Line,…</p>', 0),
(76, '', 20, 0, 0, 4, 1, '2021-04-20 21:52:45', '2021-04-20 21:53:18', '5G', '<p>https://en.wikipedia.org/wiki/5G</p><p><br></p><p>Mạng 5G</p><p>Giống như những gì chúng ta hình dung, 5G nhanh hơn 4G. Hiện tại, mạng 5G mới được lên kế hoạch hoạt động trong dải tần số cao của băng tần không dây – nó nằm giữa 30 GHz và 300 GHz, hay còn được gọi là băng tần bước sóng milimet. Đối với các thiết bị di động, 5G sẽ giúp sửa chữa rất nhiều vấn đề của 4G và các công nghệ không dây hiện tại. Nó sẽ được thiết kế để hỗ trợ đồng thời nhiều người dùng và thiết bị hơn (theo thông số kỹ thuật ITU mỗi cell 5G sẽ hỗ trợ cho 1 triệu thiết bị trên diện tích 1 km2), với tốc độ cao hơn cả 4G. Việc tốc độ dữ liệu của bạn bị chậm đi khi đang ở một sự kiện đông người sẽ chỉ còn là quá khứ.</p><p><br></p><p>Tuy vậy 5G vẫn còn là một khái niệm khá trìu tượng với nước ta. Để 5G có thể trở nên phổ biến phát mất nhiều thời gian nữa.</p>', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_path`
--

DROP TABLE IF EXISTS `category_path`;
CREATE TABLE IF NOT EXISTS `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category_path`
--

INSERT INTO `category_path` (`category_id`, `path_id`, `level`) VALUES
(18, 18, 1),
(18, 69, 0),
(20, 20, 0),
(24, 24, 0),
(25, 25, 1),
(25, 69, 0),
(26, 20, 0),
(26, 26, 1),
(27, 20, 0),
(27, 27, 1),
(28, 28, 1),
(28, 69, 0),
(29, 29, 1),
(29, 69, 0),
(30, 30, 1),
(30, 69, 0),
(31, 31, 1),
(31, 69, 0),
(32, 32, 1),
(32, 69, 0),
(45, 45, 1),
(45, 69, 0),
(46, 46, 1),
(46, 69, 0),
(57, 57, 1),
(57, 69, 0),
(69, 69, 0),
(70, 70, 0),
(71, 71, 0),
(72, 72, 0),
(73, 20, 0),
(73, 73, 1),
(74, 69, 0),
(74, 74, 1),
(75, 20, 0),
(75, 75, 1),
(76, 20, 0),
(76, 76, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `email`, `subject`, `message`, `date_added`, `date_modified`, `phone`, `date`, `address`, `website`) VALUES
(9, 'Nhóm 2', '@gmail.com', 'V/v chính sách khách hàng', 'Tôi có một vài điểm không đồng thuận về chính sách khách hàng.\r\nTôi có một vài điểm không đồng thuận về chính sách khách hàng.\r\nTôi có một vài điểm không đồng thuận về chính sách khách hàng.', '2020-07-05 11:45:21', '2020-07-11 18:11:22', NULL, NULL, NULL, NULL),
(10, 'Ví Văn Dụ', 'vidu@gmail.com', 'Khiếu nại về chất lượng sản phẩm', 'Tôi cực lực lên án cách bán hàng của các vị\r\nTôi cực lực lên án cách bán hàng của các vị\r\nTôi cực lực lên án cách bán hàng của các vị', '2020-07-11 18:17:31', '2020-07-11 18:34:18', '+(84)-0912247115', '2020-07-13 09:35:00', NULL, NULL),
(11, 'Khách Văn Hàng', 'hang@gmail.com', 'Khiếu nại về chất lượng sản phẩm', 'Tôi cực lực lên án\r\nTôi cực lực lên án\r\nTôi cực lực lên án\r\nTôi cực lực lên án', '2020-07-11 22:12:42', '2020-07-14 14:43:59', '0915147115', '2020-07-15 12:15:00', '285 Đội Cấn. Hà Nội', 'http://hang.org');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `address` varchar(128) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`customer_id`, `fullname`, `email`, `telephone`, `address`, `password`, `status`, `date_added`) VALUES
(1, 'Bình', 'binh@fpt.vn', '0979999999', '285 Doi Can, Ba Dinh, HaNoi', '$2y$10$T.kuGeuZQRLuWraL3zclZuHl67q8InDwn4tmzFJ/Tn4lCb2OqaK5G', 1, '2015-07-10 13:37:34'),
(3, 'Quảng', 'quang@bkav.com', '0915686868', '69 Quan Hoa Cầu Giấy Hà Nội', '$2y$10$yeJkGSXTPLQoBX6QqjPlteI9qE496Qkl0z7jsQK0PJUa/pf9kOtua', 1, '2016-03-02 10:55:52'),
(4, 'Đức', 'demo@project.com', '0968686868', 'Playku Gialai2', '$2y$10$P1kJFjMxDqMP0jRhkkXVPuDv8hGLEDLGxmLyaX39.QObjsl0usu9.', 1, '2016-03-06 23:14:33'),
(5, 'Linh', 'linh@gmail.com', '0915147115', 'Hanoi 2', '$2y$10$KcH17v0lydo.ak/7.fEOdO3kPAE1nlZubuhlM3ygN9WBdYRjJ2TAS', 1, '2020-07-03 15:20:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`, `featured`) VALUES
(5, 'HTC', 'catalog/manufacturers/c581962b68eae6dd7dc4550a1f51dd97.png', 0, 1),
(6, 'Palm', 'catalog/manufacturers/palm_logo.jpg', 0, 1),
(7, 'Hewlett-Packard', 'catalog/manufacturers/HP-logo.png', 0, 1),
(8, 'Apple', 'catalog/manufacturers/apple_logo.jpg', 0, 1),
(9, 'Canon', 'catalog/manufacturers/canon_logo.jpg', 0, 1),
(10, 'Sony', 'catalog/manufacturers/sony_logo.jpg', 0, 1),
(11, 'Samsung', 'catalog/5c0112711eb926f473242ba50b1f15b9.png', 0, 1),
(12, 'Nokia', '', 0, 0),
(13, 'LG', '', 0, 0),
(14, 'Asus', 'catalog/7b7a04fc617e97b405dff10b1bf95412.png', 0, 1),
(15, 'Acer', '', 0, 0),
(16, 'BenQ', '', 0, 0),
(17, 'Dell', '', 0, 0),
(18, 'Microsoft', '', 0, 0),
(19, 'Motorola', '', 0, 0),
(20, 'NEC', '', 0, 0),
(21, 'Panasonic', '', 0, 0),
(22, 'Siemens', '', 0, 0),
(23, 'Alcaltel', '', 0, 0),
(24, 'Huawei', '', 0, 0),
(25, 'Oppo', '', 0, 0),
(26, 'O2', '', 0, 0),
(27, 'Philips', '', 0, 0),
(28, 'Sharp', '', 0, 0),
(29, 'Toshiba', '', 0, 0),
(30, 'Vodafone', '', 0, 0),
(31, 'Ericsson', '', 0, 0),
(32, 'Fujitsu', '', 0, 0),
(33, 'BlackBerry', '', 0, 0),
(34, 'Vertu', 'catalog/manufacturers/Vertu_7d69a_450x450.png', 0, 1),
(35, 'Gresso', 'catalog/manufacturers/gresso-logo.jpg', 0, 1),
(36, 'Mobiado', 'catalog/manufacturers/mobiado-logo.png', 0, 1),
(37, 'Google', 'catalog/manufacturers/8c945743520fee24ec76e1182953b1dd.png', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `customer_id`, `email`, `telephone`, `fullname`, `address`, `comment`, `total`, `date_added`) VALUES
(23, 4, 'minhhoahuuvu@gmail.com', '043668866', 'Đức', '285 Doi Can', '', '601.0000', '2015-05-11 22:52:08'),
(25, 4, 'minhhoa2@gmail.com', '0968222222', 'Đức', 'Ngõ 285 Đội Cấn 1', '', '12020000.0000', '2015-06-16 04:16:17'),
(26, 4, 'minhhoa3@gmail.com', '0968333333', 'Đức', 'hà nội 3', '', '4020000.0000', '2015-06-16 04:24:58'),
(27, 4, 'minhhoa4@gmail.com', '0968444444', 'Đức', 'Ngõ 285 Đội Cấn 4', '', '16020000.0000', '2015-06-16 09:36:03'),
(28, 4, 'minhhoa5@gmail.com', '0968555555', 'Đức', 'Palo Alto CA 5', 'Some comment 5, Some comment 5, Some comment 5, Some comment 5\r\nSome comment 5, Some comment 5, Some comment 5, Some comment 5\r\nSome comment 5, Some comment 5, Some comment 5, Some comment 5', '16020000.0000', '2015-06-17 08:14:16'),
(29, 4, 'minhhoa6@gmail.com', '0968 666 666', 'Đức', 'Palo Alto CA 6', 'Some comment on order 6, Some comment on order 6, Some comment on order 6\r\nSome comment on order 6, Some comment on order 6, Some comment on order 6\r\nSome comment on order 6, Some comment on order 6, Some comment on order 6', '12020000.0000', '2015-06-17 09:17:52'),
(30, 4, 'minhhoa7@gmail.com', '0968777777', 'Đức', 'Address 7', 'Some comment on orrder 7 Some comment on orrder 7 Some comment on orrder 7\r\nSome comment on orrder 7 Some comment on orrder 7 Some comment on orrder 7\r\nSome comment on orrder 7 Some comment on orrder 7 Some comment on orrder 7', '14020000.0000', '2015-07-01 05:44:03'),
(31, 4, 'minhhoa8@gmail.com', '0968888888', 'Đức', '285 Doi Can Hanoi', 'I like these products', '6020000.0000', '2015-07-09 09:09:08'),
(32, 4, 'minhhoa9@gmail.com', '0968999999', 'Đức', '285 Doi Can 9', 'Fuck it offf', '14020000.0000', '2015-07-09 09:10:55'),
(33, 4, 'minhhoa10@gmail.com', '0968101010', 'Đức', '258 Doi Can 10', '', '4020000.0000', '2015-07-09 09:14:08'),
(34, 4, 'minhhoa10@gmail.com', '0968101010', 'Đức', '258 Doi Can 10', '', '4020000.0000', '2015-07-09 09:15:17'),
(35, 4, 'minhhoa12@gmail.com', '0968111111', 'Đức', '285 Doi Can', 'Don hang nay mang so bao danh 11', '34020000.0000', '2015-07-09 13:33:00'),
(36, 4, 'minhhoa13@gmail.com', '09681313133', 'Đức', '285 Doi Can 13', 'Fuck offf 13', '4020000.0000', '2015-07-09 13:41:13'),
(37, 1, 'minhhoa@gmail.com', '0968802828', 'minhhoa', '285 Doi Can, Ba Dinh, HaNoi', '', '12020000.0000', '2015-07-11 10:02:33'),
(38, 1, 'minhhoa@gmail.com', '0968802828', 'minhhoa', '285 Doi Can, Ba Dinh, HaNoi', '', '16020000.0000', '2015-07-11 10:02:56'),
(39, 1, 'minhhoa@gmail.com', '0968802828', 'minhhoa', '285 Doi Can, Ba Dinh, HaNoi', 'Some test comment from minhhoa', '6020000.0000', '2015-07-11 11:06:09'),
(40, 4, 'demo@project.com', '0968686868', 'Đức', 'Playku Gialai2', 'Đây là những sản phẩm công nghệ đắt tiền tôi yêu thích, quý công ty vui lòng vận chuyển cẩn thận và phải trực tiếp đến tay tôi.', '82720000.0000', '2016-12-30 09:29:24'),
(41, 0, 'tham@gmail.com', '09688028282', 'Thám', '285 Đội Cấn', 'Đây chỉ là một màn test', '13360000.0000', '2017-04-03 15:57:06'),
(42, 4, 'demo@project.com', '0968686868', 'Đức', 'Playku Gialai2', 'Hello 20170405', '10100000.0000', '2017-04-05 09:41:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_order_details_to_order` (`order_id`),
  KEY `fk_order_details_to_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`) VALUES
(23, 40, 'iPhone', 'product 11', 1, '101.0000', '101.0000'),
(23, 43, 'MacBook', 'Product 16', 1, '500.0000', '500.0000'),
(25, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(25, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(26, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(26, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(27, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(27, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(27, 41, 'iMac', 'Product 14', 1, '2000000.0000', '2000000.0000'),
(27, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(28, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(28, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(28, 41, 'iMac', 'Product 14', 1, '2000000.0000', '2000000.0000'),
(28, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(29, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(29, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(30, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(30, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(30, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(31, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(31, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(31, 41, 'iMac', 'Product 14', 1, '2000000.0000', '2000000.0000'),
(32, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(32, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(32, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(34, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(34, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(35, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(35, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(35, 43, 'MacBook', 'Product 16', 3, '10000000.0000', '30000000.0000'),
(36, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(36, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(37, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(37, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(38, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(38, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(38, 41, 'iMac', 'Product 14', 1, '2000000.0000', '2000000.0000'),
(38, 43, 'MacBook', 'Product 16', 1, '10000000.0000', '10000000.0000'),
(39, 30, 'Canon EOS 5D', 'Product 3', 1, '2000000.0000', '2000000.0000'),
(39, 40, 'iPhone', 'product 11', 1, '2020000.0000', '2020000.0000'),
(39, 41, 'iMac', 'Product 14', 1, '2000000.0000', '2000000.0000'),
(40, 30, 'Pixel C', 'Product 3', 2, '11340000.0000', '22680000.0000'),
(40, 40, 'iPhone 3gs', '3GS', 2, '2020000.0000', '4040000.0000'),
(40, 41, 'iMac', 'iMac MK142ZP/A', 1, '26000000.0000', '26000000.0000'),
(40, 43, 'MacBook', 'Mac Old', 3, '10000000.0000', '30000000.0000'),
(41, 30, 'Pixel C', 'Product 3', 1, '11340000.0000', '11340000.0000'),
(41, 40, 'iPhone 3gs', '3GS', 1, '2020000.0000', '2020000.0000'),
(42, 40, 'iPhone 3gs', '3GS', 5, '2020000.0000', '10100000.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `best_seller` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_to_manufacturer` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `model`, `image`, `manufacturer_id`, `price`, `sort_order`, `status`, `date_added`, `date_modified`, `name`, `description`, `tag`, `best_seller`, `featured`) VALUES
(28, 'Product 1', 'catalog/products/htc/htc_touch_hd_1.jpg', 5, '2000000.0000', 0, 1, '2009-02-03 16:06:50', '2016-12-29 17:14:02', 'HTC Touch HD', '<p>\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8\" WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.</p>\r\n<p>\r\n	<strong>Features</strong></p>\r\n<ul>\r\n	<li>\r\n		Processor Qualcomm® MSM 7201A™ 528 MHz</li>\r\n	<li>\r\n		Windows Mobile® 6.1 Professional Operating System</li>\r\n	<li>\r\n		Memory: 512 MB ROM, 288 MB RAM</li>\r\n	<li>\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams</li>\r\n	<li>\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution</li>\r\n	<li>\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds</li>\r\n	<li>\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)</li>\r\n	<li>\r\n		Device Control via HTC TouchFLO™ 3D &amp; Touch-sensitive front panel buttons</li>\r\n	<li>\r\n		GPS and A-GPS ready</li>\r\n	<li>\r\n		Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets</li>\r\n	<li>\r\n		Wi-Fi®: IEEE 802.11 b/g</li>\r\n	<li>\r\n		HTC ExtUSB™ (11-pin mini-USB 2.0)</li>\r\n	<li>\r\n		5 megapixel color camera with auto focus</li>\r\n	<li>\r\n		VGA CMOS color camera</li>\r\n	<li>\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio</li>\r\n	<li>\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV</li>\r\n	<li>\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI</li>\r\n	<li>\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery</li>\r\n	<li>\r\n		Expansion Slot: microSD™ memory card (SD 2.0 compatible)</li>\r\n	<li>\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A</li>\r\n	<li>\r\n		Special Features: FM Radio, G-Sensor</li>\r\n</ul>\r\n', '', 0, 0),
(29, 'Pro', 'catalog/products/palm/palm_treo_pro_1.jpg', 6, '5599800.0000', 0, 1, '2009-02-03 16:42:17', '2016-12-29 17:16:42', 'Palm Treo Pro', '<p>\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you’re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.</p>\r\n<p>\r\n	<strong>Features</strong></p>\r\n<ul>\r\n	<li>\r\n		Windows Mobile® 6.1 Professional Edition</li>\r\n	<li>\r\n		Qualcomm® MSM7201 400MHz Processor</li>\r\n	<li>\r\n		320x320 transflective colour TFT touchscreen</li>\r\n	<li>\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio</li>\r\n	<li>\r\n		Tri-band UMTS — 850MHz, 1900MHz, 2100MHz</li>\r\n	<li>\r\n		Quad-band GSM — 850/900/1800/1900</li>\r\n	<li>\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication</li>\r\n	<li>\r\n		Built-in GPS</li>\r\n	<li>\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate</li>\r\n	<li>\r\n		256MB storage (100MB user available), 128MB RAM</li>\r\n	<li>\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture</li>\r\n	<li>\r\n		Removable, rechargeable 1500mAh lithium-ion battery</li>\r\n	<li>\r\n		Up to 5.0 hours talk time and up to 250 hours standby</li>\r\n	<li>\r\n		MicroSDHC card expansion (up to 32GB supported)</li>\r\n	<li>\r\n		MicroUSB 2.0 for synchronization and charging</li>\r\n	<li>\r\n		3.5mm stereo headset jack</li>\r\n	<li>\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g</li>\r\n</ul>\r\n', '', 0, 0),
(30, 'Product 3', 'catalog/products/google/1698b1abf1f049c48e0a21bdbaedd1dc.jpg', 37, '11340000.0000', 0, 1, '2009-02-03 16:59:00', '2018-05-08 09:12:44', 'Pixel C', 'Pixcel-C has always offered a uniquely simple yet powerful and immersive\r\n experience. It’s an astounding piece of glass, capable of unlocking new\r\n ways of thinking, creating, and learning. Now, with its expansive \r\nRetina display and uncompromising performance, Pixcel-C Pro adds a new \r\ndimension to everything you do. Like nothing before it, Pixcel-C lets \r\nyou be more creative and more productive — at an entirely new scale. \r\nPixcel-C is more than the next generation of Pixcel-C — it’s an \r\nuncompromising vision of personal computing for the modern world. It \r\nputs incredible power that leaps past most portable PCs at your \r\nfingertips. It makes even complex work as natural as touching, swiping, \r\nor writing with a pencil. And whether you choose the 12.9-inch model or \r\nthe new 9.7-inch model, Pixcel-C is more capable, versatile, and \r\nportable than anything that’s come before. In a word, super.', '', 0, 1),
(31, '16GB', 'catalog/products/microsoft/709b55fa54062f163ba9c188ca9a29b3.png', 18, '19800000.0000', 0, 1, '2009-02-03 17:00:10', '2016-12-29 17:33:10', 'Surface Pro', 'Microsoft Surface Pro has always offered a uniquely simple yet powerful and immersive \r\nexperience. It’s an astounding piece of glass, capable of unlocking new \r\nways of thinking, creating, and learning. Now, with its expansive Retina\r\n display and uncompromising performance, Surface Pro adds a new dimension \r\nto everything you do. Like nothing before it, iPad Pro lets you be more \r\ncreative and more productive — at an entirely new scale. iPad Pro is \r\nmore than the next generation of Surface Pro— it’s an uncompromising vision of\r\n personal computing for the modern world. It puts incredible power that \r\nleaps past most portable PCs at your fingertips. It makes even complex \r\nwork as natural as touching, swiping, or writing with a pencil. And \r\nwhether you choose the 12.9-inch model or the new 9.7-inch model, Surface Pro \r\nPro is more capable, versatile, and portable than anything that’s come \r\nbefore. In a word, super.\r\n    ', '', 0, 0),
(32, 'Pro 9.7 inch', 'catalog/products/apple/01ebb4049048f0c2f6daab4a07f749ab.png', 8, '20490000.0000', 0, 1, '2009-02-03 17:07:26', '2018-05-08 09:11:12', 'iPad Pro 9.7 inch', '<h2 style=\"text-align: justify;\">Chiếc iPad Pro 9.7 inch có cấu hình&nbsp;cực kì mạnh mẽ, sang trọng và trên hết là kích thước được làm gọn hơn.</h2><h3><strong>Thiết kế sang trọng</strong></h3><p style=\"text-align: justify;\">Với những sản phẩm đến từ <a href=\"https://www.thegioididong.com/may-tinh-bang-apple-ipad\" target=\"_blank\" title=\"Máy tính bảng hãng Apple\">Apple</a>\r\n thì điều ưu tiên và tiên quyết của họ là thiết kế sang trọng và bắt \r\nmắt,&nbsp;iPad Pro 9.7 inch&nbsp;được làm từ chất liệu nhôm nguyên khối tạo cho \r\nmáy một cảm giác cầm nắm đầm tay và cực kì sang trọng.</p><p style=\"text-align: justify;\">Ngoài ra, máy còn bổ sung thêm màu hồng vàng cho bạn có nhiều sự lựa chọn.</p>', '', 0, 1),
(33, 'Samsung Galaxy S III', 'catalog/products/samsung/ac3f4adb6fa4dd2d36feb3beeb99923e.png', 11, '2880000.0000', 0, 1, '2009-02-03 17:08:31', '2017-05-11 11:26:37', 'Samsung Galaxy S III ', '<div><p>The main reason of our success is that our commodities are the unique\r\n combination of original design and numerous useful options. We can \r\nsatisfy most whimsical clients because we have a largest choice among \r\nthe competitive stores. Our phones are totally safe for your health \r\nbecause they have passed all tests without any failure. So don’t waste \r\nyour time and purchase our products because our company cares about \r\ntheir clients. We often provide different promos and you can save some \r\nmoney in our store.</p> <p>Our products have some advantages such as durability and reliability. You know nowadays we sell not just <b>hi-tech products</b>;\r\n we sell a part of a style, culture. It is a real mainstream because \r\nthis good is very widespread, indispensable and it has a high sales \r\nrate. We always stay in touch with the latest fashion tendencies and \r\nhi-tech achievements. That is why you can buy stylish and very \r\nfunctional products in our store. We try to provide only positive and \r\neffective solutions.</p> <p>We are proud to offer you our hi-tech <b>original goods</b>.\r\n The products of our store are the real bestsellers and we have a great \r\nnumber of faithful customers. Their testimonials prove that the \r\nreputation of our company is simply perfect. We observe the policy of \r\nproviding only branded commodities. This fact confirms that we sell only\r\n high quality goods at a fair price.</p></div><iframe src=\"//www.youtube.com/embed/Af586Mz5zUQ\" width=\"640\" height=\"360\" frameborder=\"0\"></iframe><div><p><br></p></div>\r\n', '', 0, 0),
(34, 'V10', 'catalog/products/lg/62fd360110aa87bf9041de9d552e776d.png', 13, '15990000.0000', 0, 1, '2009-02-03 18:07:54', '2016-12-29 18:35:43', 'LG V10', '<h3 class=\"text-normal\">MẠNH MẼ HƠN, ĐỘC ĐÁO HƠN</h3>\r\n		\r\n			<p>CHẮC CHẮN &amp; BỀN BỈ: Lớp vỏ dùng chất liệu Dura (thành phần \r\nchính là silicon) và khung viền làm bằng thép 316L - vật liệu thường \r\ndùng để sản xuất đồng hồ cao cấp, khiến LG V10 có được vẻ ngoài mạnh mẽ \r\nvà bền bỉ với thời gian. Màn hình Quantum IPS mang đến màu sắc trung \r\nthực và sắc nét.</p><p><br></p><h3 class=\"text-normal\">THÊM MÀN HÌNH, THÊM KẾT NỐI</h3>\r\n		\r\n			<p>MÀN HÌNH THỨ 2: Dù màn hình chính có tắt hay mở, Màn hình thứ 2 \r\nluôn hiển thị thông tin bạn cần. Khi màn hình chính tắt, màn hình thứ 2 \r\nsẽ thành bảng điện tử hiện thị thông tin 24/7 cho bạn, như thời tiết, \r\nngày giờ, thời lượng pin hoặc tên của chính bạn. </p><h3 class=\"text-normal\">THÊM CAMERA, THÊM GÓC NHÌN</h3>\r\n		\r\n			<p>Trước khi chụp ảnh selfie, bạn có thể chọn camera góc thường hoặc \r\ngóc rộng với 02 camera phía trước này. Camera góc rộng 120° giúp bạn \r\nselfie ở 1 địa điểm nổi tiếng và có thể lấy được toàn bộ khung cảnh \r\nhoành tráng hay với tất cả bạn bè phía sau. Camera góc chuẩn 80° tạo ra \r\nnhững hình ảnh selfie cận mặt mà không cần phải cắt xén thêm.</p>', '', 0, 0),
(36, 'A39', 'catalog/products/oppo/b865868a142e36e9dbbd248adb1abcfa.png', 25, '2000000.0000', 0, 1, '2009-02-03 18:09:19', '2016-12-29 15:32:46', 'Oppo A39', '<h2><strong>OPPO đã giới thiệu thêm một thiết bị với điểm nhấn vẫn là selfie cùng mức giá hấp dẫn hơn là&nbsp;OPPO A39 (Neo 9s).</strong></h2><h3><strong>Thiết kế sang trọng</strong></h3><p>Ngoại\r\n hình của&nbsp;OPPO A39 (Neo 9s) khá giống với những chiếc OPPO được sản xuất\r\n gần đây với phần khung kim loại chắc chắn ở giữa, phần màn hình phía \r\ntrước và phía sau là mặt lưng được làm từ chất liệu nhựa.</p>', '', 0, 0),
(40, '3GS', 'catalog/products/apple/iphone_1.jpg', 8, '2020000.0000', 0, 1, '2009-02-03 21:07:12', '2018-05-08 09:12:06', 'iPhone 3gs', '<p class=\"intro\">\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email. .....</p><img src=\"/web/images/catalog/products/150910-iphone-6s-iphone-6s-plus-official-announcement-03.jpg\" style=\"width: 214.75px; float: right;\"><br><p class=\"intro\"><br></p>\r\n', '', 0, 1),
(41, 'Ultra Sapphire', 'catalog/products/htc/1d1aefb9edea97b19a03a9bb1d429ab7.png', 5, '16990000.0000', 0, 1, '2009-02-03 21:07:26', '2017-05-11 11:48:26', 'HTC U Ultra Sapphire', '<h2 class=\"hero-headline\">Retina. In colossal and ginormous.</h2>\r\n				<p class=\"intro\">The idea behind iMac has never wavered: to craft \r\nthe ultimate desktop experience. The best display, paired with \r\nhigh-performance processors, graphics, and storage — all within an \r\nincredibly thin, seamless enclosure. And that commitment continues with \r\nthe all-new 21.5‑inch iMac with Retina 4K display. Like the \r\nrevolutionary 27‑inch 5K&nbsp;model, it delivers such spectacular image \r\nquality that everything else around you seems to disappear. Adding up to\r\n the most immersive iMac experience yet — and another big, beautiful \r\nstep&nbsp;forward.</p><h2 class=\"section-headline\">More than just a display, it’s a vision.\r\n						</h2>\r\n\r\n						\r\n\r\n						<div class=\"intro\">\r\n							<p>Accuracy. Brightness. Clarity. Regardless of how you measure \r\nthe quality of a display, Retina is in a class by itself. The pixel \r\ndensity is so high that you won’t detect a single one while using iMac. \r\nText is so sharp, you’ll feel like you’re reading email and documents on\r\n a printed page. And with a new, wider color gamut, the Retina display \r\nis able to deliver even more available colors — 25&nbsp;percent more. So \r\nevery photo and video you see appears even more true to&nbsp;life. </p><p><br></p><h2 class=\"section-headline\">Innovation from <br class=\"large-show\">edge to cutting edge.\r\n						</h2>\r\n\r\n						\r\n\r\n						<div class=\"intro\">\r\n							<p>An incredible amount of engineering was required to bring the \r\nRetina display to the iMac family. Witness a design that’s just 5&nbsp;mm at \r\nits edge — yet entirely capable of making everything around you fade \r\ninto the distance. This ensures that nothing gets between you and your \r\nfavorite content. Seamless and beautiful, iMac with Retina display is an\r\n elegant addition to your workspace, representing a depth of technology \r\nat the height of&nbsp;design.</p></div></div>', '', 0, 0),
(43, 'Mac Old', 'catalog/products/htc/b7a686db7062b7f2caf2d26db9a0b981.png', 5, '7990000.0000', 0, 1, '2009-02-03 21:07:49', '2017-05-11 11:54:38', 'HTC Desire Pro 10', '<h2><strong>HTC Desire 10 Pro là smartphone tầm trung mới của HTC với \r\nthiết kế trẻ trung năng động, cấu hình mạnh mẽ với RAM 4 GB và bộ nhớ \r\ntrong 64 GB hứa hẹn sẽ đem lại trải nghiệm tuyệt vời cho người dùng.</strong></h2>', '', 0, 0),
(46, 'XZs', 'catalog/products/sony/4e69b7681d53d1186960e2df9ad60835.png', 10, '14890000.0000', 0, 1, '2009-02-03 21:08:29', '2017-05-11 11:35:35', 'Sony Xperia XZs', '<h2>Sony Xperia XZs là smartphone được Sony đầu tư mạnh mẽ về camera với\r\n hàng loạt các trang bị cao cấp và sở hữu cho mình một mức giá bán hợp \r\nlý với người tiêu dùng.</h2><h3><strong>Thiết kế quen thuộc</strong></h3><p>Máy vẫn sở hữu thiết kế quen thuộc được thừa hưởng từ chiếc&nbsp;<a href=\"https://www.thegioididong.com/dtdd/sony-xperia-xz\" target=\"_blank\" title=\"Điện thoại Xperia XZ\">Xperia XZ</a>&nbsp;đã ra mắt trước đó. Điểm khác biệt để phân biệt nằm ở mặt lưng khi XZs được trang bị cụm camera chính với nhiều cảm biến hơn.</p>', '', 0, 0),
(47, 'S5', 'catalog/products/samsung/6d594cb4725e2f3476b522e7b3e84d77.png', 11, '8100000.0000', 0, 1, '2009-02-03 21:08:40', '2017-05-11 11:20:18', 'Samsung Galaxy S5', '<p>The main reason of our success is that our commodities are the unique\r\n combination of original design and numerous useful options. We can \r\nsatisfy most whimsical clients because we have a largest choice among \r\nthe competitive stores. Our phones are totally safe for your health \r\nbecause they have passed all tests without any failure. So don’t waste \r\nyour time and purchase our products because our company cares about \r\ntheir clients. We often provide different promos and you can save some \r\nmoney in our store.</p> <p>Our products have some advantages such as durability and reliability. You know nowadays we sell not just <b>hi-tech products</b>;\r\n we sell a part of a style, culture. It is a real mainstream because \r\nthis good is very widespread, indispensable and it has a high sales \r\nrate. We always stay in touch with the latest fashion tendencies and \r\nhi-tech achievements. That is why you can buy stylish and very \r\nfunctional products in our store. We try to provide only positive and \r\neffective solutions.</p> <p>We are proud to offer you our hi-tech <b>original goods</b>.\r\n The products of our store are the real bestsellers and we have a great \r\nnumber of faithful customers. Their testimonials prove that the \r\nreputation of our company is simply perfect. We observe the policy of \r\nproviding only branded commodities. This fact confirms that we sell only\r\n high quality goods at a fair price.</p><iframe src=\"//www.youtube.com/embed/bd9OhXnQ7BA\" width=\"640\" height=\"360\" frameborder=\"0\"></iframe><p><br></p>', '', 0, 0),
(48, 'F1 Plus', 'catalog/products/oppo/4ef3d09e080beb70e27510baadb1d8d3.jpg', 25, '9990000.0000', 0, 1, '2009-02-08 17:21:51', '2016-12-29 15:17:18', 'Oppo F1 Plus', '<h2>Oppo F1 Plus có một thiết kế mặt trước rất đẹp, trang bị cảm biến vân tay và camera selfie có độ phân giải lên đến 16 MP.</h2><h3><b>Oppo F1 Plus được thiết kế lấy cảm hứng từ nhà táo cắn dở</b></h3><p style=\"text-align: justify;\">Không thể phủ nhận <a href=\"https://www.thegioididong.com/dtdd/oppo-f1-plus\" title=\"OPPO F1 Plus\" type=\"OPPO F1 Plus\">Oppo F1 Plus</a> lấy cảm hứng thiết kế rất nhiều từ dòng <a href=\"https://www.thegioididong.com/dtdd/iphone-6\" target=\"_blank\" title=\"Điện thoại IPHONE 6 16GB\">iPhone 6</a>, mặt lưng hoàn toàn giống cho tới phần camera lồi.</p>', '', 0, 0),
(49, 'SAM1', 'catalog/products/samsung/samsung_tab_7.jpg', 11, '3999800.0000', 1, 1, '2011-04-26 08:57:34', '2017-05-11 11:38:36', 'Samsung Galaxy Tab 10.1', '<p>\r\n	Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.</p>\r\n<p>\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 – includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick – a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.</p>\r\n<p>\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader’s Hub, Music Hub and Samsung Mini Apps Tray – which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&nbsp;äö</p>\r\n', '', 0, 0),
(60, 'SGH-M919 ', 'catalog/products/samsung/42ac775f7076bd55491b4ec2bf53d792.png', 11, '4960000.0000', 0, 1, '2015-06-22 06:46:02', '2017-05-11 11:08:37', 'Samsung Galaxy S4 SGH-M919 ', '<p>The main reason of our success is that our commodities are the unique\r\n combination of original design and numerous useful options. We can \r\nsatisfy most whimsical clients because we have a largest choice among \r\nthe competitive stores. Our phones are totally safe for your health \r\nbecause they have passed all tests without any failure. So don’t waste \r\nyour time and purchase our products because our company cares about \r\ntheir clients. We often provide different promos and you can save some \r\nmoney in our store.</p> <p>Our products have some advantages such as durability and reliability. You know nowadays we sell not just <b>hi-tech products</b>;\r\n we sell a part of a style, culture. It is a real mainstream because \r\nthis good is very widespread, indispensable and it has a high sales \r\nrate. We always stay in touch with the latest fashion tendencies and \r\nhi-tech achievements. That is why you can buy stylish and very \r\nfunctional products in our store. We try to provide only positive and \r\neffective solutions.</p> <p>We are proud to offer you our hi-tech <b>original goods</b>.\r\n The products of our store are the real bestsellers and we have a great \r\nnumber of faithful customers. Their testimonials prove that the \r\nreputation of our company is simply perfect. We observe the policy of \r\nproviding only branded commodities. This fact confirms that we sell only\r\n high quality goods at a fair price.</p><iframe src=\"//www.youtube.com/embed/C82cDCxPmFQ\" width=\"640\" height=\"360\" frameborder=\"0\"></iframe><p><br></p>', '', 0, 0),
(63, '16GB', 'catalog/products/iphone6s-plus-box-rosegold-2015_GEO_US.jpg', 8, '18890000.0000', 1, 1, '2016-02-23 14:33:11', '2016-02-23 14:41:37', 'iPhone 6s', '<h2 class=\"hero-subtitle subsection-headline\">The only thing that’s changed is&nbsp;everything.</h2><p class=\"hero-subtitle subsection-headline\">The moment you use iPhone 6s, you know you’ve never felt anything like \r\nit. With a single press, 3D Touch lets you do more than ever before. \r\nLive Photos bring your memories to life in a powerfully vivid way. \r\nAnd&nbsp;that’s&nbsp;just the beginning. Take a deeper look at iPhone 6s, and \r\nyou’ll find innovation&nbsp;on every&nbsp;level.</p><p class=\"hero-subtitle subsection-headline\"><br></p><h2 class=\"overview-headline\">The next generation of&nbsp;Multi‑Touch.</h2>\r\n					<p class=\"intro\">The original iPhone introduced the world to \r\nMulti-Touch, forever changing the way people experience technology. With\r\n 3D Touch, you can do things that were never possible before. It senses \r\nhow deeply you press the display, letting you do all kinds of essential \r\nthings more quickly and simply. And it gives you real-time feedback in \r\nthe form of subtle taps from the all-new Taptic Engine.</p><p class=\"intro\"><br></p><h2 class=\"overview-headline\">12MP pictures. 4K videos.<br class=\"small-hide medium-show\"> Live Photos. Lasting memories.</h2>\r\n					<p class=\"intro\">The world’s most popular camera is more advanced \r\nthan ever. The 12-megapixel iSight camera captures sharp, detailed \r\nphotos. It takes brilliant 4K video, up to four times the resolution of \r\n1080p HD video. iPhone 6s also takes selfies worthy of a self-portrait \r\nwith the new 5-megapixel FaceTime HD camera. And it introduces Live \r\nPhotos, a new way to relive your favorite memories. It captures the \r\nmoments just before and after your picture and sets it in motion with \r\njust the press of a finger.</p>', '...', 0, 0),
(64, 'Red Calf', 'catalog/products/vertu_sig_red_calf_c26_phone_front.jpg', 34, '246000000.0000', 1, 1, '2016-02-23 14:50:04', '2016-02-23 16:31:39', 'Vertu', '<p>This quintessential English edition celebrates Vertu\'s provenance with \r\ncaptivating guards red calf leather, complemented by polished stainless \r\nsteel and reflective silver PVD coating on the sapphire faces and \r\nceramic pillow. As we use only the finest, most natural leather, the \r\nappearance of your Vertu may vary slightly from what is shown here.\r\n	        </p><h3 class=\"h5\">HANDMADE IN ENGLAND</h3>\r\n                <p class=\"copy\">Every part of Signature has been hand \r\ncrafted to the most exacting specifications, of a type usually only seen\r\n in luxury watches.</p><h3 class=\"h5\">LEATHER FINISH</h3>\r\n                <p class=\"copy\">The finest leather is hand selected for the perfect grip and hand finished for grain, structure and feel.</p><h3 class=\"h5\">CRYSTAL-CLEAR VOICE CLARITY</h3>\r\n                <p class=\"copy\">Whether you’re making or receiving calls, Signature gives you crystal-clear voice clarity, so you don’t miss a thing.</p><br>\r\n                <section><br></section>', '...', 0, 0),
(65, 'Edge S6', 'catalog/products/Samsung-Galaxy-S6-official-images.jpg', 11, '10500000.0000', 1, 1, '2016-02-23 15:12:12', '2016-12-29 17:35:36', 'Samsung Galaxy Edge s6', '<div class=\"wrap inner-x left\">\r\n<div class=\"title active black m-black\">Chế Tác Tinh Xảo, Rực Rỡ Quyến Rũ</div>\r\n<div class=\"desc active black m-black\">Lấy cảm hứng từ tác phẩm của các \r\nthợ thủy tinh và thợ chế tác kim loại thủ công, chiếc điện thoại Samsung\r\n Galaxy S6 edge là sự kết hợp mượt mà của kính và kim loại. Thiết kế ấn \r\ntượng với màn hình cạnh kép đầu tiên trên thế giới, những đường cong \r\ntuyệt mỹ và mặt kính rực rỡ chói ngời.</div><div class=\"desc active black m-black\"><br></div><div class=\"desc active black m-black\"><div class=\"wrap inner-x right\">\r\n<div class=\"title active black m-black\">Tương Tác Nhiều Hơn với Cạnh Bên</div>\r\n<div class=\"desc active black m-black\">Thêm sắc màu khi tương tác cùng \r\nvới Samsung Galaxy S6 edge. Đánh dấu năm người bạn quan tâm nhất bằng \r\nmàu sắc và chỉ cần chạm vào màu sắc của từng người trên màn hình cạnh để\r\n gọi điện, nhắn tin hay gửi email. Nhờ có tính năng thông báo bằng mã \r\nmàu sắc tiên tiến, bạn có thể dễ dàng biết ai đang liên lạc với bạn dù \r\nđiện thoại đang úp sấp.</div><div class=\"desc active black m-black\"><br></div><div class=\"desc active black m-black\"><div class=\"wrap inner-x left\">\r\n<div class=\"title active black m-black\">Nâng Cao Khẩu Độ, cho Hình Ảnh Rõ Ràng Hơn</div>\r\n<div class=\"desc active black m-black\">Cả camera trước và sau của \r\nSamsung Galaxy S6 edge đều có độ phân giải cao hơn và khẩu độ f/1.9 giúp\r\n bạn chụp được những bức hình rõ ràng hơn dù bạn ở đâu. Nhấn đúp vào nút\r\n Home để vào thẳng chế độ camera và không bao giờ để lỡ một khoảnh khắc \r\nquan trọng nào nữa.</div><div class=\"desc active black m-black\"><br></div><div class=\"desc active black m-black\"><div class=\"wrap inner-x right\">\r\n<div class=\"title active black m-black\">Sạc Pin Nhanh</div>\r\n<div class=\"desc active black m-black\">Không còn phải lo lắng hết pin \r\nnữa. Sau khi sạc pin chỉ trong 10 phút*, bạn có thể sử dụng trong 4 giờ*\r\n nhờ tốc độ sạc pin nhanh. Khả năng tương thích sạc không dây có nghĩa \r\nlà bạn chỉ cần đặt chiếc Samsung Galaxy S6 edge lên một tấm sạc tương \r\nthích là có thể sạc pin không cần dùng dây.</div>\r\n</div></div>\r\n</div></div>\r\n</div></div>\r\n</div>', '...', 0, 0),
(66, 'Lumina 950', 'catalog/products/Lumia-950-performance_en-US.jpg', 18, '10800000.0000', 1, 1, '2016-02-23 15:25:42', '2016-02-23 15:32:49', 'Windows Phone Lumina 950', '<h3 class=\"content-block-enhanced-caption__headline\">\r\n Microsoft Lumia 950</h3>\r\n <p>\r\n High-end features, premium design, and the best Windows 10 experience –\r\n get the phone that works like your PC and turn an ordinary moment into \r\nyour biggest accomplishment</p><div class=\"content-block-enhanced-caption\">\r\n <div class=\"content-block-enhanced-caption-content-wrapper half-wrapper\">\r\n <h3 class=\"content-block-enhanced-caption__headline\">Powered by Windows 10</h3>\r\n <p>\r\n Discover the benefits of one Windows experience. Office documents and \r\nphotos are in sync across devices and your favorite apps, music, and \r\nvideos are in one place with the brand new Windows Store. And with \r\nCortana for Windows 10, you can use your PC to set a location-based \r\nreminder that will arrive just in time on your Lumia.<sup>1</sup></p><h3 class=\"content-block-enhanced-caption__headline\">Built to do great things</h3>\r\n <p>\r\n Unleash the potential of your digital life with a stunning Quad HD \r\ndisplay. Run the most demanding apps without missing a beat and power up\r\n quickly with USB-C Fast Charging. With a super-fast processor, a large \r\ncapacity battery, and wireless charging, the Lumia 950 has the power and\r\n performance that you\'d expect from a premium smartphone.</p><p>\r\n \r\n </p><h3 class=\"content-block-enhanced-caption__headline\">Windows Continuum</h3>\r\n <p>\r\n Connect your Lumia 950 to a Microsoft Display Dock and use it with an \r\nexternal monitor, a keyboard, and a mouse. Office apps and Outlook scale\r\n up to create a big screen-optimized work environment that makes you \r\nmore productive. It’s a PC-like experience that’s powered by your phone.<sup>3</sup></p>\r\n </div>\r\n </div>', '...', 0, 0),
(67, 'Luxury', 'catalog/products/gresso/gresso_product-img.jpg', 35, '60000000.0000', 1, 1, '2016-02-23 16:29:43', '2020-07-23 08:53:49', 'Gresso Regal', '<p>18K Gold. High-strength titanium case. OS Android. Limited Edition.</p><p>Each smartphone is unique. The individual number is engraved on the golden insert            on the back panel. You can choose the smartphone\'s number when you\'\'ll <a href=\"https://gresso.com/landing/regal/en/#12s\" class=\"scroll_to_bay\">place the order</a>.        </p><p>The Cresso Regal Collection consists of 3 models. Each model is unique            and has a perfect combination of exclusive materials and design. <br>Gresso Regal R1 is completely made of            titanium. Gresso Regal R2 and R3 are made of titanium with PVD-coating and have inserts from 18K Gold.            <br>            Gresso Regal Gold is made of titanium with golden PVD-coating and inserts from Yellow Gold.        </p><p>Gresso Regal embodies the uncompromising approach to solving a complex            technological            problem - an ultra-thin smartphone in a titanium body. The smartphone’s thickness is only 8.8            mm.        </p><p>Gresso Regal’s solid case withstands extreme mechanical loads.</p>            <p>The smartphone case is made of a grade 5 solid titanium plate. The key advantages of titanium are its                unique protection properties and lightness. Titanium Grade 5 is widely used in the aerospace industry                and in high-end sport cars. The one of a kind titanium case machining and milling process is labor                intense and it takes 8 hours using high-tech equipment.</p><p>The back panel is satin-finished and performed manually and it takes 3 hours. With this technology, the                desired metal texture is achieved and the case becomes light and durable. The edges on the front panel                are manually polished.</p><p style=\"text-align: left;\"><img src=\"/images/catalog/profiles/quang_nt.jpg\" style=\"width: 205.965px; height: 203.43px; float: left;\">this is really cool, you know</p><p style=\"text-align: left;\">this is really cool, you know</p><p style=\"text-align: left;\">this is really cool, you know</p><p style=\"text-align: left;\">this is really cool, you know</p><p style=\"text-align: left;\">this is really cool, you know</p><p style=\"text-align: left;\">this is really cool, you know</p><p style=\"text-align: left;\">&nbsp;this is really cool, you know</p>', '...', 1, 1),
(68, 'Luxury', 'catalog/products/mobiado/Mobiado-The-One-77-Mobile-Device-Gold-1.jpg', 36, '248000000.0000', 1, 1, '2016-02-23 16:44:19', '2016-12-29 17:34:52', 'Mobiado One-77', '<p>Mobiado là thương hiệu điện thoại di động sang trọng thuộc sở hữu của \r\nCông ty Bonac Innovation Corp. Mobiado được thành lập vào năm 2004 bởi \r\nPeter Bonac, trụ sở chính đặt tại Vancouver, Canada. Peter Bonac cũng là\r\n nhà thiết kế chính cho hầu hết các sản phẩm Mobiado. Mobiado được chế \r\ntác thủ công bằng công nghệ CNC và hoàn thiện bằng tay từng chiếc một...</p>', '...', 0, 0),
(69, '16GB', 'catalog/products/apple/carousel-apple-iphone-7-black-380x380-1.jpg', 8, '18890000.0000', 1, 1, '2016-11-22 18:07:40', '2016-11-22 18:19:30', 'iPhone 7', '<p>iPhone 7 dramatically improves the most important aspects of the iPhone \r\nexperience. It introduces advanced new camera systems. The best \r\nperformance and battery life ever in an iPhone. Immersive stereo \r\nspeakers. The brightest, most colorful iPhone display. Splash and water \r\nresistance.<sup>1</sup> And it looks every bit as powerful as it is. This is iPhone&nbsp;7.</p><section class=\"sub-section sub-section-intro\">\r\n				<div class=\"section-content\">\r\n					<div class=\"section-copy-gutter\">\r\n						<div class=\"row\">\r\n							<div class=\"column large-10 small-12\">\r\n								<p class=\"intro\">iPhone&nbsp;7 reaches a new level of innovation and \r\nprecision. The jet black finish is like nothing we’ve ever made. The \r\nenclosure is splash and water resistant.<sup>1</sup> The Home button is \r\ncompletely reengineered. And with a new unibody design that’s seamless \r\nto the touch, iPhone&nbsp;7 feels as amazing as it&nbsp;looks.</p>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n			</section>\r\n			\r\n				<div class=\"section-content\">\r\n					<div class=\"section-copy-gutter\">\r\n						<div class=\"row\">\r\n							<div class=\"column column-finishes large-9 small-12\">\r\n								<h4 class=\"typography-intro-medium\">Two sizes. Five finishes.</h4>\r\n								<p class=\"typography-intro\">With iPhone&nbsp;7 and iPhone&nbsp;7&nbsp;Plus, \r\nwe’re introducing a beautiful black with a matte finish and a deep, \r\nhigh-gloss jet black. Both the 4.7-inch and 5.5-inch models — \r\nconstructed with incredibly strong 7000 Series aluminum — are also \r\navailable in our signature silver, gold, and rose gold&nbsp;finishes.</p><div class=\"section-content\">\r\n					<div class=\"section-copy-gutter\">\r\n						<div class=\"row\">\r\n							<div class=\"column column-intro-black large-9 small-12\">\r\n								<h4 class=\"typography-intro-medium\">The gold standard of black.</h4>\r\n								<p class=\"typography-intro\">Crafted from bead-blasted aluminum, \r\nour new black model has a rich, deep matte finish. The high-gloss jet \r\nblack finish was achieved through a new feat of design engineering — a \r\nremarkably precise, nine-step process of anodization and polishing.<sup>2</sup>\r\n The end result is so purely and continuously black, you can’t tell \r\nwhere the aluminum ends and the glass begins. The dark side,&nbsp;indeed.</p><p class=\"typography-intro\"><br></p><div class=\"section-content\">\r\n					<div class=\"section-copy-gutter\">\r\n						<div class=\"row\">\r\n							<div class=\"column column-water large-9 small-12\">\r\n								<h4 class=\"typography-intro-medium\">Built to be water resistant.</h4>\r\n								<p class=\"typography-intro\">With its entire enclosure reengineered, iPhone&nbsp;7 is the very first water‑resistant iPhone.<sup>1</sup> So now you’re protected like never before against spills, splashes, and even&nbsp;dust.</p>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div><p class=\"typography-intro\"><br></p>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>', '...', 0, 0),
(70, '256GB', 'catalog/53a98cb82c716f4ecf053f95f6372c82.jpg', 8, '22999000.0000', 1, 1, '2022-09-19 11:13:21', '2022-09-19 12:11:53', 'Iphone 13 pro max', '<ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Công nghệ màn hình::</strong>&nbsp;OLED</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Độ phân giải::</strong>&nbsp;1284 x 2778 Pixels</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Độ phân giải:</strong>&nbsp;3 camera 12 MP, 12 MP</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Hệ điều hành:</strong>&nbsp;iOS 15</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Chip xử lý (CPU):</strong>&nbsp;Apple A15 Bionic 6 nhân</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Bộ nhớ trong (ROM):</strong>&nbsp;128 GB</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>RAM:</strong>&nbsp;6 GB</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Mạng di động:</strong>&nbsp;Hỗ trợ 5G</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Số khe sim:</strong>&nbsp;1 Nano SIM &amp; 1 eSIM</li></ol>', '...', 0, 1),
(71, '128GB', 'catalog/4a3055300583c0cfb7a2aabf88c6b621.png', 8, '24990000.0000', 1, 1, '2022-09-19 12:18:26', '2022-09-19 12:18:26', 'Iphone 14', '<p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Màn hình:&nbsp;</strong><span class=\"comma\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center; margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">OLED</span><span class=\"comma\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center; margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">6.1\"</span><span class=\"\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center; margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">Super Retina XDR</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Hệ điều hành:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">iOS 16</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Camera sau:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">2 camera 12 MP</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Camera trước:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">12 MP</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Chip:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">Apple A15 Bionic</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Dung lượng lưu trữ:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">128 GB</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Bộ nhớ trong:</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">128 GB, 256 GB, 512 GB</span></p>', '...', 0, 1),
(72, '128GB', 'catalog/8999e9ba435562e86ff3d0daf5a09912.png', 8, '27990000.0000', 1, 1, '2022-09-19 12:23:47', '2022-09-19 12:23:47', 'Iphone 14 Plus', '<p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Màn hình:&nbsp;</strong><span class=\"comma\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center; margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">OLED</span><span class=\"comma\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center; margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">6.7\"</span><span class=\"\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center; margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">Super Retina XDR</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Hệ điều hành:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">iOS 16</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Camera sau:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">2 camera 12 MP</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Camera trước:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">12 MP</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Chip:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">Apple A15 Bionic</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Dung lượng lưu trữ:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">128 GB</span></p><p><strong style=\"margin: 0px; padding: 0px; box-sizing: initial; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px; text-align: center;\">Bộ nhớ trong:&nbsp;</strong><span style=\"font-size: 16px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; text-align: center;\">128 GB, 256 GB, 512 GB</span></p>', '...', 0, 1);
INSERT INTO `product` (`product_id`, `model`, `image`, `manufacturer_id`, `price`, `sort_order`, `status`, `date_added`, `date_modified`, `name`, `description`, `tag`, `best_seller`, `featured`) VALUES
(73, '128GB', 'catalog/7c8cb6aab079b904d855771ed0bd6215.png', 8, '30990000.0000', 1, 1, '2022-09-19 12:29:43', '2022-09-19 12:29:43', 'Iphone 14 Pro', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; box-sizing: initial; text-align: center; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 15px 80px 0px; padding: 40px 0px; box-sizing: initial; display: inline-block; width: 276px; text-align: center; border-radius: 15px;\"><div class=\"param__tskt\" style=\"margin: 0px 0px 10px; padding: 0px; box-sizing: initial; line-height: 25px;\"><strong style=\"margin: 0px; padding: 0px; box-sizing: initial;\">Màn hình</strong><div style=\"margin: 0px; padding: 0px; box-sizing: initial;\"><span class=\"comma\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">OLED</span><span class=\"comma\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">6.1\"</span><span class=\"\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">Super Retina XDR</span></div><strong style=\"margin: 0px; padding: 0px; box-sizing: initial;\">Hệ điều hành</strong><div style=\"margin: 0px; padding: 0px; box-sizing: initial;\"><span class=\"\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">iOS 16</span></div><strong style=\"margin: 0px; padding: 0px; box-sizing: initial;\">Camera sau</strong><div style=\"margin: 0px; padding: 0px; box-sizing: initial;\"><span class=\"\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">Chính 48 MP &amp; Phụ 12 MP, 12 MP</span></div><strong style=\"margin: 0px; padding: 0px; box-sizing: initial;\">Camera trước</strong><div style=\"margin: 0px; padding: 0px; box-sizing: initial;\"><span class=\"\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">12 MP</span></div><strong style=\"margin: 0px; padding: 0px; box-sizing: initial;\">Chip</strong><div style=\"margin: 0px; padding: 0px; box-sizing: initial;\"><span class=\"\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">Apple A16 Bionic 6 nhân</span></div><strong style=\"margin: 0px; padding: 0px; box-sizing: initial;\">Dung lượng lưu trữ</strong><div style=\"margin: 0px; padding: 0px; box-sizing: initial;\"><span class=\"\" style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">128 GB</span></div><strong style=\"margin: 0px; padding: 0px; box-sizing: initial;\">Bộ nhớ trong</strong><div style=\"margin: 0px; padding: 0px; box-sizing: initial;\"><span style=\"margin: 0px; padding: 5px 0px; box-sizing: initial; font-size: 16px;\">128 GB, 256 GB, 512 GB, 1 TB</span></div></div><a href=\"https://www.thegioididong.com/dtdd/iphone-14?m=-1\" class=\"button large orange inline\" style=\"margin: 10px auto 0px; padding: 10px; text-decoration-line: initial; transition-duration: 0.2s; transition-timing-function: ease; transition-property: all; color: rgb(255, 255, 255); box-sizing: initial; display: inline-block; font-weight: 600; font-size: 18px; line-height: 23.22px; border-radius: 30px; border: 2px solid transparent; background-image: linear-gradient(43.08deg, rgb(35, 35, 35) 90.49%, rgba(9, 9, 9, 0.61) 107.73%), linear-gradient(rgb(191, 219, 228) 0%, rgb(18, 120, 152) 100%); background-position-x: initial, initial; background-position-y: initial, initial; background-size: initial, initial; background-repeat: repeat, repeat; background-attachment: initial, initial; background-origin: padding-box, border-box; background-clip: padding-box, border-box; width: 162.828px; height: auto;\"></a></li></ul><p><a href=\"https://www.thegioididong.com/dtdd/iphone-14?m=-1\" class=\"button large orange inline\" style=\"margin: 10px auto 0px; padding: 10px; text-decoration-line: initial; transition-duration: 0.2s; transition-timing-function: ease; transition-property: all; color: rgb(255, 255, 255); box-sizing: initial; display: inline-block; font-weight: 600; font-size: 18px; line-height: 23.22px; border-radius: 30px; border: 2px solid transparent; background-image: linear-gradient(43.08deg, rgb(35, 35, 35) 90.49%, rgba(9, 9, 9, 0.61) 107.73%), linear-gradient(rgb(191, 219, 228) 0%, rgb(18, 120, 152) 100%); background-position-x: initial, initial; background-position-y: initial, initial; background-size: initial, initial; background-repeat: repeat, repeat; background-attachment: initial, initial; background-origin: padding-box, border-box; background-clip: padding-box, border-box; width: 162.828px; height: auto; text-align: center;\"></a></p>', '...', 0, 1),
(74, '', 'catalog/1647c4583ccfcb0f73a957d7867f8a25.jpg', 8, '2750000.0000', 1, 1, '2022-09-19 12:33:55', '2022-09-19 12:33:55', 'Tai nghe Bluetooth Apple AirPods 2', '<div class=\"item-warranty-info\" style=\"box-sizing: inherit; display: flex; margin-bottom: 10px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"description\" style=\"box-sizing: inherit; font-size: 14px; margin-top: 2px; max-width: calc(100% - 40px);\">Mới, đầy đủ phụ kiện từ nhà sản xuất</div></div><div class=\"item-warranty-info\" style=\"box-sizing: inherit; display: flex; margin-bottom: 10px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 1.5rem; width: 20px !important; margin-right: 10px;\"><svg height=\"15\" id=\"Layer_1\" data-name=\"Layer 1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 50 50\"><image width=\"50\" height=\"50\" transform=\"translate(0 -4)\" xlink:href=\"data:image/png;base64,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\"></image></svg></div><div class=\"description\" style=\"box-sizing: inherit; font-size: 14px; margin-top: 2px; max-width: calc(100% - 40px);\">AirPods<br style=\"box-sizing: inherit;\">Hộp sạc<br style=\"box-sizing: inherit;\">Cáp Lightning to USB-A<br style=\"box-sizing: inherit;\">Sách HDSD</div></div><div class=\"item-warranty-info\" style=\"box-sizing: inherit; display: flex; margin-bottom: 10px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 1.5rem; width: 20px !important; margin-right: 10px;\"><svg height=\"15\" id=\"Layer_1\" data-name=\"Layer 1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 50 50\"><image width=\"50\" height=\"50\" xlink:href=\"data:image/png;base64,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\"></image></svg></div><div class=\"description\" style=\"box-sizing: inherit; font-size: 14px; margin-top: 2px; max-width: calc(100% - 40px);\">Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.</div></div>', '...', 0, 1),
(75, '', 'catalog/f148491e26fd1b70723bba0dd6989c24.jpg', 8, '4590000.0000', 1, 1, '2022-09-19 12:37:44', '2022-09-19 12:37:44', 'Tai nghe Bluetooth Apple AirPods 3 ', '<div class=\"item-warranty-info\" style=\"box-sizing: inherit; display: flex; margin-bottom: 10px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"description\" style=\"box-sizing: inherit; font-size: 14px; margin-top: 2px; max-width: calc(100% - 40px);\">Mới, đầy đủ phụ kiện từ nhà sản xuất</div></div><div class=\"item-warranty-info\" style=\"box-sizing: inherit; display: flex; margin-bottom: 10px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 1.5rem; width: 20px !important; margin-right: 10px;\"><svg height=\"15\" id=\"Layer_1\" data-name=\"Layer 1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 50 50\"><image width=\"50\" height=\"50\" xlink:href=\"data:image/png;base64,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\"></image></svg></div><div class=\"description\" style=\"box-sizing: inherit; font-size: 14px; margin-top: 2px; max-width: calc(100% - 40px);\">Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.</div></div>', '...', 0, 1),
(76, '', 'catalog/cf6236f568a5ea12fb6f3b1dbc0f9d6a.jpg', 8, '9890000.0000', 1, 1, '2022-09-19 13:29:38', '2022-09-19 13:29:38', ' Tai nghe chụp tai chống ồn Apple AirPods Max', '<div class=\"cps-block-technicalInfo mb-3 ml-3 px-3 pt-3 pb-1\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; max-width: 370px; box-shadow: rgba(60, 64, 67, 0.1) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px; border-radius: 10px; color: rgb(74, 74, 74); font-family: sans-serif; font-size: 16px; margin-bottom: 0.75rem !important; margin-left: 0.75rem !important; padding: 0.75rem 0.75rem 0.25rem !important;\"><ul class=\"technical-content\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; border-radius: 10px; border: 1px solid rgb(229, 231, 235); overflow: hidden;\"><li class=\"technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0.5rem !important; justify-content: space-between !important; align-items: center !important; display: flex !important; width: 332px; font-size: 14px; background-color: rgb(242, 242, 242);\"><p data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; width: 126.391px;\">Pin</p><div data-v-4e304e03=\"\" style=\"box-sizing: inherit; width: 158px;\">- Thời gian nghe nhạc, đàm thoại đến 20 giờ trong một lần sạc khi bật chế độ chống ồn hoặc Transparency<br style=\"box-sizing: inherit;\">- 5 phút sạc cung cấp thời gian nghe khoảng 1.5 giờ</div></li><li class=\"technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0.5rem !important; justify-content: space-between !important; align-items: center !important; display: flex !important; width: 332px; font-size: 14px;\"><p data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; width: 126.391px;\">Trọng lượng</p><div data-v-4e304e03=\"\" style=\"box-sizing: inherit; width: 158px;\">384.8 gram</div></li><li class=\"technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0.5rem !important; justify-content: space-between !important; align-items: center !important; display: flex !important; width: 332px; font-size: 14px; background-color: rgb(242, 242, 242);\"><p data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; width: 126.391px;\">Bluetooth</p><div data-v-4e304e03=\"\" style=\"box-sizing: inherit; width: 158px;\">Bluetooth 5.0</div></li><li class=\"technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0.5rem !important; justify-content: space-between !important; align-items: center !important; display: flex !important; width: 332px; font-size: 14px;\"><p data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; width: 126.391px;\">Chipset</p><div data-v-4e304e03=\"\" style=\"box-sizing: inherit; width: 158px;\">Apple H1</div></li><li class=\"technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0.5rem !important; justify-content: space-between !important; align-items: center !important; display: flex !important; width: 332px; font-size: 14px; background-color: rgb(242, 242, 242);\"><p data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; width: 126.391px;\">Cảm biến</p><div data-v-4e304e03=\"\" style=\"box-sizing: inherit; width: 158px;\">- Cảm biến quang học (2 cốc tai)<br style=\"box-sizing: inherit;\">- Cảm biến vị trí (2 cốc tai)<br style=\"box-sizing: inherit;\">- Cảm biến phát hiện không gian (2 cốc tai)<br style=\"box-sizing: inherit;\">- Gia tốc kế (2 cốc tai)<br style=\"box-sizing: inherit;\">- Con quay hồi chuyển (cốc tai trái)</div></li><li class=\"technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0.5rem !important; justify-content: space-between !important; align-items: center !important; display: flex !important; width: 332px; font-size: 14px;\"><p data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; width: 126.391px;\">Tính năng khác</p><div data-v-4e304e03=\"\" style=\"box-sizing: inherit; width: 158px;\">- Trình điều khiển động do Apple thiết kế<br style=\"box-sizing: inherit;\">- Công nghệ chống ồn chủ động<br style=\"box-sizing: inherit;\">- Chế độ Transparency<br style=\"box-sizing: inherit;\">- Tính năng Adaptive EQ<br style=\"box-sizing: inherit;\">- 8 micro để khử tiếng ồn chủ động, 3 micro để nhận giọng nói</div></li><li class=\"technical-content-item is-flex is-align-items-center is-justify-content-space-between p-2\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin: 0px; padding: 0.5rem !important; justify-content: space-between !important; align-items: center !important; display: flex !important; width: 332px; font-size: 14px; background-color: rgb(242, 242, 242);\"><p data-v-4e304e03=\"\" style=\"box-sizing: inherit; margin-bottom: 0px; padding: 0px; width: 126.391px;\">Hãng sản xuất</p><div data-v-4e304e03=\"\" style=\"box-sizing: inherit; width: 158px;\">Apple Chính hãng</div></li></ul><button class=\"button my-3 is-flex is-justify-content-center\" data-v-4e304e03=\"\" style=\"box-sizing: inherit; appearance: none; align-items: center; border-width: 1px; border-style: solid; border-color: rgb(219, 219, 219); border-radius: 10px; box-shadow: rgba(60, 64, 67, 0.1) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px; font-size: 14px; height: 35px; line-height: 1.5; padding: calc(0.5em - 1px) 1em; position: relative; vertical-align: top; user-select: none; background-color: rgb(255, 255, 255); color: rgb(54, 54, 54); white-space: nowrap; width: 334px; gap: 5px; transition: background-color 0.5s ease 0s; margin-top: 0.75rem !important; margin-bottom: 0.75rem !important; font-family: sans-serif !important; display: flex !important; justify-content: center !important;\">Xem cấu hình chi tiết<div data-v-4e304e03=\"\" style=\"box-sizing: inherit;\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 448 512\" width=\"10\" height=\"10\"><path d=\"M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z\"></path></svg></div></button></div><div class=\"block-sforum\" style=\"box-sizing: inherit; border-radius: 10px; box-shadow: rgba(60, 64, 67, 0.1) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px; margin: 0px 15px 15px; padding: 10px; width: calc(100% - 12px); position: relative; right: 2px; color: rgb(74, 74, 74); font-family: sans-serif; font-size: 16px;\"></div>', '...', 0, 1),
(77, '', 'catalog/e9e816f097025424616ad374c386ab34.png', 8, '340000.0000', 1, 1, '2022-09-19 13:37:10', '2022-09-19 13:38:44', 'Dây cáp Cáp USB-C to Lightning Mophie 1M White/Black - Chính hãng', '<table class=\"table table-border\" style=\"width: 600px; border: 1px solid rgb(222, 222, 222); padding: 5px 8px; font-size: 13px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";\"=\"\"><tbody><tr><td class=\"table-gray\" style=\"background: rgb(239, 239, 239); border-right: 1px solid rgb(222, 222, 222); border-bottom: 1px solid rgb(222, 222, 222); border-left: 1px solid rgb(222, 222, 222); border-top-color: rgb(222, 222, 222); border-image: initial; padding: 5px 8px;\"><strong>Kích thước</strong></td><td style=\"border-right: 1px solid rgb(222, 222, 222); border-bottom: 1px solid rgb(222, 222, 222); border-left: 1px solid rgb(222, 222, 222); border-top-color: rgb(222, 222, 222); border-image: initial; padding: 5px 8px;\">1m</td></tr><tr><td class=\"table-gray\" style=\"background: rgb(239, 239, 239); border-right: 1px solid rgb(222, 222, 222); border-bottom: 1px solid rgb(222, 222, 222); border-left: 1px solid rgb(222, 222, 222); border-top-color: rgb(222, 222, 222); border-image: initial; padding: 5px 8px;\"><strong>Tính năng khác</strong></td><td style=\"border-right: 1px solid rgb(222, 222, 222); border-bottom: 1px solid rgb(222, 222, 222); border-left: 1px solid rgb(222, 222, 222); border-top-color: rgb(222, 222, 222); border-image: initial; padding: 5px 8px;\">Hỗ trợ sạc và truyền tải dữ liệu cao với cổng USB-C PD</td></tr><tr><td class=\"table-gray\" style=\"background: rgb(239, 239, 239); border-right: 1px solid rgb(222, 222, 222); border-bottom: 1px solid rgb(222, 222, 222); border-left: 1px solid rgb(222, 222, 222); border-top-color: rgb(222, 222, 222); border-image: initial; padding: 5px 8px;\"><strong>Hãng sản xuất</strong></td><td style=\"border-right: 1px solid rgb(222, 222, 222); border-bottom: 1px solid rgb(222, 222, 222); border-left: 1px solid rgb(222, 222, 222); border-top-color: rgb(222, 222, 222); border-image: initial; padding: 5px 8px;\">Mophie</td></tr></tbody></table>', '...', 0, 1),
(78, '', 'catalog/8873d6922cb6df9e35fce6236485f1bb.jpg', 8, '650000.0000', 1, 1, '2022-09-19 19:10:02', '2022-09-19 19:11:03', 'Sạc nhanh 20W Apple MHJE3ZA', '<div class=\"item-warranty-info\" style=\"box-sizing: inherit; display: flex; margin-bottom: 10px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"description\" style=\"box-sizing: inherit; font-size: 14px; margin-top: 2px; max-width: calc(100% - 40px);\">Hàng chính hãng Apple Việt Nam, Mới</div></div><div class=\"item-warranty-info\" style=\"box-sizing: inherit; display: flex; margin-bottom: 10px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 1.5rem; width: 20px !important; margin-right: 10px;\"><svg height=\"15\" id=\"Layer_1\" data-name=\"Layer 1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 50 50\"><image width=\"50\" height=\"50\" xlink:href=\"data:image/png;base64,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\"></image></svg></div><div class=\"description\" style=\"box-sizing: inherit; font-size: 14px; margin-top: 2px; max-width: calc(100% - 40px);\">Bảo hành 12 tháng chính hãng, 1 đổi&nbsp;</div></div>', '...', 1, 1),
(79, '', 'catalog/843ce0443b45d0c89babbc2e108917bb.png', 8, '250000.0000', 1, 1, '2022-09-19 19:15:37', '2022-09-19 19:15:37', 'Kinh cường lực iPhone 12 / 12 Pro Kingkong', '<p><br></p>', '...', 0, 1),
(80, '128GB', 'catalog/4225cde8604f6ca908f6bad87c21566b.png', 11, '9950000.0000', 1, 1, '2022-09-19 19:22:34', '2022-09-19 19:23:44', 'Samsung Galaxy A73 5G ', '<ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Công nghệ màn hình::</strong>&nbsp;Super AMOLED Plus</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Độ phân giải::</strong>&nbsp;Full HD+ (1080 x 2400 Pixels)</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Màn hình rộng::</strong>&nbsp;6.7\" - Tần số quét 120 Hz</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Độ phân giải:</strong>&nbsp;Chính 108 MP &amp; Phụ 12 MP, 5 MP, 5 MP, 32 MP</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Chip xử lý (CPU):</strong>&nbsp;Snapdragon 778G 5G 8 nhân</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Bộ nhớ trong (ROM):</strong>&nbsp;128GB</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>RAM:</strong>&nbsp;8GB</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Số khe sim:</strong>&nbsp;2 Nano SIM (SIM 2 chung khe thẻ nhớ)</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\";=\"\" font-size:=\"\" 13px;\"=\"\"><li style=\"padding: 5px;\"><strong>Dung lượng pin:</strong>&nbsp;Li-Ion 5000 mAh</li></ol>', '...', 0, 1),
(81, '', 'catalog/fd9f1e06a13c65c03cb6e16de818d6af.jpg', 8, '250000.0000', 1, 1, '2022-09-21 12:59:48', '2022-09-21 12:59:48', 'Ốp lưng iPhone 14 Pro Max Nhựa cứng viền dẻo Metal COSANO', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 10px; list-style: none; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Kiểu dáng đơn giản, thiết kế chuyên dụng cho dòng&nbsp;iPhone 14 Pro Max.</li><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Nhựa cứng giúp bảo vệ mặt lưng nhờ khả năng chống va đập tốt.</li><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Phần viền được chế tác từ nhựa dẻo, cho phép bạn tháo lắp ốp hoặc sử dụng phần phím nổi vô cùng dễ dàng.</li><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Trang bị móc treo tiện dụng, có thể móc vào dây đeo mà không cần phải cầm theo túi đựng.</li></ul>', '...', 0, 1),
(82, '', 'catalog/ab43f2e6d29f17c1fb362dab2172262a.jpg', 11, '150000.0000', 1, 1, '2022-09-21 13:02:32', '2022-09-21 13:02:32', 'Ốp lưng Galaxy A73 Nhựa dẻo Kick Grad Handle TPU JM', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 10px; list-style: none; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Thiết kế tối giản, màu sắc trẻ trung, hợp thời trang.</li><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Chất liệu nhựa dẻo cho cảm giác cầm nắm mềm mại, dễ chịu.</li><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Thiết kế ôm trọn điện thoại&nbsp;Galaxy A73 với các chi tiết cắt khoét tỉ mỉ.</li><li style=\"margin: 0px; padding: 0px; display: block; line-height: 25px; border: none;\">Phần chân đế có thể mở ra và gấp gọn tiện lợi.</li></ul>', '...', 0, 1),
(83, '128GB', 'catalog/53a98cb82c716f4ecf053f95f6372c82.jpg', 8, '3249000.0000', 1, 1, '2022-09-24 13:53:26', '2022-09-24 13:53:26', 'Điện thoại di động Apple iPhone 13 Pro - 512GB - Chính hãng VN/A', '<ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Công nghệ màn hình::</strong>&nbsp;OLED</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Độ phân giải::</strong>&nbsp;1170 x 2532 Pixels</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Độ phân giải:</strong>&nbsp;3 camera 12 MP, 12 MP</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Hệ điều hành:</strong>&nbsp;iOS 15</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Chip xử lý (CPU):</strong>&nbsp;Apple A15 Bionic 6 nhân</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Bộ nhớ trong (ROM):</strong>&nbsp;512 GB</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>RAM:</strong>&nbsp;6 GB</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Mạng di động:</strong>&nbsp;Hỗ trợ 5G</li></ol><ol style=\"list-style: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;; font-size: 13px;\"><li style=\"padding: 5px;\"><strong>Số khe sim:</strong>&nbsp;1 Nano SIM &amp; 1 eSIM</li></ol>', '...', 0, 1),
(84, '', 'catalog/56fb449c1af2f8efd699da48b1ca58eb.jpg', 11, '500000.0000', 1, 1, '2022-09-26 14:05:49', '2022-09-26 14:05:49', 'Cáp sạc nhanh đa năng 3in2 100W Remax RC-C012', '<table style=\"background-color: rgb(255, 255, 255); position: relative; border: 1px solid rgb(226, 226, 226); width: 895px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\">Nguồn ra USB:</td><td style=\"padding: 5px 6px; border-right: none;\"><ul><li>USB to Lightning: 9V - 2A (15W)</li><li>USB to Type C: 11V - 6A (15W)</li><li>USB to Micro: 9V - 2A (18W)</li><li>USB to Lightning + Type C + Micro: 5V - 3A (20W)</li><li>USB to Lightning + Type C: 5V - 3.6A (20W)</li><li>USB to Lightning + Micro: 5V - 2.6A (15W)</li><li>USB to Type C + Micro: 5V - 2A (15W)</li></ul></td></tr><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\">Nguồn ra Type C:</td><td style=\"padding: 5px 6px; border-right: none;\"><ul><li>Type C to Lightning: 9V - 3A (20W)</li><li>Type C to Type C: 20V - 5A (100W)</li><li>Type C to Micro: 9V - 2A (18W)</li><li>Type C to Lightning + Type C + Micro: 5V - 3A (20W)</li><li>Type C to Lightning + Type C: 5V - 3.6A (20W)</li><li>Type C to Lightning + Micro: 5V - 2.6A (15W)</li><li>Type C to Type C + Micro: 5V - 2A (20W)</li></ul></td></tr></tbody></table>', '...', 0, 1),
(85, 'RC-193i', 'catalog/1183597390101f3b5341133978599757.jpg', 11, '300000.0000', 1, 1, '2022-09-26 14:15:37', '2022-09-26 14:15:37', 'Cáp sạc thông minh Type C to Lightning 20W Remax RC-193i', '<table style=\"background-color: rgb(255, 255, 255); position: relative; border: 1px solid rgb(226, 226, 226); width: 895px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><tbody><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\"><strong>Giao diện:</strong></td><td style=\"padding: 5px 6px; border-right: none;\">Type C to Lightning</td></tr><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\"><strong>Output:</strong></td><td style=\"padding: 5px 6px; border-right: none;\">5V-3A/9V-2.22A/12V-1.67A 20W (Max)</td></tr><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\"><strong>Truyền dữ liệu:</strong></td><td style=\"padding: 5px 6px; border-right: none;\">480Mb/s</td></tr><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\"><strong>Chiều dài:</strong></td><td style=\"padding: 5px 6px; border-right: none;\">1m</td></tr><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\"><strong>Vật liệu:</strong></td><td style=\"padding: 5px 6px; border-right: none;\">ABS + vải bện + hợp kim nhôm</td></tr><tr style=\"background: rgb(241, 241, 241); border-bottom: 1px solid rgb(212, 212, 212);\"><td style=\"padding: 5px 6px; border-right: 1px solid rgb(199, 199, 199);\"><strong>Trọng lượng:</strong></td><td style=\"padding: 5px 6px; border-right: none;\">27g</td></tr></tbody></table>', '...', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`image`),
  KEY `product_id` (`product_id`),
  KEY `fk_product_image_to_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`product_id`, `image`, `sort_order`) VALUES
(28, 'catalog/products/htc/c1b693278fbd97b1e158eb2da3e06100.jpg', 3),
(28, 'catalog/products/htc/htc_touch_hd_2.jpg', 2),
(28, 'catalog/products/htc/htc_touch_hd_3.jpg', 2),
(29, 'catalog/products/palm/palm_treo_pro_2.jpg', 0),
(29, 'catalog/products/palm/palm_treo_pro_3.jpg', 0),
(30, 'catalog/products/google/08d2c585e5fe8bde0114c98401a35d58.png', 0),
(30, 'catalog/products/google/5c9e16db87c22f84b7ec735b6285de91.png', 0),
(30, 'catalog/products/google/87730463a457b26ea2de14d12f7dd6af.jpg', 0),
(31, 'catalog/products/microsoft/135794a23f49ddb5d6926b77d639f846.png', 0),
(31, 'catalog/products/microsoft/284d013e5d3afc1cc1da968f43f36261.png', 0),
(31, 'catalog/products/microsoft/9a7b5eeaf613e4880d3943ae73fe2d74.png', 0),
(32, 'catalog/products/apple/402a9abe654509d6f184b1438377e274.jpg', 0),
(32, 'catalog/products/apple/90164a7c7a75051aa9dc1e5510b812e6.jpg', 0),
(32, 'catalog/products/apple/d34e4e7d78c0794a4476b77df3c7a5b3.jpg', 0),
(33, '', 0),
(33, 'catalog/products/samsung/3f331cd21661241c912b8963fd3bdaa8.png', 0),
(33, 'catalog/products/samsung/5397bb727b863710f5f127f2bf3368f2.png', 0),
(33, 'catalog/products/samsung/982a5615df656ec979ee6831ab81d90b.png', 0),
(34, 'catalog/products/lg/48603f9a02338c6bf65611073419cb39.jpg', 0),
(34, 'catalog/products/lg/58be9e07e3af3fbebace26b1bdfc4f01.jpg', 0),
(34, 'catalog/products/lg/6e183b480c403826f99b943fa3dee9ee.jpg', 0),
(34, 'catalog/products/lg/8600c14c4e98416d94a28327a318e3d8.jpg', 0),
(36, 'catalog/products/oppo/199c84e011b819dea707fdaa47582ea4.png', 0),
(36, 'catalog/products/oppo/660833d93cb2acbf78ba09997a9a1c4c.png', 0),
(36, 'catalog/products/oppo/69b9df383f3a49b486814f28fa87c9c3.jpg', 0),
(36, 'catalog/products/oppo/c087ff3e70856e1c25798d4e14660f11.png', 0),
(40, 'catalog/products/apple/iphone_1.jpg', 0),
(40, 'catalog/products/apple/iphone_2.jpg', 0),
(40, 'catalog/products/apple/iphone_3.jpg', 0),
(40, 'catalog/products/apple/iphone_4.jpg', 0),
(40, 'catalog/products/apple/iphone_5.jpg', 0),
(40, 'catalog/products/apple/iphone_6.jpg', 0),
(41, 'catalog/products/htc/14f7dfc869a83c1b8c7514d92b1f7c33.jpg', 0),
(41, 'catalog/products/htc/1dadfee2052d13e1b9684f60ef666d8b.jpg', 0),
(41, 'catalog/products/htc/bf09a2893b1cee029cabc1582f56211a.jpg', 0),
(41, 'catalog/products/htc/c14af4eab688f2312f7b449d858858d3.png', 0),
(43, 'catalog/products/htc/a304a0ddd57964b84b6a5ea4e6f97ca4.jpg', 0),
(43, 'catalog/products/htc/c67eb67ba88eb95b89c32f2de85d1be1.jpg', 0),
(43, 'catalog/products/htc/cb63d8e31541c845ab7971d4535464d4.jpg', 0),
(43, 'catalog/products/htc/cdf0345b0b6cc1c8002a017b3cc5d519.jpg', 0),
(46, 'catalog/products/sony/922d51526770dd402d736f1a25f0c861.jpg', 0),
(46, 'catalog/products/sony/ad18909b786c75f6c0c9022142ac47b7.jpg', 4),
(46, 'catalog/products/sony/c6871ecca8c84f183eb397e5774539d2.jpg', 1),
(46, 'catalog/products/sony/db12052b4af7068301d16503f8233cd1.jpg', 3),
(46, 'catalog/products/sony/e4e650745046abf8e4d42f77eedd64e3.jpg', 2),
(47, 'catalog/products/samsung/af5b4d863291f97fd136a2db0edf407c.png', 0),
(47, 'catalog/products/samsung/caf855016c542daa95fc130294b20ba7.png', 0),
(47, 'catalog/products/samsung/dfb98f5865de4af3307366700f34fe5b.png', 0),
(48, 'catalog/products/oppo/47f5c8439db6b020f1e4fded7e701dcc.png', 0),
(48, 'catalog/products/oppo/f25ae1a9665c77511448e4db7c2389e0.jpg', 0),
(48, 'catalog/products/oppo/f661bea42a7fa97a19e90905961b09c9.jpg', 0),
(49, 'catalog/products/samsung/samsung_tab_1.jpg', 0),
(49, 'catalog/products/samsung/samsung_tab_2.jpg', 0),
(49, 'catalog/products/samsung/samsung_tab_3.jpg', 0),
(49, 'catalog/products/samsung/samsung_tab_4.jpg', 0),
(49, 'catalog/products/samsung/samsung_tab_5.jpg', 0),
(60, 'catalog/products/samsung/3111f2d7721202876d368b88cb3f97db.png', 0),
(60, 'catalog/products/samsung/42ac775f7076bd55491b4ec2bf53d792.png', 2),
(60, 'catalog/products/samsung/dfb98f5865de4af3307366700f34fe5b.png', 1),
(63, 'catalog/products/150910-iphone-6s-iphone-6s-plus-official-announcement-03.jpg', 0),
(63, 'catalog/products/783_img1.jpg', 0),
(63, 'catalog/products/Apple-iPhone-6---iPhone-Plus---all-the-official-images32b3b0b3d3c5105c58c730337aee36d5.jpg', 0),
(63, 'catalog/products/Apple-iPhone-6s---all-the-official-images.jpg', 0),
(63, 'catalog/products/iphone6s-collection.jpg', 0),
(64, 'catalog/products/20151222171728_vertu_sig_red_calf_c26_phone_keypad.jpg', 0),
(64, 'catalog/products/red-calf-255x309.jpg', 0),
(64, 'catalog/products/vertu-signature-s-silver-red-calf-9.jpg', 0),
(65, 'catalog/products/galaxy_s6_edge_combination2_gold_platinum.jpg', 0),
(65, 'catalog/products/s6-edge-1.jpg', 0),
(65, 'catalog/products/s6-edge-2.jpg', 0),
(65, 'catalog/products/s6-edge-4.jpg', 0),
(65, 'catalog/products/s6-edge-5.jpg', 0),
(65, 'catalog/products/s6-edge-7.jpg', 0),
(65, 'catalog/products/s6-edge6.jpg', 0),
(66, 'catalog/products/Lumia-950-Coming-Soon-jpg.jpg', 0),
(66, 'catalog/products/Lumia-950-hero-jpg.jpg', 0),
(66, 'catalog/products/Lumia-950-performance-jpg.jpg', 0),
(66, 'catalog/products/Lumia-950-Specifications-jpg.jpg', 0),
(67, 'catalog/products/gresso/gresso-3.jpg', 0),
(67, 'catalog/products/gresso/gresso-4.jpg', 0),
(67, 'catalog/products/gresso/gresso-5.jpg', 0),
(67, 'catalog/products/gresso/gresso_product-img-1.jpg', 0),
(67, 'catalog/products/gresso/gresso_product-img-2.jpg', 0),
(68, 'catalog/products/mobiado/Mobiado-The-One-77-Mobile-Device-Gold-2.jpg', 0),
(68, 'catalog/products/mobiado/Mobiado-The-One-77-Mobile-Device-Gold-3.jpg', 0),
(68, 'catalog/products/mobiado/Mobiado-The-One-77-Mobile-Device-Gold-4.jpg', 0),
(68, 'catalog/products/mobiado/Mobiado-The-One-77-Mobile-Device-Gold-5.jpg', 0),
(69, 'catalog/products/apple/apple-iphone-7-1.jpg', 0),
(69, 'catalog/products/apple/images1780090_Them_7_tinh_n_ng_de_iPhone_7_b_t_bai.jpg', 0),
(69, 'catalog/products/apple/iphone-7-render.jpg', 0),
(69, 'catalog/products/apple/iphone7-gold.jpg', 0),
(71, 'catalog/4a3055300583c0cfb7a2aabf88c6b621.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_to_category`
--

DROP TABLE IF EXISTS `product_to_category`;
CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `fk_product_to_category_to_category` (`category_id`),
  KEY `fk_product_to_category_to_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
(28, 24),
(28, 72),
(29, 24),
(29, 72),
(30, 57),
(31, 57),
(32, 57),
(33, 70),
(34, 24),
(34, 70),
(36, 24),
(36, 70),
(40, 70),
(41, 70),
(43, 70),
(46, 70),
(47, 70),
(48, 24),
(48, 70),
(49, 70),
(60, 70),
(63, 24),
(63, 70),
(64, 24),
(64, 71),
(65, 24),
(65, 70),
(66, 70),
(67, 24),
(67, 71),
(68, 71),
(69, 24),
(69, 70),
(70, 71),
(71, 71),
(72, 71),
(73, 71),
(74, 30),
(75, 30),
(76, 30),
(77, 46),
(78, 46),
(79, 57),
(80, 70),
(81, 74),
(82, 74),
(83, 70),
(84, 46),
(85, 46);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `setting`
--

INSERT INTO `setting` (`setting_id`, `key`, `value`) VALUES
(171, 'config_name', 'Ask Me Mobile'),
(172, 'config_owner', 'Steve Jobs'),
(173, 'config_address', '54 phố Lê Thanh Nghị - quận Hai Bà Trưng. t.p Hà Nội. Việt Nam.'),
(176, 'config_telephone', '0968999888'),
(178, 'config_image', 'catalog/logos/Apple_logo.png'),
(179, 'config_open', '08h:00'),
(180, 'config_comment', 'Cửa hành chỉ nhận thanh toán tiền mặt.'),
(194, 'config_product_count', '1'),
(195, 'config_product_limit', '15'),
(196, 'config_product_description_length', '100'),
(197, 'config_limit_admin', '20'),
(220, 'config_order_mail', '0'),
(231, 'config_logo', 'catalog/logos/Apple_logo.png'),
(232, 'config_icon', 'catalog/icons/Apple-icon-16x16.png'),
(233, 'config_image_category_width', '80'),
(234, 'config_image_category_height', '80'),
(235, 'config_image_thumb_width', '228'),
(236, 'config_image_thumb_height', '228'),
(237, 'config_image_popup_width', '500'),
(238, 'config_image_popup_height', '500'),
(239, 'config_image_product_width', '228'),
(240, 'config_image_product_height', '228'),
(241, 'config_image_additional_width', '74'),
(242, 'config_image_additional_height', '74'),
(243, 'config_image_related_width', '80'),
(244, 'config_image_related_height', '80'),
(245, 'config_image_compare_width', '90'),
(246, 'config_image_compare_height', '90'),
(247, 'config_image_wishlist_width', '47'),
(248, 'config_image_wishlist_height', '47'),
(249, 'config_image_cart_width', '47'),
(250, 'config_image_cart_height', '47'),
(251, 'config_image_location_width', '268'),
(252, 'config_image_location_height', '50'),
(269, 'config_file_max_size', '300000'),
(270, 'config_file_ext_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods'),
(271, 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet'),
(272, 'config_maintenance', '0'),
(273, 'config_password', '1'),
(275, 'config_compression', '0'),
(276, 'config_error_display', '1'),
(277, 'config_error_log', '1'),
(278, 'config_error_filename', 'error.log'),
(280, 'config_email', 'stevejobs@gmail.com'),
(281, 'config_url', 'http://localhost:82/xxxxxx/'),
(282, 'products_featured_limit', '8'),
(283, 'products_best_seller_limit', '5'),
(284, 'html_google_map_embed', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.7297008861333!2d105.8469290148016!3d21.003469486012065!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ad58455db2ab%3A0x9b3550bc22fd8bb!2zNTQgTMOqIFRoYW5oIE5naOG7iywgQsOhY2ggS2hvYSwgSGFpIELDoCBUcsawbmcsIEjDoCBO4buZaSwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1618929186381!5m2!1sen!2s\" style=\"border:0; width: 100%;\"  height=\"450\" allowfullscreen=\"\" loading=\"lazy\"></iframe>'),
(285, 'config_post_limit', '15'),
(286, 'categories_featured_limit', '5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `due_date` datetime NOT NULL DEFAULT '2099-01-01 23:00:00',
  `phone` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `email`, `image`, `code`, `status`, `date_added`, `due_date`, `phone`, `description`, `sort_order`) VALUES
(1, 'admin', '$2y$10$vzrKncAiLpjdxkUk/Eg8ZuKNmxO6l0274wpRlLSPn9mg.bRq136r.', 'Bùi Quyết Chiến', 'buichien712002@gamil.com', 'catalog/b1e03610572bfdc45e754ca5cfdb0738.jpg', '', 1, '2015-01-29 08:07:20', '2099-01-01 23:00:00', '0347977646', '<p><span style=\"font-size: 16px;\" lang=\"IT-IT\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Passionate about digital marketing, good food, animals, nature and coffee. </font><font style=\"vertical-align: inherit;\">I have lived abroad for many years, and have never stopped looking for good food, especially what could make me feel at home. </font><font style=\"vertical-align: inherit;\">Unfortunately even in times of globalization, certain products are not available in stores or on the Internet. </font></font><br><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">\r\n \r\n	               Foodgenuine is an ambitious and special project, our aim\r\n is to \"reduce\" the distances and bring you that \"good time\", no matter \r\nwhere you are. </font></font><br><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> \r\n	               I love pizza and pasta, and I could always eat Genoese focaccia. </font></font><br><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> \r\n	               My slogan? </font><font style=\"vertical-align: inherit;\">\"You are what you eat\".</font></font></span></p>', 0),
(4, 'manh', '$2y$10$uHu9NptFMiQz95TxfcyAVeSBlzR3MykITxSHMzqkgPSL2eZGxKT.C', 'Nguyễn Đức Mạnh', 'nguyenmanh@gmail.com', 'catalog/4860ffe9f873d7d018a8e4fdfa56fea1.jpg', '', 1, '2015-04-03 17:32:02', '2099-01-01 23:00:00', '0349767888', '<p><span style=\"font-size: 16px;\" lang=\"IT-IT\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">A lover of technology and the internet, I have worked in the Netherlands for more than 7 years in this area. </font><font style=\"vertical-align: inherit;\">I Holland food is not a factor of pride and my passion for good food and the difficulty of finding it in supermarkets and on the net has weighed heavily on my stay abroad. </font></font><br><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">	               Driven by this need, I started the creation of Foodgenuine, an e-commerce for the sale of food and drinks that are genuine, healthy, natural and non-industrial. </font></font><br><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">	               My goal is also to offer small producers the opportunity to sell their products worldwide. </font></font><br><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">	               Good and healthy food for everyone; </font><font style=\"vertical-align: inherit;\">\" </font></font><span style=\"font-style: italic;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">food is not filling your belly, food is health</font></font></span><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> \".</font></font></span></p>', 3),
(5, 'MANH', '$2y$10$dRs1uiYItoIfGMMKzNlcY.K4o599.Ce7lVSf/fVB87LLublUYA4Vu', 'Nguyễn Đức Mạnh', 'ducmanh@gmail.com', 'catalog/0e047c41a22fa3068084f94e97c2833b.jpg', '', 1, '2015-04-06 18:25:04', '2099-01-01 23:00:00', '0349799999', '<p><span style=\"font-size: 16px;\" lang=\"IT-IT\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Passionate\r\n about the internet and technology, health and well-being, I like to \r\ntravel and taste the typical products of different locations in search \r\nof the best products and unique flavors. </font></font><br><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">\r\n	               So I decided to take part in the Foodgenuine project taking care of the IT aspect.</font></font></span></p>', 2),
(7, 'khuong', '$2y$10$3Pbu45iDdsEUoCEPsMbxJuRi7KeQU.P./SvNOMODIlPN.62Dg05n2', 'Cao Duy Khương', 'khuong@gov.com', 'catalog/afc96983793dd635136c552f11ca5817.jpg', '', 1, '2020-07-09 22:45:42', '2099-01-01 23:00:00', '098768899', '<p><br></p>', 0);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_to_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `fk_order_details_to_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_to_manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
