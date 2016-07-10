-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 10 2016 г., 20:58
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
(1, 'Post 1', 'This is a demo post. This post is just only to test the functionality of the blog. If this post works properly then I could say that I am done for today. Thank you my dear.', 1, '2014-08-18 11:29:30', 1),
(2, 'Post 2', 'This is the 2nd post. This post is to test the insert functionality of my blog. If this method works properly then I can say that I am done with insert. Thanks for being with me.', 1, '2014-08-18 11:50:17', 0),
(3, 'Post 3', 'Yahh! It''s working properly. I have done the operation of CRUD on database. I feel really cool with codeigniter. This framework is really very easy to learn for the first time you start.', 1, '2014-08-18 11:50:36', 0),
(4, 'Post 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 1, '2014-08-18 18:23:29', 0),
(5, 'Post 5', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere', 1, '2014-08-18 18:23:40', 0),
(6, 'Post 6', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee', 1, '2014-08-18 18:23:49', 0),
(7, 'Post 7', 'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es.Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.', 1, '2014-08-18 18:24:00', 0),
(8, 'Post 8', 'The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages. It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is.The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To', 1, '2014-08-18 18:24:11', 0),
(9, 'Post 9', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, '2014-08-18 18:24:18', 0),
(10, 'Post 10', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, '2014-08-19 18:38:18', 0),
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
