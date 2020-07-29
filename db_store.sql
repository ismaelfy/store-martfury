-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2020 a las 03:49:05
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `description` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `description`, `status`) VALUES
(1, 'Adidas', 2),
(2, 'Nike', 2),
(3, 'Puma', 2),
(4, 'Jordán', 2),
(5, 'Irun', 2),
(6, 'Bata', 2),
(7, 'samsung', 2),
(8, 'HUAWEI', 2),
(9, 'Rolex', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `description`, `status`) VALUES
(1, 'Tecnología', 2),
(2, 'Electrodomésticos', 2),
(3, 'Muebles', 2),
(4, 'Dormitorio', 2),
(5, 'Prenda', 2),
(6, 'Calzado', 2),
(7, 'Carteras', 2),
(8, 'Deporte', 2),
(9, 'Libros', 2),
(10, 'Accesorios', 2),
(11, 'Belleza', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image_color`
--

CREATE TABLE `image_color` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `image_color`
--

INSERT INTO `image_color` (`id`, `product_id`, `color`, `image`) VALUES
(1, 1, '#0f0f0e', 'product-1-01.webp'),
(2, 1, '#e52f3b', 'product-1-02.webp'),
(3, 1, 'white', 'product-1-03.jpg'),
(4, 1, '#dbceaf', 'product-1-04.webp'),
(5, 1, '#cbaec0', 'product-1-05.webp'),
(6, 2, '#fafafa', 'product-2-01.jpg'),
(7, 2, '#1a181d', 'product-2-02.jpg'),
(8, 2, '#ddc9a7', 'product-2-03.jpg'),
(9, 3, '#3c97c3', 'product-3-01.jpg'),
(10, 3, '#b71c2a', 'product-3-02.jpg'),
(11, 3, 'white', 'product-3-03.jpg'),
(12, 3, '#181f31', 'product-3-04.jpg'),
(13, 4, '#303032', 'product-4-01.jpg'),
(14, 4, '#3b5372', 'product-4-02.webp'),
(15, 4, '#787878', 'product-4-03.webp'),
(16, 5, '#cbcacf', 'product-5-01.jpg'),
(17, 5, '#2f8895', 'product-5-02.webp'),
(18, 5, '#f15059', 'product-5-03.webp'),
(19, 5, '#679156', 'product-5-04.webp'),
(20, 6, '#010101', 'product-6-01.webp'),
(21, 7, 'black', 'product-7-01.jpg'),
(22, 7, '#a97f66', 'product-7-02.jpg'),
(23, 7, '#4a70b1', 'product-7-03.jpg'),
(24, 8, '#ce6e45', 'product-8-01.webp'),
(25, 8, '#24262a', 'product-8-02.webp'),
(26, 8, '#62282f', 'product-8-03.jpg'),
(27, 9, '#cdcdcd', 'product-9-01.jpg'),
(28, 9, '#060606', 'product-9-02.jpg'),
(29, 9, '#5e5f63', 'product-9-03.jpg'),
(30, 9, '#f5f4f9', 'product-9-04.webp'),
(31, 10, '#1971ca', 'product-10-01.webp'),
(32, 10, '#0dd067', 'product-10-02.webp'),
(33, 11, 'black', 'product-11.jpg'),
(34, 12, '#d26946', 'product-12-01.jpg'),
(35, 12, '#f5413f', 'product-12-02.webp'),
(36, 12, '#191919', 'product-12-03.webp'),
(37, 12, '#e0c9bd', 'product-12-04.webp'),
(38, 13, 'black', 'product-13-01.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_adress` varchar(200) DEFAULT NULL,
  `user_phone` varchar(100) DEFAULT NULL,
  `shipping` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(11,2) DEFAULT NULL,
  `igv` decimal(11,2) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `code`, `date`, `user_id`, `user_adress`, `user_phone`, `shipping`, `amount`, `igv`, `total`, `status`) VALUES
(1, 'P-0001', '2020-05-27 11:03:53', 17, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(2, 'P-0002', '2020-05-27 11:05:35', 17, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(3, 'P-0003', '2020-05-27 11:49:04', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(4, 'P-0004', '2020-05-27 11:50:42', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(5, 'P-0005', '2020-05-27 11:52:15', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(6, 'P-0006', '2020-05-27 11:52:45', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(7, 'P-0007', '2020-05-27 11:53:14', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(8, 'P-0008', '2020-05-27 11:56:04', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(9, 'P-0009', '2020-05-27 11:56:24', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(10, 'P-00010', '2020-05-27 11:57:28', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(11, 'P-00011', '2020-05-27 11:57:56', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(12, 'P-00012', '2020-05-27 11:58:20', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(13, 'P-00013', '2020-05-27 11:59:11', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(14, 'P-00014', '2020-05-27 11:59:52', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(15, 'P-00015', '2020-05-27 12:00:31', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(16, 'P-00016', '2020-05-27 12:00:52', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(17, 'P-00017', '2020-05-27 12:01:23', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(18, 'P-00018', '2020-05-27 12:02:10', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(19, 'P-00019', '2020-05-27 12:03:15', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(20, 'P-00020', '2020-05-27 23:07:10', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(21, 'P-00021', '2020-05-27 23:07:23', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(22, 'P-00022', '2020-05-27 23:07:33', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(23, 'P-00023', '2020-05-27 23:20:20', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(24, 'P-00024', '2020-05-27 23:20:32', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(25, 'P-00025', '2020-05-27 23:28:25', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(26, 'P-00026', '2020-05-27 23:30:25', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(27, 'P-00027', '2020-05-27 23:36:31', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(28, 'P-00028', '2020-05-27 23:39:05', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(29, 'P-00029', '2020-05-27 23:41:06', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(30, 'P-00030', '2020-05-27 23:42:31', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(31, 'P-00031', '2020-05-27 23:46:27', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(32, 'P-00032', '2020-05-27 23:48:20', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(33, 'P-00033', '2020-05-27 23:48:45', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(34, 'P-00034', '2020-05-27 23:50:04', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(35, 'P-00035', '2020-05-27 23:50:43', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(36, 'P-00036', '2020-05-27 23:52:38', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(37, 'P-00037', '2020-05-27 23:53:08', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(38, 'P-00038', '2020-05-27 23:54:16', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(39, 'P-00039', '2020-05-27 23:55:02', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(40, 'P-00040', '2020-05-27 23:55:42', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(41, 'P-00041', '2020-05-27 23:57:06', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(42, 'P-00042', '2020-05-27 23:57:43', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(43, 'P-00043', '2020-05-28 00:00:47', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(44, 'P-00044', '2020-05-28 00:01:42', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(45, 'P-00045', '2020-05-28 00:03:01', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(46, 'P-00046', '2020-05-28 00:03:49', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(47, 'P-00047', '2020-05-28 00:07:37', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(48, 'P-00048', '2020-05-28 00:32:26', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(49, 'P-00049', '2020-05-28 00:36:05', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(50, 'P-00050', '2020-05-28 00:37:34', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(51, 'P-00051', '2020-05-28 00:37:55', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(52, 'P-00052', '2020-05-28 00:38:46', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(53, 'P-00053', '2020-05-28 00:41:09', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(54, 'P-00054', '2020-05-28 01:20:12', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(55, 'P-00055', '2020-05-28 01:37:14', 18, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(56, 'P-00056', '2020-05-28 01:39:38', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(57, 'P-00057', '2020-05-28 01:40:00', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(58, 'P-00058', '2020-05-28 01:40:34', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(59, 'P-00059', '2020-05-28 01:41:37', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(60, 'P-00060', '2020-05-28 01:45:14', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(61, 'P-00061', '2020-05-28 01:45:30', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(62, 'P-00062', '2020-05-28 01:46:01', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(63, 'P-00063', '2020-05-28 01:46:41', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(64, 'P-00064', '2020-05-28 01:47:06', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(65, 'P-00065', '2020-05-28 01:52:58', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(66, 'P-00066', '2020-05-28 01:53:44', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(67, 'P-00067', '2020-05-28 01:56:09', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(68, 'P-00068', '2020-05-28 01:58:24', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(69, 'P-00069', '2020-05-28 01:59:53', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(70, 'P-00070', '2020-05-28 02:00:10', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(71, 'P-00071', '2020-05-28 02:02:02', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(72, 'P-00072', '2020-05-28 02:03:32', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(73, 'P-00073', '2020-05-28 02:04:09', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(74, 'P-00074', '2020-05-28 02:04:42', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(75, 'P-00075', '2020-05-28 02:05:48', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(76, 'P-00076', '2020-05-28 02:07:18', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(77, 'P-00077', '2020-05-28 02:09:37', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(78, 'P-00078', '2020-05-28 02:09:54', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(79, 'P-00079', '2020-05-28 02:10:13', 19, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(80, 'P-00080', '2020-05-28 06:35:45', 20, 'jr. chancay 928', '987654321', 10, '123.90', '22.30', '146.20', 1),
(81, 'P-00081', '2020-05-28 06:36:24', 21, 'jr. chancay 928', '987654321', 10, '491.90', '88.54', '580.44', 1),
(82, 'P-00082', '2020-05-30 21:51:53', 22, 'jr. chancay 924', '943027450', 10, '199.00', '35.82', '234.82', 1),
(83, 'P-00083', '2020-05-30 21:53:41', 23, 'jr. chancay 924', '943027450', 10, '199.00', '35.82', '234.82', 1),
(84, 'P-00084', '2020-05-30 21:59:48', 24, 'jr. chancay 924', '943027450', 10, '148.00', '26.64', '174.64', 1),
(85, 'P-00085', '2020-05-30 22:03:26', 24, 'jr. chancay 924', '943027450', 10, '268.00', '48.24', '316.24', 1),
(86, 'P-00086', '2020-05-30 22:09:54', 24, 'jr. chancay 924', '943027450', 10, '560.90', '100.96', '661.86', 1),
(87, 'P-00087', '2020-05-30 22:12:57', 24, 'jr. chancay 924', '943027450', 10, '1.00', '184.14', '1.00', 1),
(88, 'P-00088', '2020-05-30 22:15:21', 24, 'jr. chancay 924', '943027450', 10, '485.00', '87.30', '572.30', 1),
(89, 'P-00089', '2020-05-30 22:16:56', 24, 'jr. chancay 924', '943027450', 10, '567.00', '102.06', '669.06', 1),
(90, 'P-00090', '2020-05-30 23:16:47', 24, 'jr. chancay 924', '943027450', 10, '368.00', '66.24', '434.24', 1),
(91, 'P-00091', '2020-05-30 23:18:02', 24, 'jr. chancay 924', '943027450', 10, '567.00', '102.06', '669.06', 1),
(92, 'P-00092', '2020-05-31 01:33:05', 24, 'jr. chancay 924', '943027450', 10, '138.00', '24.84', '162.84', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `order_detail`
--

INSERT INTO `order_detail` (`id`, `sale_id`, `product_id`, `description`, `price`, `quantity`, `amount`) VALUES
(1, 1, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(2, 1, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(3, 2, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(4, 2, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(5, 3, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(6, 3, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(7, 4, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(8, 4, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(9, 5, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(10, 5, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(11, 6, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(12, 6, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(13, 7, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(14, 7, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(15, 8, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(16, 8, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(17, 9, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(18, 9, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(19, 10, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(20, 10, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(21, 11, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(22, 11, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(23, 12, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(24, 12, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(25, 13, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(26, 13, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(27, 14, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(28, 14, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(29, 15, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(30, 15, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(31, 16, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(32, 16, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(33, 17, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(34, 17, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(35, 18, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(36, 18, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(37, 19, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(38, 19, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(39, 20, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(40, 20, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(41, 21, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(42, 21, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(43, 22, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(44, 22, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(45, 23, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(46, 23, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(47, 24, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(48, 24, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(49, 25, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(50, 25, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(51, 26, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(52, 26, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(53, 27, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(54, 27, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(55, 28, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(56, 28, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(57, 29, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(58, 29, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(59, 30, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(60, 30, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(61, 31, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(62, 31, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(63, 32, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(64, 32, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(65, 33, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(66, 33, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(67, 34, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(68, 34, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(69, 35, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(70, 35, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(71, 36, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(72, 36, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(73, 37, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(74, 37, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(75, 38, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(76, 38, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(77, 39, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(78, 39, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(79, 40, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(80, 40, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(81, 41, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(82, 41, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(83, 42, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(84, 42, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(85, 43, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(86, 43, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(87, 44, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(88, 44, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(89, 45, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(90, 45, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(91, 46, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(92, 46, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(93, 47, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(94, 47, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(95, 48, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(96, 48, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(97, 49, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(98, 49, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(99, 50, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(100, 50, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(101, 51, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(102, 51, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(103, 52, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(104, 52, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(105, 53, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(106, 53, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(107, 54, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(108, 54, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(109, 55, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(110, 55, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(111, 56, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(112, 56, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(113, 57, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(114, 57, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(115, 58, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(116, 58, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(117, 59, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(118, 59, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(119, 60, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(120, 60, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(121, 61, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(122, 61, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(123, 62, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(124, 62, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(125, 63, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(126, 63, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(127, 64, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(128, 64, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(129, 65, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(130, 65, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(131, 66, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(132, 66, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(133, 67, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(134, 67, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(135, 68, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(136, 68, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(137, 69, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(138, 69, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(139, 70, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(140, 70, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(141, 71, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(142, 71, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(143, 72, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(144, 72, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(145, 73, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(146, 73, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(147, 74, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(148, 74, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(149, 75, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(150, 75, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(151, 76, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(152, 76, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(153, 77, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(154, 77, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(155, 78, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(156, 78, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(157, 79, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(158, 79, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(159, 80, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(160, 80, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(161, 81, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(162, 81, 6, '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', '44.90', 1, '44.90'),
(163, 81, 8, 'Luce elegante y con estilo con nuestra nueva colección de Zapatos para hombre Bruselas, de nuestra marca Bata. Encuéntralos en Tiendas.', '169.00', 1, '169.00'),
(164, 81, 2, 'Rinde homenaje al estilo del tenis retro. Estas zapatillas de cuero sintético suave se inspiran en los diseños deportivos de la década de los 70. Lucen las 3 Tiras en contraste en el lateral exterior y las 3 Tiras cosidas en el lateral interior. Su amortiguación ultrasuave le imprime comodidad a cada uno de tus pasos.', '199.00', 1, '199.00'),
(165, 82, 2, 'Rinde homenaje al estilo del tenis retro. Estas zapatillas de cuero sintético suave se inspiran en los diseños deportivos de la década de los 70. Lucen las 3 Tiras en contraste en el lateral exterior y las 3 Tiras cosidas en el lateral interior. Su amortiguación ultrasuave le imprime comodidad a cada uno de tus pasos.', '199.00', 1, '199.00'),
(166, 83, 2, 'Rinde homenaje al estilo del tenis retro. Estas zapatillas de cuero sintético suave se inspiran en los diseños deportivos de la década de los 70. Lucen las 3 Tiras en contraste en el lateral exterior y las 3 Tiras cosidas en el lateral interior. Su amortiguación ultrasuave le imprime comodidad a cada uno de tus pasos.', '199.00', 1, '199.00'),
(167, 84, 3, 'Luce un estilo deportivo cuando no estás entrenando. Este polo clásico luce un gran logo en contraste para un estilo muy auténtico. Está confeccionado en tejido de punto jersey muy suave para una total comodidad.', '69.00', 1, '69.00'),
(168, 84, 4, 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', '79.00', 1, '79.00'),
(169, 85, 2, 'Rinde homenaje al estilo del tenis retro. Estas zapatillas de cuero sintético suave se inspiran en los diseños deportivos de la década de los 70. Lucen las 3 Tiras en contraste en el lateral exterior y las 3 Tiras cosidas en el lateral interior. Su amortiguación ultrasuave le imprime comodidad a cada uno de tus pasos.', '199.00', 1, '199.00'),
(170, 85, 3, 'Luce un estilo deportivo cuando no estás entrenando. Este polo clásico luce un gran logo en contraste para un estilo muy auténtico. Está confeccionado en tejido de punto jersey muy suave para una total comodidad.', '69.00', 1, '69.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL DEFAULT 0,
  `id_category` int(11) NOT NULL DEFAULT 0,
  `title` varchar(200) DEFAULT NULL,
  `short_description` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `price_old` decimal(11,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `new` int(11) NOT NULL DEFAULT 0,
  `offer` int(11) DEFAULT 0,
  `type` int(11) DEFAULT 0 COMMENT '0) normal, 1) slider, 2)brand',
  `status` tinyint(4) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `id_brand`, `id_category`, `title`, `short_description`, `description`, `image`, `price`, `price_old`, `stock`, `new`, `offer`, `type`, `status`) VALUES
(1, 1, 6, 'ZAPATILLAS NOVA RUN', 'ZAPATILLAS DE RUNNING CÓMODAS QUE APORTAN SUJECIÓN', 'Cruzar la línea de meta no es tan importante como la sensación de batir tu mejor marca personal. Estas zapatillas de running presentan un diseño ajustado que te proporciona una amortiguación ultrasuave para que alcances todos tus objetivos. Incorporan un refuerzo del antepié al talón que le confiere mayor estabilidad y control a tu pisada y lucen las míticas 3 Tiras en el exterior de malla técnica transpirable.', NULL, '299.00', NULL, 100, 0, 0, 0, 2),
(2, 1, 6, 'ZAPATILLAS GRAND COURT BASE', 'ZAPATILLAS DEPORTIVAS CON EL CLÁSICO LOOK DE LOS 7', 'Rinde homenaje al estilo del tenis retro. Estas zapatillas de cuero sintético suave se inspiran en los diseños deportivos de la década de los 70. Lucen las 3 Tiras en contraste en el lateral exterior y las 3 Tiras cosidas en el lateral interior. Su amortiguación ultrasuave le imprime comodidad a cada uno de tus pasos.', NULL, '199.00', '259.00', 100, 1, 1, 0, 2),
(3, 1, 5, 'POLO ESSENTIALS LINEAR LOGO', 'UN POLO LOGO EN ALGODÓN QUE TE ENVUELVE CON COMODI', 'Luce un estilo deportivo cuando no estás entrenando. Este polo clásico luce un gran logo en contraste para un estilo muy auténtico. Está confeccionado en tejido de punto jersey muy suave para una total comodidad.', NULL, '69.00', NULL, 100, 0, 0, 0, 2),
(4, 2, 10, 'NIKE BRASILIA', 'Una mochila que los niños querrán llevar a todos l', 'Una mochila que los niños querrán llevar a todos lados. La Nike Brasilia tiene un compartimiento principal que añade divisiones un bolsillo abierto para organizar mejor los elementos pequeños en el interior. Sus correas son acolchadas y ajustables para que puedan trasladarla con mayor comodidad según sus medidas.', NULL, '79.00', '99.00', 100, 1, 0, 0, 2),
(5, 2, 5, 'Nike Sportswear Heritage', 'Shorts de hombre', 'Confeccionados en suave forro polar, los pantalones cortos Nike Sportswear Heritage te brindan comodidad clásica y un estilo informal con detalles retro para una apariencia y sensación vintage.', NULL, '49.00', NULL, 100, 0, 0, 0, 2),
(6, 3, 5, 'camiseta giratoria tridimensional', '2020 nueva camiseta giratoria tridimensionaL', '2020 nueva camiseta giratoria tridimensional de los hombres de moda de verano de manga corta 3D tops de cuello redondo visual camisa tridimensional', NULL, '44.90', NULL, 100, 1, 0, 0, 2),
(7, 3, 10, 'BOLD DIGITAL Men\'s Watch', 'Este reloj digital Bold PUMA presenta un dial...', 'Este reloj digital Bold PUMA presenta un dial negativo con un pequeño logotipo rojo de PUMA cat centrado en la parte superior del dial. La correa de poliuretano negro se completa con una caja negra que ofrece un aspecto deportivo clásico de gran tamaño. El material suave pero flexible de este reloj conserva la forma a través de una combinación de comodidad y durabilidad en la muñeca.', NULL, '150.00', NULL, 100, 0, 0, 0, 2),
(8, 6, 0, 'ZAPATOS DE VESTIR BATA', 'ZAPATOS DE VESTIR BATA PARA HOMBRE BRUSELAS 821-69', 'Luce elegante y con estilo con nuestra nueva colección de Zapatos para hombre Bruselas, de nuestra marca Bata. Encuéntralos en Tiendas.', NULL, '169.00', NULL, 100, 1, 0, 0, 2),
(9, 4, 6, 'ZAPATILLAS POWER ZHENZU 889-695', 'ZAPATILLAS DEPORTIVAS POWER PARA HOMBRE ZHENZU', 'Zapatilla de running, La suela esta provista de un máximo poder de absorción y reduce los impactos sobre las articulaciones. Planta cosida al corte y unida directamente a la media suela proporcionando mayor estabilidad y comodidad. Modelo para féminas que destaca por su amortiguación y estabilidad. Ideal para Mujeres de peso medio-alto. Entrenamiento y tiradas largas con una pisada neutra. Clásica en cuanto al diseño y de pisada dinámica. Ofrece una gran dosis de seguridad y durabilidad, pero sin renunciar a la evolución natural propio del uso diario. Modelo ideal para los que buscan zapatilla s amortiguadas, contundentes, estables y fiables con las que puedas correr muchos cientos de kilómetros.', NULL, '170.00', '190.00', 100, 0, 0, 0, 2),
(10, 4, 10, 'Gafas de sol Speed Up', NULL, 'Estas gafas de sol hacen una declaración audaz. El marco de gran tamaño fusiona una silueta deportiva con un aspecto fresco y relajado para cada momento de su día.', NULL, '159.00', NULL, 100, 0, 0, 0, 2),
(11, 7, 2, 'Puerta Francesa con Twin Cooling Plus ™, 665 L', 'Disfruta de alimentos más frescos durante el doble', 'Asegúrate de que los alimentos permanezcan más frescos durante el doble de tiempo.* Twin Cooling Plus™ optimiza la temperatura y la humedad en el refrigerador y el congelador con evaporadores y enfriadores independientes. Conserva mejor los alimentos en las mejores condiciones y protege su aroma y sabor al evitar que se mezclen los olores.', 'product-11.jpg', '5499.00', NULL, 100, 0, 0, 2, 2),
(12, 9, 10, 'Reloj de cuarzo analógico', 'Reloj de pulsera de cuarzo analógico de lujo para ', 'Reloj de pulsera de cuarzo analógico de lujo para Mujer de moda de estilo superior, Reloj dorado para Mujer, Reloj negro para Mujer', 'product-12.jpg', '59.00', NULL, 100, 0, 0, 2, 2),
(13, 8, 1, 'HUAWEI MATE 20 LITE 6.3\" 64GB 20MP + 2MP - NEGRO', 'Añade un toque de belleza, potencia y elegancia a ', 'Añade un toque de belleza, potencia y elegancia a tu día a día con este magnífico smartphone que Huawei tiene para ti. El modelo Mate 20 Lite ostenta un potente procesador Hisilicon Kirin 710 Octa-Core, 64GB de almacenamiento y cámara posterior de 20MP.\r\n\r\nUno de los puntos más resaltantes de este modelo, es su enorme batería de carga rápida que con una capacidad de 3750 mAh, puede durar todo el día sin problemas. ¡No dudes más y adquiere este increíble smartphone en Ripley.com!', 'product-13.jpg', '600.00', NULL, 100, 0, 0, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscribe`
--

CREATE TABLE `suscribe` (
  `id` int(11) NOT NULL,
  `email` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0) not account, 1) account',
  `password` varchar(200) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `adress`, `city`, `phone`, `type`, `password`, `status`) VALUES
(1, 'ismael', 'fernandez', 'ismael@tsc-peru.com', 'jr. chancay 928', 'lima', '987654321', 0, '123456', 0),
(24, 'ismael', 'fernandez', 'jhowrayson12@gmail.com', 'jr. chancay 924', 'Lima', '943027450', 0, '', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `image_color`
--
ALTER TABLE `image_color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suscribe`
--
ALTER TABLE `suscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `image_color`
--
ALTER TABLE `image_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `suscribe`
--
ALTER TABLE `suscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
