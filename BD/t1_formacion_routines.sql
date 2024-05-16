-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: t1_formacion
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `vista`
--

DROP TABLE IF EXISTS `vista`;
/*!50001 DROP VIEW IF EXISTS `vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista` AS SELECT 
 1 AS `Usuarios`,
 1 AS `date(d.Ultima_conexion)`,
 1 AS `Fecha_registro`,
 1 AS `substring_index(d.Nombre_Apellido, ' ', 1)`,
 1 AS `Numeracion`,
 1 AS `Fecha_Hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista`
--

/*!50001 DROP VIEW IF EXISTS `vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista` AS select `d`.`Usuarios` AS `Usuarios`,cast(`d`.`Ultima_conexion` as date) AS `date(d.Ultima_conexion)`,`d`.`Fecha_registro` AS `Fecha_registro`,substring_index(`d`.`Nombre_Apellido`,' ',1) AS `substring_index(d.Nombre_Apellido, ' ', 1)`,`r`.`Numeracion` AS `Numeracion`,`r`.`Fecha_Hora` AS `Fecha_Hora` from ((`datos` `d` join (select `r_ingresos`.`Usuarios` AS `Usuarios`,max(`r_ingresos`.`Fecha_Hora`) AS `Fh` from `r_ingresos` group by `r_ingresos`.`Usuarios`) `ri`) join `r_ingresos` `r`) where `d`.`Usuarios` = `ri`.`Usuarios` and `r`.`Fecha_Hora` = `ri`.`Fh` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 14:10:47
