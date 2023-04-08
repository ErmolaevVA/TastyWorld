-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:2701
-- Время создания: Апр 08 2023 г., 11:46
-- Версия сервера: 5.6.37
-- Версия PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `TastyWorld`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Favorite`
--

CREATE TABLE `Favorite` (
  `id` int(11) NOT NULL,
  `id_recipe` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `id` int(11) NOT NULL,
  `id_recipe` int(11) NOT NULL,
  `name` text NOT NULL,
  `count` int(11) NOT NULL,
  `unit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Recipe`
--

CREATE TABLE `Recipe` (
  `id` int(11) NOT NULL,
  `id_creator` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `photo` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Request`
--

CREATE TABLE `Request` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `request_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Step`
--

CREATE TABLE `Step` (
  `id` int(11) NOT NULL,
  `id_recipe` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Subscribe`
--

CREATE TABLE `Subscribe` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_subscriber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `nickname` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`id`, `nickname`, `email`, `password`) VALUES
(1, 'test', 'test@gmail.com', 'Test_2701');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Favorite`
--
ALTER TABLE `Favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fav_recipe` (`id_recipe`),
  ADD KEY `fav_user` (`id_user`);

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_recipe` (`id_recipe`);

--
-- Индексы таблицы `Recipe`
--
ALTER TABLE `Recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_creator` (`id_creator`);

--
-- Индексы таблицы `Request`
--
ALTER TABLE `Request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_user` (`id_user`);

--
-- Индексы таблицы `Step`
--
ALTER TABLE `Step`
  ADD PRIMARY KEY (`id`),
  ADD KEY `step_recipe` (`id_recipe`);

--
-- Индексы таблицы `Subscribe`
--
ALTER TABLE `Subscribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_sub` (`id_subscriber`),
  ADD KEY `sub_user` (`id_user`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Favorite`
--
ALTER TABLE `Favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Recipe`
--
ALTER TABLE `Recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Request`
--
ALTER TABLE `Request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Step`
--
ALTER TABLE `Step`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Subscribe`
--
ALTER TABLE `Subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Favorite`
--
ALTER TABLE `Favorite`
  ADD CONSTRAINT `fav_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `Recipe` (`id`),
  ADD CONSTRAINT `fav_user` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

--
-- Ограничения внешнего ключа таблицы `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `prod_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `Recipe` (`id`);

--
-- Ограничения внешнего ключа таблицы `Recipe`
--
ALTER TABLE `Recipe`
  ADD CONSTRAINT `recipe_creator` FOREIGN KEY (`id_creator`) REFERENCES `User` (`id`);

--
-- Ограничения внешнего ключа таблицы `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `request_user` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

--
-- Ограничения внешнего ключа таблицы `Step`
--
ALTER TABLE `Step`
  ADD CONSTRAINT `step_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `Recipe` (`id`);

--
-- Ограничения внешнего ключа таблицы `Subscribe`
--
ALTER TABLE `Subscribe`
  ADD CONSTRAINT `sub_sub` FOREIGN KEY (`id_subscriber`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `sub_user` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
