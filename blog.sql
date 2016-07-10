-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 10 2016 г., 21:26
-- Версия сервера: 5.5.50
-- Версия PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `post_id`, `comment`, `date_added`) VALUES
(2, 2, 10, 'Hi, this is a comment. Thanks for this nice post. I like to see you blog. ', '2014-08-26 15:38:00'),
(3, 4, 10, 'Oh, thanks for reading this blog. Thanks for being with me.', '2014-08-26 15:39:05'),
(4, 6, 11, 'My first comment', '2016-07-07 09:18:19');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`post_id`, `post_title`, `post`, `active`, `date_added`, `user_id`) VALUES
(11, 'Hello World', 'My first post', 1, '2016-07-07 09:18:00', 0),
(12, 'Second Post', 'Heloo', 1, '2016-07-07 10:01:51', 0),
(13, 'Test', 'test', 1, '2016-07-08 13:17:10', 8),
(14, 'erer', 'referf', 1, '2016-07-10 17:42:54', 30),
(15, 'hello', '123', 1, '2016-07-10 17:43:42', 31),
(16, 'ewd', 'edw', 1, '2016-07-10 17:48:30', 32);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(4) NOT NULL,
  `login` varchar(246) NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','author','user') NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `filetoupload` varchar(256) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `login`, `email`, `last_name`, `password`, `user_type`, `first_name`, `filetoupload`) VALUES
(1, '', 'al.imran.cse', 'al_imran_ahmed', '6f4a9c7287503510eb9ab662ed116c0272bf4ae1', 'admin', '', ''),
(2, '', 'al_imranahmed@yahoo.com', 'user', '12dea96fec20593566ab75692c9949596833adc9', 'user', '', ''),
(3, '', 'author@gmail.com', 'author', 'f64cd8e32f5ac7553c150bd05d6f2252bb73f68d', 'author', '', ''),
(4, '', 'admin@gmail.com', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', '', ''),
(5, '', 'chand@gmail.com', 'chand', '6f4a9c7287503510eb9ab662ed116c0272bf4ae1', 'user', '', ''),
(6, '', '123@123.ua', 'Denis', 'c6e2a27f6f05d69c7d7da9dddc354c561214b8a8', 'admin', '', ''),
(7, '', 'mail@mail.ru', 'Stepanenko', 'c6e2a27f6f05d69c7d7da9dddc354c561214b8a8', 'admin', 'Denis', ''),
(8, 'test', 'test@test.ua', 'Stepanenko', '451fa78c070d19e18e19d4f8229ac2d07867bd69', 'admin', 'Denis', ''),
(9, 'terroro', 'uuu@mail.ii', 'Hello', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'Name', ''),
(10, 'kljsnfkj', '2342@hh.aa', 'dklsmcflksm', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'ldkjsmncfvkljsn', ''),
(11, 'asdas', 'test1@ff.ll', '1dasfsdf', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'asda', ''),
(12, 'fds', 'test@aa.ii', 'sdfsdf', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'dsfsd', ''),
(13, 'testq', '1112@maswd.oa', '1231123', '8cb2237d0679ca88db6464eac60da96345513964', 'user', '12313', ''),
(14, 'new', '123@ll.ii', 'new', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'new', ''),
(15, 'as', 'asdas@aa.is', 'dds', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'as', ''),
(16, 'trrtrt', 'Stepanenko@wqe.ll', 'dfsdfsdf', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'rtrtrt', ''),
(17, 'qawsda', 'test@aaa.ll', 'asdasdasdafas', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'asdasdas', ''),
(18, 'werfgre', 'test@aa.oi', 'asdas', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'Aamir1', ''),
(19, 'tesqa', 'asdasd@bb.oj', 'asdasd', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'asdasd', ''),
(20, 'hfbsh', '1231@hh.ua', 'skdjfj', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'bfsdb', ''),
(21, 'denis1', 'qwwr@mm.oo', 'denis', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', 'denis', ''),
(22, 'denis2', '213sa@mm.ua', 'asdasd', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', 'asdasd', ''),
(23, 'checking', '13njkns@aasd.ii', 'jkanskj', '8cb2237d0679ca88db6464eac60da96345513964', 'user', 'gadsu', ''),
(24, 'jjjjjjj', '123@123.uaa', 'kldsmk', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '21lf,sd', ''),
(25, 'cvbcvbcvb', '213saa@mm.ua', '21fsdfsf', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '13123dfs', '907935st.png'),
(26, 'aaaasdd', 'qwwrq@mm.oo', '123', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '123', '576862bing_top.jpg'),
(27, '123qqq', '123@1d23.ua', '123', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '123', '865583bing_top.jpg'),
(28, 'ddd', 'qqq@ee.ia', 'qqq', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', 'qqq', '218487st.png'),
(29, 'ttttttt', '123@ee.ua', '123', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '123d12', '545248pizza.jpg'),
(30, 'feddwsfsd', '1223@123.ua', 'dwefwefw', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '1dewdf', '101840st.png'),
(31, 'test', 'gg@hh.ua', '12345', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '12345', '723639bing_top.jpg'),
(32, '1111111', '1s223@123.ua', '22222', '8cb2237d0679ca88db6464eac60da96345513964', 'admin', '22222', '139028st.png');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
