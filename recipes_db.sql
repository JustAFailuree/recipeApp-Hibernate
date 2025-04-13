-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2025 at 11:18 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipes_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `recipe_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rating`
--

CREATE TABLE `rating` (
  `id` bigint(20) NOT NULL,
  `score` int(11) NOT NULL,
  `recipe_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `score`, `recipe_id`, `user_id`, `created_at`) VALUES
(14, 3, 17, 7, '2025-04-13 11:02:19');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipe`
--

CREATE TABLE `recipe` (
  `id` bigint(20) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `steps` text DEFAULT NULL,
  `time` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `category`, `difficulty`, `image_path`, `ingredients`, `steps`, `time`, `title`, `user_id`) VALUES
(17, 'Obiad', 'Trudne', '/uploads/1744534514426_tomoko-uji-OrKxMmp3MZI-unsplash.jpg', 'n porttitor dictum tincidunt. Vivamus nec nibh vel ante rhoncus pharetra. Suspendisse malesuada lobortis diam. Vestibulum magna nunc, scelerisque sed maximus id, ullamcorper eget est. Cras dignissim nibh tortor, in auctor enim blandit vel. Vivamus condimentum felis eu dui viverra, a commodo risus pharetra. Aliquam erat volutpat. Fusce vestibulum ex ante, sit amet pulvinar turpis congue quis. Nulla facilisi.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin lobortis metus quis auctor efficitur. Vivamus pellentesque tincidunt lectus ac imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In luctus lacinia iaculis. Sed nec massa pretium, congue est id, mollis nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in ullamcorper metus, in pretium leo. Maecenas arcu arcu, maximus sit amet metus sed, dignissim imperdiet diam. Aenean posuere egestas erat, in viverra eros tempus in. Integer pulvinar, augue a consequat commodo, turpis nisl commodo quam, ornare dignissim eros purus non quam. Sed nec vestibulum turpis. Phasellus a maximus tellus. Nullam sagittis erat nec orci malesuada ultrices sed sit amet nibh.\r\n\r\nOrci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam suscipit elit libero. Donec bibendum vehicula neque, id molestie augue ultrices at. Aenean tempor est sagittis nunc iaculis gravida. Donec eu condimentum nunc. Maecenas sapien dolor, gravida id erat et, ullamcorper ullamcorper diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla vitae hendrerit lorem. Mauris posuere ligula sed neque congue, non posuere tortor dapibus.', 300, 'Maecenas varius', 7),
(18, 'Śniadanie', 'Średnie', '/uploads/1744535228739_andre-benz-qi2hmCwlhcE-unsplash.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sed congue turpis. Praesent volutpat nunc vel rhoncus porttitor. Vestibulum luctus nibh ac est rutrum, eget luctus mauris pretium. Integer ac cursus nunc. Vestibulum ornare vitae ex ac dapibus. Vestibulum pulvinar erat dolor, eget laoreet sapien mattis ut. Aenean eget magna aliquet, bibendum purus et, dignissim massa. Proin dictum consectetur purus, et dignissim lacus elementum eget. Morbi gravida purus mauris, et maximus felis pellentesque sed. Nunc eu sodales magna, vitae laoreet massa.', 'Donec id eros ex. In vulputate risus erat, in congue purus facilisis ac. Curabitur velit lacus, sollicitudin in vulputate sed, mattis non metus. Maecenas odio est, tempus vitae malesuada eget, porta eget mauris. Suspendisse potenti. Donec risus risus, suscipit vel dignissim sit amet, molestie a orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam erat volutpat. Vivamus viverra consequat eros, a dictum risus aliquet quis. Suspendisse potenti. Sed elementum lectus nisi, eu porta ligula vehicula eleifend.\r\n\r\nEtiam maximus sollicitudin dui non aliquam. Aenean pellentesque dignissim tortor vitae facilisis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque ut arcu massa. Aenean non lobortis ligula, eu suscipit mauris. Ut at libero ac justo sagittis suscipit. Vivamus molestie bibendum massa, vitae tincidunt felis imperdiet ac. Nunc nec arcu diam. Nunc convallis nibh et dictum consequat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\r\n\r\nEtiam lobortis erat neque, vitae vulputate augue suscipit non. Duis at blandit erat, eget congue sem. Morbi eu magna eros. Quisque imperdiet, mi nec convallis accumsan, tellus nisi laoreet augue, nec ultrices nisi lectus egestas ante. Vivamus euismod nunc est. Ut fermentum risus in arcu gravida vestibulum. Praesent at semper arcu.', 130, 'Aenean aliquet', 7),
(19, 'Obiad', 'Średnie', '/uploads/1744535277449_jonatan-pie-h8nxGssjQXs-unsplash.jpg', 'Praesent pharetra, sapien eu consectetur congue, urna risus varius odio, vitae molestie nisi ante et tellus. Pellentesque leo orci, pellentesque quis blandit eget, luctus vel enim. Ut quis imperdiet ligula. Praesent in est ac erat porttitor pretium non vitae magna. Fusce pulvinar maximus leo ac efficitur. Maecenas magna metus, porttitor ac ex id, finibus elementum ante. Vestibulum eget tellus et lacus consectetur elementum sit amet eu massa. Curabitur vel ipsum mi. Etiam eget ante vel risus ultricies viverra vel et lorem. Nunc imperdiet metus vitae ex venenatis fermentum. Nulla facilisi. Nam elementum ut arcu quis interdum. Phasellus fermentum faucibus lacus, ac tempor purus malesuada id. Pellentesque at ex elit. Vivamus eu dignissim magna.', 'Donec sit amet dignissim lacus, non commodo neque. Aliquam pellentesque vitae metus a vehicula. Nullam tempus odio ut libero venenatis, vel convallis dolor commodo. Cras consequat hendrerit fringilla. Etiam suscipit fermentum consectetur. Aenean egestas tincidunt orci ut fringilla. Sed ultricies aliquam orci. Pellentesque elit eros, luctus in faucibus vitae, tincidunt non turpis. Cras vestibulum vehicula mauris, nec iaculis orci ultricies ut. Phasellus dictum volutpat mattis.\r\n\r\nAliquam lectus felis, hendrerit tempus tellus consectetur, fringilla gravida augue. Nunc vitae dolor velit. Aenean velit purus, maximus ut faucibus aliquam, tristique vitae ante. Etiam et tincidunt nisi. Suspendisse eu sagittis dui, quis fringilla turpis. Vivamus a ex sit amet quam hendrerit tristique nec eget mi. Vestibulum gravida fermentum rhoncus. Etiam quis ex a metus suscipit sodales. Suspendisse lobortis sem lacus, quis bibendum odio viverra at. Etiam eu leo venenatis augue auctor suscipit. Duis lobortis ligula sed ultricies rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin at massa sed sem ultrices sagittis in nec nulla. Curabitur hendrerit sollicitudin vulputate.', 200, 'Donec sit amet dignissim lacus', 7),
(20, 'Kolacja', 'Łatwe', '/uploads/1744535332386_clay-banks-u27Rrbs9Dwc-unsplash.jpg', 'Aenean sed accumsan justo, vel varius nibh. Proin sagittis enim ut vestibulum vulputate. Ut facilisis ipsum ex, ut rutrum mi ornare quis. Nunc in lorem iaculis, rutrum nisi id, cursus nisl. Suspendisse purus enim, egestas at mi vel, lacinia placerat odio. Phasellus sed mattis nisi, vitae tincidunt nibh. Etiam efficitur tortor at sem tempor, bibendum pulvinar augue interdum.', 'Aenean sed accumsan justo, vel varius nibh. Proin sagittis enim ut vestibulum vulputate. Ut facilisis ipsum ex, ut rutrum mi ornare quis. Nunc in lorem iaculis, rutrum nisi id, cursus nisl. Suspendisse purus enim, egestas at mi vel, lacinia placerat odio. Phasellus sed mattis nisi, vitae tincidunt nibh. Etiam efficitur tortor at sem tempor, bibendum pulvinar augue interdum.\r\n\r\nMorbi facilisis, diam vel consequat varius, ex elit sollicitudin augue, ac sollicitudin diam metus at nibh. Donec imperdiet, elit eget accumsan blandit, tortor libero posuere lectus, sed gravida lectus libero quis eros. Cras id gravida turpis, in auctor nulla. Aenean dictum erat vitae lacus scelerisque bibendum. Nam rhoncus nisl vitae tortor ultrices, eu pulvinar eros pharetra. Duis at rhoncus neque, sit amet vehicula urna. Phasellus vel nisl ante. Suspendisse at est nibh. Suspendisse vitae eleifend tellus. Cras ac nibh elementum, hendrerit justo in, ultrices nunc. Nunc lobortis, felis commodo imperdiet pellentesque, mauris libero commodo est, et vestibulum velit velit vel ipsum. Aliquam volutpat est at erat rhoncus rhoncus. Vivamus non rhoncus dui. Vivamus euismod turpis eu elit sollicitudin iaculis finibus tincidunt lectus.\r\n\r\nNulla tincidunt dolor a arcu tristique malesuada. Aenean faucibus, nisi et finibus aliquam, metus orci laoreet enim, id consectetur ligula lorem eget ligula. Phasellus non luctus metus. Suspendisse congue erat erat, vel congue neque posuere quis. Donec nulla neque, suscipit sed rutrum in, ornare ac ante. Quisque mattis iaculis maximus. Vestibulum est enim, iaculis sit amet arcu egestas, porttitor tempor lorem. Nulla hendrerit a sapien sit amet laoreet. Vivamus quis lectus lacus. Sed in consectetur sem. Integer augue quam, gravida a lacus a, gravida venenatis neque. Aliquam in diam a est scelerisque ultrices. Etiam nec bibendum velit.', 60, 'Nulla tincidunt', 7),
(21, 'Obiad', 'Łatwe', '/uploads/1744535385626_ryoji-hayasaka-Pi2YfVX-TMY-unsplash.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sagittis nisi et arcu interdum molestie. Nunc lobortis lacinia interdum. In id tellus at leo tempor semper placerat in turpis. Duis lorem lacus, vehicula sit amet ornare vel, cursus in sapien. Mauris non mattis nisl. Vestibulum vehicula, urna non accumsan suscipit, sapien nulla sodales leo, non euismod lacus augue sit amet lorem. Vivamus fringilla sem velit, vel iaculis nulla suscipit vitae. Proin nec sodales tellus. Fusce quis consectetur eros, pellentesque interdum est. In hac habitasse platea dictumst. Sed rutrum odio sit amet lacinia mattis. Etiam quis iaculis purus. Aliquam ac rutrum risus. Nulla vel justo sed augue auctor ultrices.', 'Maecenas pellentesque augue tortor, id aliquam felis blandit in. Maecenas laoreet neque eu ultrices bibendum. Integer tincidunt est est, vehicula aliquam massa viverra a. Quisque dui enim, varius ac blandit et, faucibus vel elit. Donec nec risus convallis, rutrum quam id, finibus metus. Phasellus magna tellus, dictum vitae accumsan quis, auctor id libero. Integer semper pulvinar est. Etiam laoreet felis a efficitur venenatis. Phasellus dapibus tempus ante, ut mattis lacus tristique ut.\r\n\r\nAenean venenatis interdum commodo. Aenean ultrices dui erat. Quisque sed quam eu mauris elementum pretium. Proin quis sollicitudin quam. Ut quis magna nec turpis sodales elementum sit amet quis diam. Maecenas ornare magna quis odio cursus, non tristique purus aliquam. Mauris a sapien interdum, mattis turpis at, maximus nisi. Nunc at mi lacus. In libero enim, ultrices sit amet malesuada id, convallis at est. Maecenas non tortor metus. Donec dictum sapien non massa facilisis, at volutpat dui euismod. Proin varius aliquam orci. Vivamus lacus quam, dapibus ornare commodo ac, interdum quis dui. Morbi ligula risus, sodales vel congue ut, finibus vitae leo. Pellentesque tempor semper lacus sed commodo.', 30, 'Aliquam hendrerit', 7),
(22, 'Obiad', 'Trudne', '/uploads/1744535656741_jase-bloor-oCZHIa1D4EU-unsplash.jpg', 'Nunc finibus sagittis risus. In hac habitasse platea dictumst. Maecenas elementum pulvinar lorem. Duis volutpat at nisi id luctus. Maecenas accumsan non dui at suscipit. Aliquam ullamcorper neque in massa volutpat tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam suscipit urna lacinia dolor ullamcorper, ut aliquam mauris tempus.', 'Integer urna urna, pulvinar vitae dui a, facilisis sollicitudin sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod maximus scelerisque. Sed eu elit vestibulum, ornare mauris sit amet, luctus tellus. Nulla sed tempus odio. Nam ut odio dolor. Nullam consequat elit vel dui rutrum tristique. Nam et nulla a risus sollicitudin auctor. Maecenas viverra pretium tincidunt. Sed commodo nisl diam, at cursus odio accumsan in. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse aliquam tellus a ornare tempus.\r\n\r\nNunc finibus sagittis risus. In hac habitasse platea dictumst. Maecenas elementum pulvinar lorem. Duis volutpat at nisi id luctus. Maecenas accumsan non dui at suscipit. Aliquam ullamcorper neque in massa volutpat tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam suscipit urna lacinia dolor ullamcorper, ut aliquam mauris tempus.\r\n\r\nPellentesque at lacus nisl. Pellentesque finibus neque vitae lectus porttitor, a porta diam volutpat. Donec consectetur dignissim lacus vel varius. In nec ligula ipsum. Aliquam erat volutpat. Aenean convallis nunc in tortor dapibus vestibulum. Suspendisse potenti. Vivamus elementum, lacus vel feugiat pretium, libero leo pretium erat, at iaculis purus mi et massa. Morbi quis dolor sit amet eros euismod facilisis. Mauris scelerisque risus sodales felis gravida, vitae efficitur quam auctor. In luctus orci ut lacus volutpat imperdiet. Cras condimentum imperdiet tellus, non accumsan purus viverra pretium. Praesent eu vulputate massa. Sed ex dolor, elementum id dolor at, fermentum tristique erat.\r\n\r\nPhasellus feugiat ligula dictum, lobortis turpis dapibus, sollicitudin lorem. Fusce non orci vel risus egestas mattis malesuada pellentesque orci. Morbi ullamcorper volutpat libero vel lobortis. Duis lacinia massa et ante egestas semper. Ut gravida viverra justo, id vehicula lorem auctor sed. Vestibulum eget orci elementum, facilisis orci id, gravida purus. Sed facilisis blandit felis, eu lacinia justo. Integer pellentesque magna laoreet, rhoncus mauris et, elementum eros. Quisque dapibus, massa sit amet auctor sagittis, eros magna commodo odio, eget viverra enim nunc in lorem. Suspendisse potenti. Donec luctus suscipit tellus non mollis. Suspendisse vel felis vitae orci commodo bibendum vel euismod libero.', 400, 'Phasellus feugiat', 7),
(23, 'Kolacja', 'Średnie', '/uploads/1744535682464_shigeki-wakabayashi-6nuz52vsbWc-unsplash.jpg', 'Etiam scelerisque velit nunc, in pharetra dui volutpat a. Nullam auctor sit amet nibh sed vestibulum. Nam ut accumsan purus. Vestibulum et pulvinar ligula. Mauris porttitor euismod lorem, faucibus malesuada eros vestibulum at. In hac habitasse platea dictumst. Vivamus nec semper nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac euismod risus, in feugiat est. Nam a risus laoreet, sollicitudin mauris eget, hendrerit eros. Ut cursus varius justo non blandit. Phasellus luctus dapibus quam, id tristique nisi iaculis in. Suspendisse porttitor ligula ligula, in lobortis elit scelerisque in. Nullam consectetur eget dolor et faucibus. Nam vel suscipit sem, id sagittis ligula. Fusce sit amet facilisis metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut imperdiet lectus arcu, sit amet lacinia neque pretium at. Cras aliquam blandit metus, sed feugiat elit elementum at. Sed congue vel mi ut pulvinar. Praesent varius ultricies dui, ac porta lectus aliquet pulvinar.\r\n\r\nAenean facilisis orci dolor, a posuere ipsum efficitur at. Sed at condimentum erat. Sed commodo mi sed nibh sodales imperdiet. Etiam molestie arcu nec nisi porttitor dapibus. Nunc ultrices consequat sodales. Duis lacinia pulvinar nulla, non pellentesque nunc maximus at. Morbi accumsan augue eget finibus ullamcorper. Aenean non efficitur elit, in dignissim risus. Phasellus ultrices, lorem id aliquet sagittis, dolor mauris pulvinar ipsum, ut dignissim ligula lectus laoreet arcu. Aliquam laoreet malesuada elit, a consequat elit consequat in. Sed tristique, tortor quis consectetur commodo, urna dui eleifend elit, non hendrerit tortor justo ac tellus. Integer magna turpis, fermentum sit amet ornare eu, egestas vel mauris. In dictum sollicitudin dignissim. Pellentesque ultrices ex orci, ut sodales ex ornare sit amet. Fusce venenatis sed elit ac convallis.\r\n\r\nSed nec placerat felis. Duis vel efficitur tellus, vitae condimentum justo. Morbi eleifend nibh non nisl cursus, vehicula dapibus sapien tempus. Cras ante nibh, faucibus non dolor vitae, ultrices aliquet magna. Praesent eget mi purus. Praesent egestas nunc et convallis consequat. Integer ullamcorper rutrum velit quis congue. Sed vel bibendum purus. Nullam nec nisl sem. Aenean sit amet justo varius, egestas nisi at, tempus risus. Vestibulum nec ex vitae nulla viverra euismod. Ut malesuada metus sed nulla feugiat, vitae dictum tellus pretium. Cras pulvinar lacus lorem, vestibulum sagittis metus molestie vitae. Duis dapibus ex a quam consectetur malesuada. Quisque pellentesque, nisl eu eleifend fringilla, sem nunc tempor justo, cursus hendrerit leo eros eget nisi.', 234, 'Aenean facilisis orci dolor', 7),
(24, 'Śniadanie', 'Łatwe', '/uploads/1744535785666_edward-phillips-YcNnsKq7Bz0-unsplash.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elit velit, fermentum eget nisl sed, iaculis tempor tortor. Nullam mattis nunc dolor, at tincidunt elit egestas id. Praesent commodo dui eget malesuada iaculis. Phasellus ultrices dignissim metus, ut commodo odio maximus quis. Morbi pulvinar lectus sed velit varius, vel efficitur nunc fringilla. Sed suscipit posuere dapibus. Maecenas ut tempor mi, ac laoreet nisi.', 'Fusce dictum lectus ex, a luctus velit tristique vitae. Fusce sollicitudin eleifend augue at mollis. Sed dignissim mollis nisl eget dignissim. Nunc placerat consequat egestas. Nam pulvinar odio nibh, id tempor libero tempus eu. Vestibulum ultricies mollis dui, sit amet rutrum purus porta eu. Duis iaculis et sapien sit amet sollicitudin. Aenean pharetra risus eu sem auctor, a tempus lacus pulvinar. Suspendisse quis nunc auctor, lacinia dolor nec, elementum orci. Donec sit amet sapien augue. Integer maximus tellus et arcu placerat, nec tincidunt dui elementum. Pellentesque faucibus leo odio, aliquam finibus mauris lacinia at. Praesent fermentum ex ipsum, vel suscipit orci congue sed.\r\n\r\nEtiam consequat, sem vel placerat euismod, lacus lacus posuere diam, sit amet laoreet tellus dui ultrices ipsum. Sed sem ligula, ullamcorper vestibulum pulvinar eu, venenatis non libero. Curabitur pretium tincidunt nisi, eu tincidunt elit dignissim vitae. Nullam pulvinar eu justo et feugiat. In vel efficitur sapien. Integer non erat sit amet dui ultrices aliquet non vestibulum ligula. Nam mollis semper diam vitae consectetur. Cras condimentum pretium tristique.\r\n\r\nDuis tempor, metus nec lacinia tristique, erat augue ullamcorper quam, consequat accumsan leo diam faucibus tortor. Cras pellentesque id dui sit amet iaculis. Donec bibendum at ante a dignissim. Nunc in metus sit amet diam condimentum facilisis. Ut neque elit, porta eu velit iaculis, auctor feugiat quam. Nulla gravida velit eu condimentum hendrerit. Praesent ac maximus dui, at convallis felis.', 123, 'Sed nec velit ', 7),
(25, 'Kolacja', 'Łatwe', '/uploads/1744535807355_svetlana-gumerova-6fAgnT3Dhl4-unsplash.jpg', 'Ut nec ultricies orci. Quisque nec pharetra orci. Etiam dignissim sapien ut iaculis aliquam. Morbi et risus blandit, imperdiet metus et, fringilla velit. Nullam rutrum enim in arcu imperdiet pharetra. Suspendisse ut efficitur lectus. Nulla et tellus iaculis, sodales quam nec, condimentum arcu. Nam vitae dui mauris. Pellentesque purus mi, mollis vitae pulvinar a, sagittis et nisl. Nam nec nulla nec arcu efficitur fermentum. Quisque maximus a lectus eu dignissim. Fusce mollis arcu sit amet tempor accumsan. Cras in viverra risus. Aenean at eleifend dolor, quis porta nibh. Sed sit amet arcu ultrices, lobortis quam non, sollicitudin justo.', 'Phasellus nulla arcu, pretium ac laoreet vehicula, iaculis vitae sapien. Pellentesque placerat felis non urna facilisis aliquam. Proin sodales, enim vel ullamcorper iaculis, diam dolor elementum nibh, vel commodo quam risus sed mauris. In sit amet malesuada elit. Vivamus facilisis a enim ut eleifend. Morbi aliquet, sapien a commodo feugiat, magna est pretium velit, in facilisis leo tortor mattis tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam rutrum porta nunc, at molestie lectus rutrum nec.\r\n\r\nSed eu tincidunt risus. Curabitur eu eleifend nunc, in mattis arcu. Maecenas interdum aliquet vestibulum. Nullam lobortis erat sed neque interdum commodo. Morbi quis gravida lorem, sed ullamcorper erat. Mauris ultricies neque et semper vulputate. Suspendisse at viverra nibh. Integer nec egestas tellus. Sed venenatis purus sed dui varius, eu condimentum erat euismod. Nulla in lorem id mauris cursus tempor. Duis dictum ultricies arcu, vel tempus dolor commodo in. In vehicula dui eget mi commodo, vel semper elit faucibus. Etiam quis fermentum dolor, et rhoncus quam. Praesent vel laoreet elit, eget mattis leo. Nullam ut euismod lorem. Mauris sodales arcu metus.', 40, 'Sed finibus dictum', 7),
(26, 'Obiad', 'Trudne', '/uploads/1744535832379_zhaoli-jin-e4I2ktXz5cA-unsplash.jpg', 'Praesent a orci at sapien ornare finibus a et augue. Maecenas finibus a elit vel imperdiet. Donec cursus purus eu justo dapibus, at consequat dui consectetur. Suspendisse vehicula ac eros nec interdum. Etiam suscipit ante nec augue hendrerit, non pharetra leo mollis. In viverra nisi at lacus consequat, sit amet blandit mauris suscipit. Donec at ante vulputate, euismod sapien a, viverra est. Aliquam in libero iaculis, commodo nisi sed, mollis ipsum. Duis et arcu non leo pulvinar viverra. Vivamus id dui ut dolor placerat aliquam. Donec at quam sagittis, mollis nisi a, eleifend mauris. Donec ac nunc elit. Etiam non risus in leo aliquet lobortis ac ullamcorper ligula. Nullam tellus ante, venenatis in enim vulputate, bibendum fringilla magna. Ut ornare risus et risus dapibus, ut vulputate arcu bibendum. Integer sodales justo augue, id varius sem fringilla eget.', 'Quisque ut iaculis enim, in euismod nisi. Sed molestie elit eu dolor euismod bibendum. Fusce pretium sem ac sem vehicula facilisis. Donec eget arcu suscipit, hendrerit risus sed, ornare neque. Curabitur id vehicula nunc. Phasellus lobortis felis libero, sit amet volutpat sapien ullamcorper sed. Etiam nec pellentesque nunc. Fusce placerat mi dolor, ut rutrum dui aliquet in. Pellentesque sed tempor mauris. Mauris ullamcorper pellentesque lacus vel efficitur.\r\n\r\nMaecenas gravida purus vitae lacus aliquet condimentum. Nunc sed augue lacus. Morbi fringilla, lacus in feugiat laoreet, metus erat volutpat ipsum, ac aliquam diam augue a urna. Cras laoreet, urna ac vulputate maximus, elit ante condimentum elit, non facilisis metus felis nec augue. Phasellus sed risus est. Integer pellentesque cursus urna in tempus. Nulla vel sapien at turpis condimentum rutrum. Donec tellus est, condimentum quis nisl ut, condimentum rutrum lorem. Integer pulvinar odio turpis, at fringilla turpis faucibus at. Donec bibendum maximus maximus. Duis quis leo in augue maximus ultricies et quis nisl. Cras elementum finibus mollis. Duis facilisis vulputate rhoncus. Aenean vestibulum elit at blandit dapibus.', 150, 'In a odio vel felis porta ', 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `password`, `username`) VALUES
(7, 'test@example.com', 'test', 'test', '1234', 'test1'),
(8, 'test2@test', 'test', 'test', '1234', 'test2');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh9pseiioux03whna4v7f2yafk` (`recipe_id`),
  ADD KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`);

--
-- Indeksy dla tabeli `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6x7y7iu3omnr3wcg93jkfdorb` (`recipe_id`),
  ADD KEY `FKpn05vbx6usw0c65tcyuce4dw5` (`user_id`);

--
-- Indeksy dla tabeli `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc8o8io8s0f7nqcd3429u6cxjs` (`user_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FKh9pseiioux03whna4v7f2yafk` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK6x7y7iu3omnr3wcg93jkfdorb` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `FKpn05vbx6usw0c65tcyuce4dw5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `FKc8o8io8s0f7nqcd3429u6cxjs` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
