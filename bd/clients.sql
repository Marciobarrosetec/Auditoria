-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/10/2025 às 21:23
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `reactbd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `municipio` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clients`
--

INSERT INTO `clients` (`id`, `user_id`, `nome`, `cnpj`, `endereco`, `telefone`, `email`, `created_at`, `updated_at`, `municipio`, `uf`, `cep`) VALUES
(1, 1, '2R PARTS AUTOMOTIVE LTDA', '32665603000107', 'RUA STREIFF 301 -SALA 09 - JD. LAS VEGAS -', '11970963587', 'marcio.barros@gruponexusconsultoria.com.br', '2024-10-14 17:15:40', '2024-12-20 00:08:28', 'SANTO ANDRE', 'SP', '09432540'),
(2, 3, 'AUTO FAST COM DE ELETRONICOS E DISTRIBUIDORA LTDA', '46.899.497/0001-22', 'Rua Renato Andreoli, 145', '11970963587', 'marcio.barros@gruponexusconsultoria.com.br', '2024-12-18 16:08:13', '2025-01-09 22:21:38', 'RIBEIRÃO PIRES', 'SP', '09402-500'),
(16, 1, 'FREIOS E PEÇAS 53 LTDA', '59151225000191', 'RUA JOSE BONIFÁCIO, 662 - CENTRO', '11 4128-1780', 'marcio.barros@gruponexusconsultoria.com.br', '2024-12-23 17:34:49', '2024-12-23 17:48:32', 'SÃO BERNARDO DO CAMPO', 'SP', '09721-161'),
(31, 3, 'BRUTAS AUTO PARTS LTDA', '55890110000168', 'RUA RENATO ANDREOLI 145', '11970963587', 'MRCBARROS@GMAIL.COM', '2025-04-16 20:35:19', '2025-04-16 20:35:19', 'rIBEIRÃO PIRES', 'SP', '09402500'),
(32, 3, '2R PARTS DISTRIBUIDORA LTDA', '42517426000167', 'R STREIFF, 301', '', '', '2025-05-16 02:06:52', '2025-05-16 02:12:31', 'Santo andré', 'sp', '09.182-380'),
(33, 1, 'NEXUS', '36400559000156', 'RUA TRIUNFO, 13', '11970963587', 'mrcbarros@gmail.com', '2025-10-15 18:36:34', '2025-10-15 18:36:34', 'Ribeirão Pires', 'SP', '09432350');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
