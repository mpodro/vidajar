-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2012 a las 04:29:48
-- Versión del servidor: 5.1.43
-- Versión de PHP: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `vidajar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE `foto` (
  `id` int(11) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `foto`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

DROP TABLE IF EXISTS `noticia`;
CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `copete` varchar(200) DEFAULT NULL,
  `cuerpo` varchar(400) NOT NULL,
  `fechaDesde` datetime NOT NULL,
  `fechaHasta` datetime DEFAULT NULL,
  `idOrganizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `noticia`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizaciones`
--

DROP TABLE IF EXISTS `organizaciones`;
CREATE TABLE `organizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `fechaOrigen` datetime DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Organizacion_Usuario` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `organizaciones`
--

INSERT INTO `organizaciones` (`id`, `nombre`, `descripcion`, `director`, `fechaOrigen`, `web`, `tel`, `email`, `idUsuario`) VALUES
(1, 'Shoresh', 'Shoresh es un proyecto solidario que Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando e', 'Dire', '2012-01-24 22:37:12', 'http://www.macabi.com.ar/category/educacion-no-formal/shoresh', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasaje`
--

DROP TABLE IF EXISTS `pasaje`;
CREATE TABLE `pasaje` (
  `id` int(11) NOT NULL,
  `Solidario_id` int(11) NOT NULL,
  `nroReserva` varchar(50) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `nroVuelo` varchar(50) DEFAULT NULL,
  `precio` decimal(6,0) DEFAULT NULL,
  `ganancia` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Pasaje_Solidario1` (`Solidario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `pasaje`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeviaje`
--

DROP TABLE IF EXISTS `pasajeviaje`;
CREATE TABLE `pasajeviaje` (
  `idPasaje` int(11) NOT NULL,
  `idViaje` int(11) NOT NULL,
  `plata` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`idPasaje`,`idViaje`),
  KEY `fk_ViajeSolidario_Viaje1` (`idViaje`),
  KEY `fk_PasajeViaje_Pasaje1` (`idPasaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `pasajeviaje`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `body` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created`, `modified`) VALUES
(1, 'El título', 'Este es el cuerpo del post.', '2012-01-22 21:48:54', NULL),
(2, 'Un título otra vez', 'Y el cuerpo del post a continuación.', '2012-01-22 21:48:54', NULL),
(3, 'Título ataca de nuevo', 'Esto es realmente exitante! No.', '2012-01-22 21:48:54', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solidario`
--

DROP TABLE IF EXISTS `solidario`;
CREATE TABLE `solidario` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `apellido` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Solidario_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `solidario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estado` bit(1) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `estado`, `token`) VALUES
(1, 'shoresh', 'shoresh', '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariofoto`
--

DROP TABLE IF EXISTS `usuariofoto`;
CREATE TABLE `usuariofoto` (
  `idUsuario` int(11) NOT NULL,
  `idFoto` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idFoto`),
  KEY `fk_UsuarioFoto_Foto1` (`idFoto`),
  KEY `fk_UsuarioFoto_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `usuariofoto`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariovideo`
--

DROP TABLE IF EXISTS `usuariovideo`;
CREATE TABLE `usuariovideo` (
  `idUsuario` int(11) NOT NULL,
  `idVideo` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idVideo`),
  KEY `fk_UsuarioVideo_Video1` (`idVideo`),
  KEY `fk_UsuarioVideo_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `usuariovideo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

DROP TABLE IF EXISTS `viajes`;
CREATE TABLE `viajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOrganizacion` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `plataNecesaria` decimal(6,2) DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Viaje_Organizacion1` (`idOrganizacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id`, `idOrganizacion`, `fecha`, `plataNecesaria`, `destino`, `barrio`) VALUES
(1, 1, '2012-01-23 23:56:53', 9999.99, 'Entre Rios', 'Gualeguay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `video`
--


--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `organizaciones`
--
ALTER TABLE `organizaciones`
  ADD CONSTRAINT `fk_Organizacion_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD CONSTRAINT `fk_Pasaje_Solidario1` FOREIGN KEY (`Solidario_id`) REFERENCES `solidario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pasajeviaje`
--
ALTER TABLE `pasajeviaje`
  ADD CONSTRAINT `fk_PasajeViaje_Pasaje1` FOREIGN KEY (`idPasaje`) REFERENCES `pasaje` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ViajeSolidario_Viaje1` FOREIGN KEY (`idViaje`) REFERENCES `viajes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solidario`
--
ALTER TABLE `solidario`
  ADD CONSTRAINT `fk_Solidario_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariofoto`
--
ALTER TABLE `usuariofoto`
  ADD CONSTRAINT `fk_UsuarioFoto_Foto1` FOREIGN KEY (`idFoto`) REFERENCES `foto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UsuarioFoto_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuariovideo`
--
ALTER TABLE `usuariovideo`
  ADD CONSTRAINT `fk_UsuarioVideo_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UsuarioVideo_Video1` FOREIGN KEY (`idVideo`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `fk_Viaje_Organizacion1` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
