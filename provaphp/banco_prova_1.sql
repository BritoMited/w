-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 24-Jun-2024 às 16:05
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_prova`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `cod_comentario` int(11) NOT NULL,
  `cod_post` int(11) NOT NULL,
  `comentario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `comentarios`
--

INSERT INTO `comentarios` (`cod_comentario`, `cod_post`, `comentario`) VALUES
(16, 5, 'opa'),
(19, 5, 'a'),
(20, 5, 'a'),
(22, 15, 'legal!'),
(24, 15, 'bonito o.0'),
(25, 23, 'Quero esse livro!'),
(26, 19, 'Prova essa semana ein...'),
(27, 17, 'legal'),
(28, 5, 'a'),
(29, 5, 'a'),
(30, 5, 'a');

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagens`
--

CREATE TABLE `postagens` (
  `cod` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `texto_post` varchar(100) DEFAULT NULL,
  `post_img` varchar(100) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `postagens`
--

INSERT INTO `postagens` (`cod`, `cod_usuario`, `texto_post`, `post_img`, `likes`) VALUES
(5, 3, 'IHUULL', 'img-4.jpg', 6),
(15, 1, 'Contemple a beleza da natureza e se inspire!', 'img-8.jpg', 2),
(17, 1, 'Gratidão por mais um dia nesse paraíso.', 'img-6.jpg', 1),
(19, 3, 'Nada como um dia para estudar!', 'img-1.jpg', 1),
(21, 4, '~conceitual', 'img-3.jpg', 2),
(23, 4, 'Dia de Escrever!', 'img-2.jpg', 1),
(24, 2, 'Vai Elon! Vaai!!', 'img-5.jpg', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `cod` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `imagem` varchar(30) NOT NULL,
  `senha` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`cod`, `usuario`, `nome`, `imagem`, `senha`) VALUES
(1, 'edu', 'Eduardo Henrique', 'prof-4.jpg', '$2y$10$W.RyXDvGieSrl1UnZHNDf.nMrs2ZMFXpZvO11pJhK8yNu3QgJWe3a'),
(2, 'joao', 'João Pedro', 'prof-3.jpg', '$2y$10$W.RyXDvGieSrl1UnZHNDf.nMrs2ZMFXpZvO11pJhK8yNu3QgJWe3a'),
(3, 'ana', 'Ana Clara', 'prof-2.jpg', '$2y$10$W.RyXDvGieSrl1UnZHNDf.nMrs2ZMFXpZvO11pJhK8yNu3QgJWe3a'),
(4, 'laura', 'Laura Manuela', 'prof-1.jpg', '$2y$10$W.RyXDvGieSrl1UnZHNDf.nMrs2ZMFXpZvO11pJhK8yNu3QgJWe3a'),
(7, 'cap', 'cap', 'capDev.png', '$2y$10$W.RyXDvGieSrl1UnZHNDf.nMrs2ZMFXpZvO11pJhK8yNu3QgJWe3a');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`cod_comentario`),
  ADD KEY `fk_cod_post` (`cod_post`);

--
-- Índices para tabela `postagens`
--
ALTER TABLE `postagens`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `fk_cod_usuario` (`cod_usuario`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `cod_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `postagens`
--
ALTER TABLE `postagens`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_cod_post` FOREIGN KEY (`cod_post`) REFERENCES `postagens` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `postagens`
--
ALTER TABLE `postagens`
  ADD CONSTRAINT `fk_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
