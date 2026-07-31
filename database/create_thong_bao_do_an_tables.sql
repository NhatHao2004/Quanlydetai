-- Tạo các bảng còn thiếu cho module Thông báo đồ án

CREATE TABLE IF NOT EXISTS `thong_bao_do_an_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(500) DEFAULT 'Thông báo đồ án',
  `subtitle` text DEFAULT NULL,
  `date_badge` varchar(100) DEFAULT NULL,
  `trang_thai` enum('mo','khoa') NOT NULL DEFAULT 'mo',
  `ngay_bat_dau` date DEFAULT NULL,
  `ngay_ket_thuc` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `thong_bao_do_an_content` (`page_title`, `subtitle`, `date_badge`, `trang_thai`) 
VALUES ('Thông báo đồ án', 'Thông tin và lịch trình đồ án tốt nghiệp', 'Năm học 2024-2025', 'mo');

CREATE TABLE IF NOT EXISTS `thong_bao_do_an_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loai` varchar(50) NOT NULL DEFAULT 'dang_ky',
  `thu_tu` int(11) NOT NULL DEFAULT 1,
  `tieu_de` varchar(500) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `ngay` int(11) DEFAULT NULL,
  `thang` int(11) DEFAULT NULL,
  `nam` int(11) DEFAULT NULL,
  `yeu_cau` text DEFAULT NULL,
  `trang_thai` enum('mo','khoa') NOT NULL DEFAULT 'mo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `thong_bao_do_an_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(500) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `trang_thai` enum('mo','khoa') NOT NULL DEFAULT 'mo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
