-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 30, 2026 lúc 06:30 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qldt_database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cai_dat`
--

CREATE TABLE `cai_dat` (
  `id` int(11) NOT NULL,
  `key_name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cai_dat`
--

INSERT INTO `cai_dat` (`id`, `key_name`, `value`, `mo_ta`, `updated_at`) VALUES
(7, 'gv_limit_135', '7', 'Số đề tài tối đa cho giảng viên ID 135', '2026-03-28 02:40:20'),
(11, 'so_ke_hoach', '', 'Số kế hoạch hiển thị trong báo cáo', '2026-04-07 09:29:40'),
(12, 'ngay_ke_hoach', '', 'Ngày kế hoạch hiển thị trong báo cáo', '2026-04-07 09:29:40'),
(15, 'gv_limit_csn_113', '10', 'Số đề tài CSN tối đa cho giảng viên ID 113', '2026-07-30 16:00:06'),
(16, 'gv_limit_csn_121', '10', 'Số đề tài CSN tối đa cho giảng viên ID 121', '2026-07-30 15:58:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dang_ky_de_tai`
--

CREATE TABLE `dang_ky_de_tai` (
  `id` int(11) NOT NULL,
  `sinh_vien_id` int(11) NOT NULL,
  `de_tai_id` int(11) NOT NULL,
  `trang_thai` enum('cho_duyet','da_duyet','tu_choi') DEFAULT 'cho_duyet',
  `ly_do_tu_choi` text DEFAULT NULL,
  `ngay_dang_ky` timestamp NOT NULL DEFAULT current_timestamp(),
  `ngay_duyet` timestamp NULL DEFAULT NULL,
  `nguoi_duyet_id` int(11) DEFAULT NULL,
  `giang_vien_cham_id` int(11) DEFAULT NULL,
  `ngay_phan_cong_cham` timestamp NULL DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `de_tai`
--

CREATE TABLE `de_tai` (
  `id` int(11) NOT NULL,
  `ma_de_tai` varchar(50) DEFAULT NULL,
  `ten_de_tai` varchar(500) NOT NULL,
  `tieu_de` varchar(500) NOT NULL,
  `mo_ta` text NOT NULL,
  `giang_vien_id` int(11) NOT NULL,
  `he_dao_tao` enum('co_so_nganh','chuyen_nganh') NOT NULL,
  `so_luong_sv` int(11) NOT NULL DEFAULT 1,
  `so_luong_da_dang_ky` int(11) DEFAULT 0,
  `trang_thai` enum('nhap','cho_duyet','da_duyet','tu_choi') DEFAULT 'nhap',
  `ly_do_tu_choi` text DEFAULT NULL,
  `chuyen_nganh` varchar(255) DEFAULT NULL,
  `ngon_ngu_cong_cu` text DEFAULT NULL,
  `cong_nghe` text DEFAULT NULL,
  `yeu_cau_sinh_vien` text DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  `nam_hoc` varchar(20) DEFAULT NULL,
  `hoc_ky` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giang_vien`
--

CREATE TABLE `giang_vien` (
  `id` int(11) NOT NULL,
  `nguoi_dung_id` int(11) NOT NULL,
  `ma_giang_vien` varchar(50) NOT NULL,
  `hoc_ham_hoc_vi` varchar(50) DEFAULT NULL,
  `khoa` varchar(255) DEFAULT NULL,
  `chuyen_mon` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `la_lanh_dao` tinyint(4) DEFAULT 0,
  `gioi_han_sv_csn` int(11) DEFAULT 10 COMMENT 'Giới hạn số sinh viên đăng ký đề tài cơ sở ngành',
  `gioi_han_sv_cn` int(11) DEFAULT 10 COMMENT 'Giới hạn số sinh viên đăng ký đề tài chuyên ngành'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giang_vien`
--

INSERT INTO `giang_vien` (`id`, `nguoi_dung_id`, `ma_giang_vien`, `hoc_ham_hoc_vi`, `khoa`, `chuyen_mon`, `so_dien_thoai`, `created_at`, `la_lanh_dao`, `gioi_han_sv_csn`, `gioi_han_sv_cn`) VALUES
(112, 1, 'LD001', 'TS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 1, 10, 10),
(113, 2, 'LD002', 'TS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 1, 10, 10),
(114, 3, 'LD003', 'TS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 1, 10, 10),
(115, 4, 'LD004', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 1, 10, 10),
(116, 5, 'LD005', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 1, 10, 10),
(117, 6, 'GV006', 'TS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(118, 7, 'GV007', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(119, 8, 'GV008', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(120, 9, 'GV009', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(121, 10, 'GV010', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(122, 11, 'GV011', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(123, 12, 'GV012', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(124, 13, 'GV013', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(125, 14, 'GV014', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(126, 15, 'GV015', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(127, 16, 'GV016', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(128, 17, 'GV017', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(129, 18, 'GV018', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(130, 19, 'GV019', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(131, 20, 'GV020', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(132, 21, 'GV021', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(133, 22, 'GV022', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(134, 23, 'GV023', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10),
(135, 24, 'GV024', 'ThS', 'Công nghệ thông tin', NULL, NULL, '2026-03-25 07:55:13', 0, 10, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lanh_dao`
--

CREATE TABLE `lanh_dao` (
  `id` int(11) NOT NULL,
  `nguoi_dung_id` int(11) NOT NULL,
  `ma_lanh_dao` varchar(50) NOT NULL,
  `chuc_vu` varchar(255) DEFAULT NULL,
  `khoa` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lanh_dao`
--

INSERT INTO `lanh_dao` (`id`, `nguoi_dung_id`, `ma_lanh_dao`, `chuc_vu`, `khoa`, `so_dien_thoai`, `created_at`) VALUES
(26, 1, 'LD001', 'Trưởng khoa', 'Công nghệ thông tin', NULL, '2026-03-25 07:48:03'),
(27, 2, 'LD002', 'Phó trưởng khoa', 'Công nghệ thông tin', '', '2026-03-25 07:48:03'),
(28, 3, 'LD003', 'Phó trưởng khoa', 'Công nghệ thông tin', NULL, '2026-03-25 07:48:03'),
(29, 4, 'LD004', 'Phó trưởng khoa', 'Công nghệ thông tin', NULL, '2026-03-25 07:48:03'),
(30, 5, 'LD005', 'Phó trưởng khoa', 'Công nghệ thông tin', NULL, '2026-03-25 07:48:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lich_su_duyet_de_tai`
--

CREATE TABLE `lich_su_duyet_de_tai` (
  `id` int(11) NOT NULL,
  `de_tai_id` int(11) NOT NULL,
  `nguoi_duyet_id` int(11) NOT NULL,
  `trang_thai_cu` varchar(50) DEFAULT NULL,
  `trang_thai_moi` varchar(50) DEFAULT NULL,
  `ly_do` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `vai_tro_id` int(11) NOT NULL,
  `trang_thai` enum('active','inactive') DEFAULT 'active',
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `email`, `mat_khau`, `ho_ten`, `vai_tro_id`, `trang_thai`, `reset_token`, `reset_token_expiry`, `created_at`, `updated_at`) VALUES
(1, 'lamnn@tvu.edu.vn', '123456', 'Nguyễn Nhứt Lam', 3, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:36:47'),
(2, 'oane@tvu.edu.vn', '123456', 'Thạch Kọng Saoane', 3, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:36:55'),
(3, 'diemhanh_tvu@tvu.edu.vn', '123456', 'Nguyễn Trần Diễm Hạnh', 3, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:01'),
(4, 'nhiemnb@tvu.edu.vn', '123456', 'Nguyễn Bá Nhiệm', 3, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:09'),
(5, 'lpdu@tvu.edu.vn', '123456', 'Lê Phong Dũ', 3, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:21'),
(6, 'phuocmien@tvu.edu.vn', '123456', 'Đoàn Phước Miền', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:28'),
(7, 'vothanhc@tvu.edu.vn', '123456', 'Võ Thành C', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:36'),
(8, 'tqviettv@tvu.edu.vn', '123456', 'Trịnh Quốc Việt', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:43'),
(9, 'namtv@tvu.edu.vn', '123456', 'Trần Văn Nam', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:51'),
(10, 'tramhoangnam@tvu.edu.vn', '123456', 'Trầm Hoàng Nam', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:37:58'),
(11, 'ptpnam@tvu.edu.vn', '123456', 'Phan Thị Phương Nam', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:38:05'),
(12, 'pttmai@tvu.edu.vn', '123456', 'Phạm Thị Trúc Mai', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:38:23'),
(13, 'duongminh@tvu.edu.vn', '123456', 'Phạm Minh Đương', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:38:31'),
(14, 'phattai@tvu.edu.vn', '123456', 'Nguyễn Thừa Phát Tài', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:38:40'),
(15, 'ngocdanthanhdt@tvu.edu.vn', '123456', 'Nguyễn Ngọc Đan Thanh', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:38:48'),
(16, 'hientvu@tvu.edu.vn', '123456', 'Nguyễn Mộng Hiền', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:38:55'),
(17, 'nkquoc@tvu.edu.vn', '123456', 'Nguyễn Khắc Quốc', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:39:03'),
(18, 'thiennhd@tvu.edu.vn', '123456', 'Nguyễn Hoàng Duy Thiện', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:39:10'),
(19, 'huyngocntt@tvu.edu.vn', '123456', 'Ngô Thanh Huy', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:39:19'),
(20, 'lmtu@tvu.edu.vn', '123456', 'Lê Minh Tự', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:39:27'),
(21, 'nhutkhau@tvu.edu.vn', '123456', 'Khấu Văn Nhựt', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:39:34'),
(22, 'hvthanh@tvu.edu.vn', '123456', 'Huỳnh Văn Thanh', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:39:42'),
(23, 'hattvi201084@tvu.edu.vn', '123456', 'Hà Thị Thúy Vi', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:39:50'),
(24, 'vankhanh@tvu.edu.vn', '123456', 'Dương Ngọc Vân Khanh', 1, 'active', NULL, NULL, '2026-03-25 07:38:06', '2026-03-27 02:40:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinh_vien`
--

CREATE TABLE `sinh_vien` (
  `id` int(11) NOT NULL,
  `nguoi_dung_id` int(11) NOT NULL,
  `ma_sinh_vien` varchar(50) NOT NULL,
  `lop` varchar(100) DEFAULT NULL,
  `khoa_hoc` varchar(50) DEFAULT NULL,
  `chuyen_nganh` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao`
--

CREATE TABLE `thong_bao` (
  `id` int(11) NOT NULL,
  `nguoi_nhan_id` int(11) DEFAULT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `noi_dung` text NOT NULL,
  `loai` enum('info','success','warning','danger') DEFAULT 'info',
  `da_doc` tinyint(1) DEFAULT 0,
  `link` varchar(500) DEFAULT NULL,
  `loai_thong_bao` varchar(50) DEFAULT 'thong_bao',
  `ngay_bat_dau` date DEFAULT NULL,
  `ngay_ket_thuc` date DEFAULT NULL,
  `trang_thai` enum('mo','khoa') NOT NULL DEFAULT 'mo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_bao`
--

INSERT INTO `thong_bao` (`id`, `nguoi_nhan_id`, `tieu_de`, `noi_dung`, `loai`, `da_doc`, `link`, `loai_thong_bao`, `ngay_bat_dau`, `ngay_ket_thuc`, `trang_thai`, `created_at`) VALUES
(3007, 24, 'Cập nhật giới hạn đề tài', 'Giới hạn đề tài Cơ sở ngành của bạn đã được cập nhật thành 10 đề tài.', 'info', 0, 'giang_vien/danh_sach_de_tai.php?loai=co_so_nganh', 'thong_bao', NULL, NULL, 'mo', '2026-07-30 16:01:50'),
(3008, NULL, 'abc', 'Hành vi người dùng cầm điện thoại phổ biến hiện nay bao gồm Cầm một tay dùng ngón út đỡ đáy máy, cầm hai tay thao tác một ngón hoặc dành trung bình hơn năm tiếng mỗi ngày với thiết bị.', 'info', 0, 'thong_bao.php', 'thong_bao', '2026-07-30', '2026-07-30', 'mo', '2026-07-30 16:03:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao_do_an_content`
--

CREATE TABLE `thong_bao_do_an_content` (
  `id` int(11) NOT NULL,
  `page_title` varchar(500) DEFAULT 'Thông báo đồ án',
  `subtitle` text DEFAULT NULL,
  `date_badge` varchar(100) DEFAULT NULL,
  `trang_thai` enum('mo','khoa') NOT NULL DEFAULT 'mo',
  `ngay_bat_dau` date DEFAULT NULL,
  `ngay_ket_thuc` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_bao_do_an_content`
--

INSERT INTO `thong_bao_do_an_content` (`id`, `page_title`, `subtitle`, `date_badge`, `trang_thai`, `ngay_bat_dau`, `ngay_ket_thuc`, `created_at`, `updated_at`) VALUES
(1, 'Thông báo đồ án', 'Thông tin và lịch trình đồ án', 'Năm học 2025-2026', 'khoa', NULL, NULL, '2026-07-30 13:53:11', '2026-07-30 16:27:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao_do_an_notice`
--

CREATE TABLE `thong_bao_do_an_notice` (
  `id` int(11) NOT NULL,
  `tieu_de` varchar(500) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `trang_thai` enum('mo','khoa') NOT NULL DEFAULT 'mo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_bao_do_an_notice`
--

INSERT INTO `thong_bao_do_an_notice` (`id`, `tieu_de`, `noi_dung`, `trang_thai`, `created_at`, `updated_at`) VALUES
(1, 'Lưu ý quan trọng cho sinh viên', 'Sinh viên đọc kỹ hướng dẫn và nộp bài đúng hạn', 'khoa', '2026-07-30 14:13:41', '2026-07-30 16:25:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao_do_an_timeline`
--

CREATE TABLE `thong_bao_do_an_timeline` (
  `id` int(11) NOT NULL,
  `loai` varchar(50) NOT NULL DEFAULT 'dang_ky',
  `thu_tu` int(11) NOT NULL DEFAULT 1,
  `tieu_de` varchar(500) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `ngay` int(11) DEFAULT NULL,
  `thang` int(11) DEFAULT NULL,
  `nam` int(11) DEFAULT NULL,
  `yeu_cau` text DEFAULT NULL,
  `trang_thai` enum('mo','khoa') NOT NULL DEFAULT 'mo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vai_tro`
--

CREATE TABLE `vai_tro` (
  `id` int(11) NOT NULL,
  `ma_vai_tro` varchar(50) NOT NULL,
  `ten_vai_tro` varchar(100) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vai_tro`
--

INSERT INTO `vai_tro` (`id`, `ma_vai_tro`, `ten_vai_tro`, `mo_ta`, `created_at`) VALUES
(1, 'giang_vien', 'Giảng viên', 'Giảng viên hướng dẫn đề tài', '2026-03-04 01:53:10'),
(2, 'sinh_vien', 'Sinh viên', 'Sinh viên thực hiện đề tài', '2026-03-04 01:53:10'),
(3, 'lanh_dao', 'Lãnh đạo', 'Lãnh đạo khoa, bộ môn', '2026-03-04 01:53:10');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cai_dat`
--
ALTER TABLE `cai_dat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_name` (`key_name`);

--
-- Chỉ mục cho bảng `dang_ky_de_tai`
--
ALTER TABLE `dang_ky_de_tai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_dang_ky` (`sinh_vien_id`,`de_tai_id`),
  ADD KEY `de_tai_id` (`de_tai_id`),
  ADD KEY `nguoi_duyet_id` (`nguoi_duyet_id`),
  ADD KEY `idx_trang_thai` (`trang_thai`),
  ADD KEY `fk_giang_vien_cham` (`giang_vien_cham_id`);

--
-- Chỉ mục cho bảng `de_tai`
--
ALTER TABLE `de_tai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ma_de_tai` (`ma_de_tai`),
  ADD KEY `giang_vien_id` (`giang_vien_id`),
  ADD KEY `idx_trang_thai` (`trang_thai`),
  ADD KEY `idx_he_dao_tao` (`he_dao_tao`);

--
-- Chỉ mục cho bảng `giang_vien`
--
ALTER TABLE `giang_vien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nguoi_dung_id` (`nguoi_dung_id`),
  ADD UNIQUE KEY `ma_giang_vien` (`ma_giang_vien`);

--
-- Chỉ mục cho bảng `lanh_dao`
--
ALTER TABLE `lanh_dao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nguoi_dung_id` (`nguoi_dung_id`),
  ADD UNIQUE KEY `ma_lanh_dao` (`ma_lanh_dao`);

--
-- Chỉ mục cho bảng `lich_su_duyet_de_tai`
--
ALTER TABLE `lich_su_duyet_de_tai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `de_tai_id` (`de_tai_id`),
  ADD KEY `nguoi_duyet_id` (`nguoi_duyet_id`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `vai_tro_id` (`vai_tro_id`),
  ADD KEY `idx_reset_token` (`reset_token`);

--
-- Chỉ mục cho bảng `sinh_vien`
--
ALTER TABLE `sinh_vien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nguoi_dung_id` (`nguoi_dung_id`),
  ADD UNIQUE KEY `ma_sinh_vien` (`ma_sinh_vien`);

--
-- Chỉ mục cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_da_doc` (`da_doc`),
  ADD KEY `idx_nguoi_nhan` (`nguoi_nhan_id`);

--
-- Chỉ mục cho bảng `thong_bao_do_an_content`
--
ALTER TABLE `thong_bao_do_an_content`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thong_bao_do_an_notice`
--
ALTER TABLE `thong_bao_do_an_notice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thong_bao_do_an_timeline`
--
ALTER TABLE `thong_bao_do_an_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ma_vai_tro` (`ma_vai_tro`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cai_dat`
--
ALTER TABLE `cai_dat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `dang_ky_de_tai`
--
ALTER TABLE `dang_ky_de_tai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT cho bảng `de_tai`
--
ALTER TABLE `de_tai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10121;

--
-- AUTO_INCREMENT cho bảng `giang_vien`
--
ALTER TABLE `giang_vien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT cho bảng `lanh_dao`
--
ALTER TABLE `lanh_dao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `lich_su_duyet_de_tai`
--
ALTER TABLE `lich_su_duyet_de_tai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=638;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT cho bảng `sinh_vien`
--
ALTER TABLE `sinh_vien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3009;

--
-- AUTO_INCREMENT cho bảng `thong_bao_do_an_content`
--
ALTER TABLE `thong_bao_do_an_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `thong_bao_do_an_notice`
--
ALTER TABLE `thong_bao_do_an_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `thong_bao_do_an_timeline`
--
ALTER TABLE `thong_bao_do_an_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `dang_ky_de_tai`
--
ALTER TABLE `dang_ky_de_tai`
  ADD CONSTRAINT `dang_ky_de_tai_ibfk_1` FOREIGN KEY (`sinh_vien_id`) REFERENCES `sinh_vien` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dang_ky_de_tai_ibfk_2` FOREIGN KEY (`de_tai_id`) REFERENCES `de_tai` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dang_ky_de_tai_ibfk_3` FOREIGN KEY (`nguoi_duyet_id`) REFERENCES `nguoi_dung` (`id`),
  ADD CONSTRAINT `fk_giang_vien_cham` FOREIGN KEY (`giang_vien_cham_id`) REFERENCES `giang_vien` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `de_tai`
--
ALTER TABLE `de_tai`
  ADD CONSTRAINT `de_tai_ibfk_1` FOREIGN KEY (`giang_vien_id`) REFERENCES `giang_vien` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `giang_vien`
--
ALTER TABLE `giang_vien`
  ADD CONSTRAINT `giang_vien_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `lanh_dao`
--
ALTER TABLE `lanh_dao`
  ADD CONSTRAINT `lanh_dao_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `lich_su_duyet_de_tai`
--
ALTER TABLE `lich_su_duyet_de_tai`
  ADD CONSTRAINT `lich_su_duyet_de_tai_ibfk_1` FOREIGN KEY (`de_tai_id`) REFERENCES `de_tai` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lich_su_duyet_de_tai_ibfk_2` FOREIGN KEY (`nguoi_duyet_id`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD CONSTRAINT `nguoi_dung_ibfk_1` FOREIGN KEY (`vai_tro_id`) REFERENCES `vai_tro` (`id`);

--
-- Các ràng buộc cho bảng `sinh_vien`
--
ALTER TABLE `sinh_vien`
  ADD CONSTRAINT `sinh_vien_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD CONSTRAINT `thong_bao_ibfk_1` FOREIGN KEY (`nguoi_nhan_id`) REFERENCES `nguoi_dung` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
