SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `wordpress_kickstart`
--




CREATE TABLE `wp_bookpro_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO wp_bookpro_migrations VALUES
("1","202006061542-test_1.php");




CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_comments VALUES
("2","149","WooCommerce","","","","2018-09-05 14:48:46","2018-09-05 14:48:46","Thanh toán khi nhận hàng. Trạng thái đơn hàng đã được chuyển từ Chờ thanh toán sang Đang xử lý.","0","1","WooCommerce","order_note","0","0");




CREATE TABLE `wp_db7_forms` (
  `form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_post_id` bigint(20) NOT NULL,
  `form_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_options VALUES
("1","siteurl","http://localhost/wordpress_kickstart","yes"),
("2","home","http://localhost/wordpress_kickstart","yes"),
("3","blogname","admin","yes"),
("4","blogdescription","Freelancerviet.net","yes"),
("5","users_can_register","0","yes"),
("6","admin_email","duongva91@gmail.com","yes"),
("7","start_of_week","1","yes"),
("8","use_balanceTags","0","yes"),
("9","use_smilies","1","yes"),
("10","require_name_email","1","yes"),
("11","comments_notify","1","yes"),
("12","posts_per_rss","10","yes"),
("13","rss_use_excerpt","1","yes"),
("14","mailserver_url","mail.example.com","yes"),
("15","mailserver_login","login@example.com","yes"),
("16","mailserver_pass","password","yes"),
("17","mailserver_port","110","yes"),
("18","default_category","1","yes"),
("19","default_comment_status","open","yes"),
("20","default_ping_status","open","yes"),
("21","default_pingback_flag","1","yes"),
("22","posts_per_page","10","yes"),
("23","date_format","j F, Y","yes"),
("24","time_format","g:i a","yes"),
("25","links_updated_date_format","j F, Y g:i a","yes"),
("26","comment_moderation","0","yes"),
("27","moderation_notify","1","yes"),
("28","permalink_structure","/%postname%/","yes"),
("29","rewrite_rules","a:203:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:11:\"cua-hang/?$\";s:27:\"index.php?post_type=product\";s:41:\"cua-hang/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:36:\"cua-hang/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:28:\"cua-hang/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:16:\"featured_item/?$\";s:33:\"index.php?post_type=featured_item\";s:46:\"featured_item/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_type=featured_item&feed=$matches[1]\";s:41:\"featured_item/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_type=featured_item&feed=$matches[1]\";s:33:\"featured_item/page/([0-9]{1,})/?$\";s:51:\"index.php?post_type=featured_item&paged=$matches[1]\";s:32:\"blocks/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"blocks/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"blocks/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"blocks/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"blocks/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"blocks/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"blocks/(.+?)/embed/?$\";s:39:\"index.php?blocks=$matches[1]&embed=true\";s:25:\"blocks/(.+?)/trackback/?$\";s:33:\"index.php?blocks=$matches[1]&tb=1\";s:33:\"blocks/(.+?)/page/?([0-9]{1,})/?$\";s:46:\"index.php?blocks=$matches[1]&paged=$matches[2]\";s:40:\"blocks/(.+?)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?blocks=$matches[1]&cpage=$matches[2]\";s:30:\"blocks/(.+?)/wc-api(/(.*))?/?$\";s:47:\"index.php?blocks=$matches[1]&wc-api=$matches[3]\";s:36:\"blocks/.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:47:\"blocks/.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:29:\"blocks/(.+?)(?:/([0-9]+))?/?$\";s:45:\"index.php?blocks=$matches[1]&page=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:57:\"block_categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?block_categories=$matches[1]&feed=$matches[2]\";s:52:\"block_categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?block_categories=$matches[1]&feed=$matches[2]\";s:33:\"block_categories/([^/]+)/embed/?$\";s:49:\"index.php?block_categories=$matches[1]&embed=true\";s:45:\"block_categories/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?block_categories=$matches[1]&paged=$matches[2]\";s:27:\"block_categories/([^/]+)/?$\";s:38:\"index.php?block_categories=$matches[1]\";s:47:\"danh-muc/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:42:\"danh-muc/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:23:\"danh-muc/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:35:\"danh-muc/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:17:\"danh-muc/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:48:\"tu-khoa/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:43:\"tu-khoa/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:24:\"tu-khoa/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:36:\"tu-khoa/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:18:\"tu-khoa/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:36:\"san-pham/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"san-pham/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"san-pham/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"san-pham/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"san-pham/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"san-pham/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"san-pham/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:29:\"san-pham/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:49:\"san-pham/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:44:\"san-pham/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:37:\"san-pham/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:44:\"san-pham/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:34:\"san-pham/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:40:\"san-pham/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:51:\"san-pham/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:33:\"san-pham/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:25:\"san-pham/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"san-pham/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"san-pham/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"san-pham/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"san-pham/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"san-pham/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:39:\"featured_item/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"featured_item/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"featured_item/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"featured_item/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"featured_item/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:45:\"featured_item/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:28:\"featured_item/(.+?)/embed/?$\";s:46:\"index.php?featured_item=$matches[1]&embed=true\";s:32:\"featured_item/(.+?)/trackback/?$\";s:40:\"index.php?featured_item=$matches[1]&tb=1\";s:52:\"featured_item/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?featured_item=$matches[1]&feed=$matches[2]\";s:47:\"featured_item/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?featured_item=$matches[1]&feed=$matches[2]\";s:40:\"featured_item/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?featured_item=$matches[1]&paged=$matches[2]\";s:47:\"featured_item/(.+?)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?featured_item=$matches[1]&cpage=$matches[2]\";s:37:\"featured_item/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?featured_item=$matches[1]&wc-api=$matches[3]\";s:43:\"featured_item/.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:54:\"featured_item/.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:36:\"featured_item/(.+?)(?:/([0-9]+))?/?$\";s:52:\"index.php?featured_item=$matches[1]&page=$matches[2]\";s:63:\"featured_item_category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:61:\"index.php?featured_item_category=$matches[1]&feed=$matches[2]\";s:58:\"featured_item_category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:61:\"index.php?featured_item_category=$matches[1]&feed=$matches[2]\";s:39:\"featured_item_category/([^/]+)/embed/?$\";s:55:\"index.php?featured_item_category=$matches[1]&embed=true\";s:51:\"featured_item_category/([^/]+)/page/?([0-9]{1,})/?$\";s:62:\"index.php?featured_item_category=$matches[1]&paged=$matches[2]\";s:33:\"featured_item_category/([^/]+)/?$\";s:44:\"index.php?featured_item_category=$matches[1]\";s:58:\"featured_item_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:56:\"index.php?featured_item_tag=$matches[1]&feed=$matches[2]\";s:53:\"featured_item_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:56:\"index.php?featured_item_tag=$matches[1]&feed=$matches[2]\";s:34:\"featured_item_tag/([^/]+)/embed/?$\";s:50:\"index.php?featured_item_tag=$matches[1]&embed=true\";s:46:\"featured_item_tag/([^/]+)/page/?([0-9]{1,})/?$\";s:57:\"index.php?featured_item_tag=$matches[1]&paged=$matches[2]\";s:28:\"featured_item_tag/([^/]+)/?$\";s:39:\"index.php?featured_item_tag=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=10&cpage=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}","yes"),
("30","hack_file","0","yes"),
("31","blog_charset","UTF-8","yes"),
("32","moderation_keys","","no"),
("33","active_plugins","a:3:{i:0;s:36:\"contact-form-7/wp-contact-form-7.php\";i:1;s:27:\"woocommerce/woocommerce.php\";i:2;s:27:\"wp-super-cache/wp-cache.php\";}","yes"),
("34","category_base","","yes"),
("35","ping_sites","http://rpc.pingomatic.com/","yes"),
("36","comment_max_links","2","yes"),
("37","gmt_offset","0","yes"),
("38","default_email_category","1","yes"),
("39","recently_edited","a:2:{i:0;s:60:\"D:\\xamp\\htdocs\\wordpress/wp-content/themes/noithat/style.css\";i:2;s:0:\"\";}","no"),
("40","template","flatsome","yes"),
("41","stylesheet","freelancerviet.net","yes"),
("42","comment_whitelist","1","yes"),
("43","blacklist_keys","","no"),
("44","comment_registration","0","yes"),
("45","html_type","text/html","yes"),
("46","use_trackback","0","yes"),
("47","default_role","subscriber","yes"),
("48","db_version","44719","yes"),
("49","uploads_use_yearmonth_folders","1","yes"),
("50","upload_path","","yes"),
("51","blog_public","0","yes"),
("52","default_link_category","2","yes"),
("53","show_on_front","page","yes"),
("54","tag_base","","yes"),
("55","show_avatars","1","yes"),
("56","avatar_rating","G","yes"),
("57","upload_url_path","","yes"),
("58","thumbnail_size_w","150","yes"),
("59","thumbnail_size_h","150","yes"),
("60","thumbnail_crop","1","yes"),
("61","medium_size_w","300","yes"),
("62","medium_size_h","300","yes"),
("63","avatar_default","mystery","yes"),
("64","large_size_w","1024","yes"),
("65","large_size_h","1024","yes"),
("66","image_default_link_type","none","yes"),
("67","image_default_size","","yes"),
("68","image_default_align","","yes"),
("69","close_comments_for_old_posts","0","yes"),
("70","close_comments_days_old","14","yes"),
("71","thread_comments","1","yes"),
("72","thread_comments_depth","5","yes"),
("73","page_comments","0","yes"),
("74","comments_per_page","50","yes"),
("75","default_comments_page","newest","yes"),
("76","comment_order","asc","yes"),
("77","sticky_posts","a:0:{}","yes"),
("78","widget_categories","a:4:{i:2;a:4:{s:5:\"title\";s:22:\"Tư vấn thiết kế\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:1;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;i:5;a:0:{}i:7;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:1;s:8:\"dropdown\";i:0;}}","yes"),
("79","widget_text","a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}","yes"),
("80","widget_rss","a:3:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;i:3;a:0:{}}","yes"),
("81","uninstall_plugins","a:1:{s:27:\"wp-super-cache/wp-cache.php\";s:22:\"wpsupercache_uninstall\";}","no"),
("82","timezone_string","","yes"),
("83","page_for_posts","0","yes"),
("84","page_on_front","10","yes"),
("85","default_post_format","0","yes"),
("86","link_manager_enabled","0","yes"),
("87","finished_splitting_shared_terms","1","yes"),
("88","site_icon","886","yes"),
("89","medium_large_size_w","768","yes"),
("90","medium_large_size_h","0","yes"),
("91","wp_page_for_privacy_policy","3","yes"),
("92","show_comments_cookies_opt_in","0","yes"),
("93","initial_db_version","38590","yes"),
("94","wp_user_roles","a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:115:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:10:\"loco_admin\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:10:\"translator\";a:2:{s:4:\"name\";s:10:\"Translator\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:10:\"loco_admin\";b:1;}}}","yes"),
("95","fresh_site","0","yes"),
("96","WPLANG","vi","yes"),
("97","widget_search","a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}","yes"),
("98","widget_recent-posts","a:5:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}i:4;a:3:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;s:9:\"show_date\";b:0;}i:6;a:0:{}i:7;a:3:{s:5:\"title\";s:15:\"Tin nổi bật\";s:6:\"number\";i:3;s:9:\"show_date\";b:0;}s:12:\"_multiwidget\";i:1;}","yes"),
("99","widget_recent-comments","a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}","yes"),
("100","widget_archives","a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}","yes");
INSERT INTO wp_options VALUES
("101","widget_meta","a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}","yes"),
("102","sidebars_widgets","a:7:{s:19:\"wp_inactive_widgets\";a:21:{i:0;s:15:\"media_gallery-3\";i:1;s:15:\"media_gallery-4\";i:2;s:13:\"custom_html-4\";i:3;s:23:\"flatsome_recent_posts-5\";i:4;s:12:\"categories-2\";i:5;s:12:\"categories-5\";i:6;s:12:\"categories-7\";i:7;s:14:\"recent-posts-6\";i:8;s:14:\"recent-posts-7\";i:9;s:5:\"rss-3\";i:10;s:13:\"custom_html-3\";i:11;s:33:\"woocommerce_layered_nav_filters-3\";i:12;s:32:\"woocommerce_product_categories-5\";i:13;s:23:\"flatsome_recent_posts-3\";i:14;s:14:\"block_widget-3\";i:15;s:14:\"recent-posts-4\";i:16;s:10:\"archives-2\";i:17;s:6:\"meta-2\";i:18;s:8:\"search-2\";i:19;s:14:\"recent-posts-2\";i:20;s:17:\"recent-comments-2\";}s:12:\"sidebar-main\";a:1:{i:0;s:14:\"block_widget-5\";}s:16:\"sidebar-footer-1\";a:0:{}s:16:\"sidebar-footer-2\";a:0:{}s:12:\"shop-sidebar\";a:3:{i:0;s:32:\"woocommerce_product_categories-3\";i:1;s:38:\"woocommerce_recently_viewed_products-3\";i:2;s:15:\"upsell_widget-3\";}s:15:\"product-sidebar\";a:0:{}s:13:\"array_version\";i:3;}","yes"),
("103","widget_pages","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("104","widget_calendar","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("105","widget_media_audio","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("106","widget_media_image","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("107","widget_media_gallery","a:3:{s:12:\"_multiwidget\";i:1;i:3;a:6:{s:5:\"title\";s:0:\"\";s:3:\"ids\";a:1:{i:0;i:331;}s:7:\"columns\";i:1;s:4:\"size\";s:5:\"large\";s:9:\"link_type\";s:4:\"post\";s:14:\"orderby_random\";b:0;}i:4;a:6:{s:5:\"title\";s:18:\"Mậu thiết kế\";s:7:\"columns\";i:2;s:4:\"size\";s:4:\"full\";s:9:\"link_type\";s:4:\"post\";s:14:\"orderby_random\";b:0;s:3:\"ids\";a:4:{i:0;i:102;i:1;i:101;i:2;i:100;i:3;i:81;}}}","yes"),
("108","widget_media_video","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("109","widget_tag_cloud","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("110","widget_nav_menu","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("111","widget_custom_html","a:3:{i:3;a:2:{s:5:\"title\";s:22:\"Tư vấn thiết kế\";s:7:\"content\";s:125:\"<p>\n	<a>Văn phòng</a></p>\n<p>	\n<a>Nhà ở</a></p>\n	\n<p>\n<a>Showroom, cửa hàng</a>\n<a>Nhà hàng,khách sạn</a>\";}i:4;a:2:{s:5:\"title\";s:22:\"Tư vấn thiết kế\";s:7:\"content\";s:146:\"<p>\n	<a>Văn phòng</a>\n</p>\n<p>\n	<a>Nhà ở</a>\n</p>\n<p>\n	<a>Showroom, cửa hàng</a>\n</p>\n<p>\n	<a>Nhà hàng, khách sạn</a>\n</p>\";}s:12:\"_multiwidget\";i:1;}","yes"),
("112","cron","a:14:{i:1592128978;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1592129192;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1592129299;a:1:{s:19:\"wp_cache_gc_watcher\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1592131108;a:1:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592131118;a:1:{s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592141908;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592146956;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1592149334;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592150216;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592151143;a:1:{s:24:\"jp_purge_transients_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592152708;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1592179200;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1594166400;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:7:\"monthly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:2635200;}}}s:7:\"version\";i:2;}","yes"),
("113","theme_mods_twentyseventeen","a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536039471;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}s:18:\"nav_menu_locations\";a:0:{}}","yes"),
("143","current_theme","freelancerviet.net","yes"),
("144","theme_mods_flatsome","a:27:{i:0;b:0;s:17:\"flatsome_fallback\";i:0;s:20:\"topbar_elements_left\";a:1:{i:0;s:4:\"html\";}s:21:\"topbar_elements_right\";a:3:{i:0;s:7:\"nav-top\";i:1;s:10:\"newsletter\";i:2;s:6:\"social\";}s:20:\"header_elements_left\";a:2:{i:0;s:6:\"search\";i:1;s:3:\"nav\";}s:21:\"header_elements_right\";a:3:{i:0;s:7:\"account\";i:1;s:7:\"divider\";i:2;s:4:\"cart\";}s:27:\"header_elements_bottom_left\";a:0:{}s:29:\"header_elements_bottom_center\";a:0:{}s:28:\"header_elements_bottom_right\";a:0:{}s:27:\"header_mobile_elements_left\";a:1:{i:0;s:9:\"menu-icon\";}s:28:\"header_mobile_elements_right\";a:1:{i:0;s:4:\"cart\";}s:26:\"header_mobile_elements_top\";a:1:{i:0;s:4:\"html\";}s:14:\"mobile_sidebar\";a:7:{i:0;s:11:\"search-form\";i:1;s:3:\"nav\";i:2;s:7:\"account\";i:3;s:10:\"newsletter\";i:4;s:6:\"social\";i:5;s:6:\"html-2\";i:6;s:6:\"html-3\";}s:14:\"product_layout\";N;s:23:\"payment_icons_placement\";s:6:\"footer\";s:14:\"follow_twitter\";s:10:\"http://url\";s:15:\"follow_facebook\";s:10:\"http://url\";s:16:\"follow_instagram\";s:10:\"http://url\";s:12:\"follow_email\";s:10:\"your@email\";s:16:\"flatsome_version\";i:3;s:24:\"portfolio_archive_filter\";s:4:\"left\";s:19:\"flatsome_db_version\";s:5:\"3.5.0\";s:18:\"nav_menu_locations\";a:0:{}s:7:\"backups\";N;s:9:\"smof_init\";s:31:\"Mon, 03 Sep 2018 15:46:39 +0000\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536037384;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:12:\"sidebar-main\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:16:\"sidebar-footer-1\";a:0:{}s:16:\"sidebar-footer-2\";a:0:{}}}s:18:\"custom_css_post_id\";i:-1;}","yes"),
("145","theme_switched","","yes"),
("146","widget_flatsome_recent_posts","a:3:{s:12:\"_multiwidget\";i:1;i:3;a:3:{s:5:\"title\";s:22:\"Tư vấn thiết kế\";s:6:\"number\";i:0;s:5:\"image\";s:2:\"on\";}i:5;a:3:{s:5:\"title\";s:15:\"Tin nổi bật\";s:6:\"number\";i:3;s:5:\"image\";s:2:\"on\";}}","yes"),
("147","widget_block_widget","a:3:{s:12:\"_multiwidget\";i:1;i:3;a:2:{s:5:\"title\";s:6:\"sadsad\";s:5:\"block\";s:0:\"\";}i:5;a:2:{s:5:\"title\";s:0:\"\";s:5:\"block\";s:15:\"sidebar-tin-tuc\";}}","yes"),
("149","allowedthemes","a:1:{s:7:\"noithat\";b:1;}","no"),
("150","fl_has_child_theme","noithat","yes"),
("152","theme_mods_noithat","a:253:{i:0;b:0;s:17:\"flatsome_fallback\";i:0;s:20:\"topbar_elements_left\";a:0:{}s:21:\"topbar_elements_right\";a:0:{}s:20:\"header_elements_left\";a:1:{i:0;s:3:\"nav\";}s:21:\"header_elements_right\";a:1:{i:0;s:6:\"social\";}s:27:\"header_elements_bottom_left\";a:1:{i:0;s:4:\"html\";}s:29:\"header_elements_bottom_center\";a:0:{}s:28:\"header_elements_bottom_right\";a:2:{i:0;s:4:\"cart\";i:1;s:8:\"button-1\";}s:27:\"header_mobile_elements_left\";a:1:{i:0;s:9:\"menu-icon\";}s:28:\"header_mobile_elements_right\";a:1:{i:0;s:4:\"cart\";}s:26:\"header_mobile_elements_top\";a:0:{}s:14:\"mobile_sidebar\";a:3:{i:0;s:3:\"nav\";i:1;s:7:\"nav-top\";i:2;s:6:\"html-2\";}s:14:\"product_layout\";s:10:\"no-sidebar\";s:23:\"payment_icons_placement\";s:6:\"footer\";s:14:\"follow_twitter\";s:0:\"\";s:15:\"follow_facebook\";s:1:\"1\";s:16:\"follow_instagram\";s:0:\"\";s:12:\"follow_email\";s:20:\"nhamoidogo@gmail.com\";s:16:\"flatsome_version\";a:1:{i:0;s:1:\"3\";}s:24:\"portfolio_archive_filter\";s:4:\"left\";s:19:\"flatsome_db_version\";s:5:\"3.5.0\";s:18:\"nav_menu_locations\";a:3:{s:7:\"primary\";i:2;s:14:\"primary_mobile\";i:2;s:11:\"top_bar_nav\";i:3;}s:7:\"backups\";N;s:9:\"smof_init\";s:31:\"Mon, 03 Sep 2018 15:47:37 +0000\";s:9:\"site_logo\";s:62:\"http://125.212.227.39/demo/wp-content/uploads/2018/09/logo.png\";s:11:\"preset_home\";s:18:\"Fullscreen Fashion\";s:13:\"type_headings\";a:6:{s:11:\"font-family\";s:6:\"Armata\";s:11:\"font-backup\";s:0:\"\";s:7:\"variant\";s:7:\"regular\";s:11:\"font-weight\";i:400;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";N;}s:10:\"type_texts\";a:6:{s:11:\"font-family\";s:6:\"Armata\";s:11:\"font-backup\";s:0:\"\";s:7:\"variant\";s:7:\"regular\";s:11:\"font-weight\";i:400;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";N;}s:8:\"type_nav\";a:6:{s:11:\"font-family\";s:6:\"Armata\";s:7:\"variant\";s:7:\"regular\";s:11:\"font-backup\";s:0:\"\";s:11:\"font-weight\";i:400;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";N;}s:13:\"logo_position\";s:4:\"left\";s:11:\"topbar_show\";b:0;s:13:\"header_height\";s:2:\"78\";s:12:\"header_color\";s:5:\"light\";s:9:\"header_bg\";s:21:\"rgba(255,255,255,0.9)\";s:25:\"header_height_transparent\";s:3:\"221\";s:27:\"header_bg_transparent_shade\";b:0;s:15:\"menu_icon_title\";s:1:\"1\";s:14:\"mobile_overlay\";s:4:\"left\";s:20:\"mobile_overlay_color\";s:4:\"dark\";s:18:\"account_icon_style\";s:0:\"\";s:20:\"header_account_title\";s:1:\"0\";s:17:\"header_cart_style\";s:10:\"off-canvas\";s:15:\"cart_icon_style\";s:4:\"fill\";s:9:\"cart_icon\";s:4:\"cart\";s:17:\"header_cart_total\";b:0;s:17:\"header_cart_title\";b:0;s:14:\"wishlist_title\";s:1:\"0\";s:8:\"footer_1\";b:1;s:17:\"footer_1_bg_color\";s:7:\"#383838\";s:8:\"footer_2\";b:1;s:19:\"footer_bottom_align\";s:6:\"center\";s:19:\"footer_bottom_color\";s:7:\"#ffffff\";s:13:\"color_primary\";s:7:\"#52923c\";s:15:\"color_secondary\";s:7:\"#52923c\";s:16:\"category_sidebar\";s:12:\"left-sidebar\";s:18:\"category_row_count\";s:1:\"3\";s:20:\"category_title_style\";s:0:\"\";s:19:\"category_show_title\";s:1:\"1\";s:27:\"category_header_transparent\";b:0;s:20:\"header_shop_bg_color\";s:18:\"rgba(10,10,10,0.3)\";s:15:\"breadcrumb_size\";s:5:\"small\";s:9:\"cat_style\";s:6:\"normal\";s:14:\"product_header\";s:8:\"featured\";s:26:\"product_header_transparent\";b:0;s:19:\"product_image_style\";s:6:\"normal\";s:18:\"product_info_align\";s:4:\"left\";s:18:\"product_tabs_align\";s:4:\"left\";s:18:\"custom_css_post_id\";i:428;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1539618386;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:21:{i:0;s:15:\"media_gallery-3\";i:1;s:15:\"media_gallery-4\";i:2;s:13:\"custom_html-4\";i:3;s:23:\"flatsome_recent_posts-5\";i:4;s:12:\"categories-2\";i:5;s:12:\"categories-5\";i:6;s:12:\"categories-7\";i:7;s:14:\"recent-posts-6\";i:8;s:14:\"recent-posts-7\";i:9;s:5:\"rss-3\";i:10;s:13:\"custom_html-3\";i:11;s:33:\"woocommerce_layered_nav_filters-3\";i:12;s:32:\"woocommerce_product_categories-5\";i:13;s:23:\"flatsome_recent_posts-3\";i:14;s:14:\"block_widget-3\";i:15;s:14:\"recent-posts-4\";i:16;s:10:\"archives-2\";i:17;s:6:\"meta-2\";i:18;s:8:\"search-2\";i:19;s:14:\"recent-posts-2\";i:20;s:17:\"recent-comments-2\";}s:12:\"sidebar-main\";a:1:{i:0;s:14:\"block_widget-5\";}s:16:\"sidebar-footer-1\";a:0:{}s:16:\"sidebar-footer-2\";a:0:{}s:12:\"shop-sidebar\";a:3:{i:0;s:32:\"woocommerce_product_categories-3\";i:1;s:38:\"woocommerce_recently_viewed_products-3\";i:2;s:15:\"upsell_widget-3\";}s:15:\"product-sidebar\";a:0:{}}}s:17:\"header_top_height\";s:2:\"20\";s:12:\"topbar_color\";s:4:\"dark\";s:9:\"topbar_bg\";s:0:\"\";s:13:\"nav_style_top\";s:3:\"box\";s:11:\"preset_demo\";s:15:\"header-wide-nav\";s:22:\"topbar_elements_center\";a:0:{}s:29:\"header_mobile_elements_bottom\";a:0:{}s:16:\"site_logo_slogan\";b:0;s:10:\"logo_width\";s:3:\"316\";s:14:\"logo_max_width\";s:0:\"\";s:12:\"logo_padding\";s:1:\"2\";s:12:\"header_width\";s:9:\"container\";s:20:\"header_bg_img_repeat\";s:8:\"repeat-x\";s:17:\"box_shadow_header\";b:0;s:9:\"nav_style\";s:0:\"\";s:8:\"nav_size\";s:5:\"large\";s:13:\"nav_uppercase\";b:1;s:8:\"nav_push\";s:2:\"12\";s:14:\"type_nav_color\";s:7:\"#000000\";s:20:\"type_nav_color_hover\";s:7:\"#238b21\";s:21:\"header_bg_transparent\";s:0:\"\";s:20:\"header_bottom_height\";s:2:\"33\";s:15:\"nav_position_bg\";s:7:\"#424242\";s:16:\"nav_style_bottom\";s:0:\"\";s:15:\"nav_size_bottom\";s:0:\"\";s:20:\"nav_uppercase_bottom\";b:1;s:18:\"nav_position_color\";s:4:\"dark\";s:21:\"type_nav_bottom_color\";s:7:\"#ffffff\";s:27:\"type_nav_bottom_color_hover\";s:7:\"#81d742\";s:19:\"header_search_width\";s:3:\"100\";s:11:\"topbar_left\";s:99:\"<p style=\"font-family: \'Parisienne\', cursive;font-size:25px;\">Tinh hoa nghề mộc Chàng Sơn</p>\";s:12:\"follow_style\";s:10:\"fill-round\";s:13:\"header_bg_img\";s:0:\"\";s:17:\"html_after_header\";s:0:\"\";s:15:\"header_button_1\";s:18:\"DỰ ÁN TƯ VẤN\";s:27:\"header_button_1_link_target\";s:5:\"_self\";s:22:\"header_button_1_radius\";s:3:\"0px\";s:21:\"header_button_1_color\";s:9:\"secondary\";s:21:\"header_button_1_style\";s:0:\"\";s:20:\"header_button_1_size\";s:6:\"medium\";s:21:\"header_button_1_depth\";s:1:\"0\";s:27:\"header_button_1_depth_hover\";s:1:\"0\";s:16:\"custom_cart_icon\";s:0:\"\";s:13:\"contact_style\";s:4:\"left\";s:9:\"follow_vk\";s:0:\"\";s:13:\"follow_flickr\";s:0:\"\";s:12:\"follow_phone\";s:10:\"0888050559\";s:12:\"follow_500px\";s:0:\"\";s:15:\"follow_snapchat\";s:0:\"\";s:12:\"topbar_right\";s:0:\"\";s:10:\"nav_height\";s:2:\"11\";s:17:\"nav_height_bottom\";s:2:\"32\";s:15:\"header_button_2\";s:10:\"VIETNAMESE\";s:21:\"header_button_2_color\";s:7:\"success\";s:20:\"logo_position_mobile\";s:6:\"center\";s:16:\"html_cart_header\";s:0:\"\";s:19:\"header_search_style\";s:8:\"lightbox\";s:24:\"header_search_form_style\";s:0:\"\";s:24:\"header_search_categories\";b:0;s:18:\"search_placeholder\";s:0:\"\";s:11:\"color_links\";s:7:\"#000000\";s:17:\"color_links_hover\";s:7:\"#bdd43e\";s:18:\"color_widget_links\";s:0:\"\";s:11:\"color_texts\";s:7:\"#777777\";s:19:\"type_headings_color\";s:7:\"#555555\";s:13:\"color_divider\";s:0:\"\";s:14:\"pages_template\";s:7:\"default\";s:11:\"blog_layout\";s:13:\"right-sidebar\";s:23:\"blog_posts_header_style\";s:6:\"normal\";s:20:\"header_height_sticky\";s:2:\"60\";s:19:\"sticky_logo_padding\";s:1:\"0\";s:17:\"nav_height_sticky\";s:2:\"23\";s:12:\"sticky_style\";s:4:\"jump\";s:14:\"header_divider\";b:1;s:17:\"dropdown_nav_size\";s:3:\"118\";s:15:\"dropdown_radius\";s:1:\"0\";s:13:\"dropdown_text\";s:5:\"light\";s:14:\"dropdown_style\";s:7:\"default\";s:15:\"dropdown_border\";s:7:\"#83a834\";s:19:\"dropdown_text_style\";s:6:\"simple\";s:10:\"blog_style\";s:4:\"list\";s:14:\"site_logo_dark\";s:62:\"http://125.212.227.39/demo/wp-content/uploads/2018/09/logo.png\";s:17:\"footer_2_bg_color\";s:7:\"#424242\";s:16:\"footer_left_text\";s:0:\"\";s:13:\"payment_icons\";a:0:{}s:18:\"product_box_rating\";b:0;s:19:\"html_scripts_header\";s:0:\"\";s:19:\"html_scripts_footer\";s:0:\"\";s:15:\"html_custom_css\";s:0:\"\";s:22:\"html_custom_css_tablet\";s:0:\"\";s:22:\"html_custom_css_mobile\";s:0:\"\";s:11:\"site_loader\";s:1:\"0\";s:17:\"site_loader_color\";s:5:\"light\";s:14:\"site_loader_bg\";s:0:\"\";s:11:\"live_search\";s:1:\"1\";s:13:\"search_result\";s:1:\"1\";s:13:\"search_by_sku\";s:1:\"0\";s:15:\"flatsome_studio\";s:1:\"1\";s:22:\"lazy_load_google_fonts\";s:1:\"1\";s:15:\"lazy_load_icons\";s:1:\"0\";s:21:\"lazy_load_backgrounds\";s:1:\"1\";s:16:\"lazy_load_images\";s:1:\"0\";s:14:\"google_map_api\";s:0:\"\";s:16:\"maintenance_mode\";s:1:\"0\";s:29:\"maintenance_mode_admin_notice\";s:1:\"1\";s:21:\"maintenance_mode_page\";s:1:\"0\";s:21:\"maintenance_mode_text\";s:24:\"Please check back soon..\";s:15:\"disable_reviews\";s:1:\"0\";s:27:\"product_gallery_woocommerce\";s:1:\"0\";s:14:\"html_shop_page\";s:0:\"\";s:9:\"tab_title\";s:0:\"\";s:11:\"tab_content\";s:0:\"\";s:23:\"html_before_add_to_cart\";s:20:\" [product_sale_icon]\";s:22:\"html_after_add_to_cart\";s:325:\"<div class=\"product-support-order\">\n		<strong>Hỗ trợ đặt hàng</strong>\n		<a href=\"callto:0888050559\" class=\"btn-phone-call\"><i class=\"icon-phone\"></i> 0888 050 559</a>\n	</div>\n<div>Sau khi bạn đặt mua hàng chúng tôi sẽ gọi lại cho bạn vào giờ hành chính để xác nhận lại đơn hàng.</div>\";s:14:\"html_thank_you\";s:0:\"\";s:12:\"catalog_mode\";s:1:\"0\";s:19:\"catalog_mode_prices\";s:1:\"0\";s:19:\"catalog_mode_header\";s:0:\"\";s:20:\"catalog_mode_product\";s:0:\"\";s:21:\"catalog_mode_lightbox\";s:0:\"\";s:24:\"flatsome_infinite_scroll\";s:1:\"0\";s:27:\"infinite_scroll_loader_type\";s:7:\"spinner\";s:26:\"infinite_scroll_loader_img\";s:0:\"\";s:12:\"fl_portfolio\";s:1:\"1\";s:19:\"blog_layout_divider\";b:0;s:17:\"blog_show_excerpt\";b:1;s:16:\"blog_posts_depth\";s:1:\"0\";s:22:\"blog_posts_depth_hover\";s:1:\"0\";s:18:\"blog_archive_title\";b:0;s:18:\"blog_style_archive\";s:4:\"list\";s:15:\"blog_post_style\";s:7:\"default\";s:23:\"blog_single_footer_meta\";b:0;s:15:\"blog_author_box\";b:0;s:12:\"product_zoom\";b:1;s:14:\"product_upsell\";s:8:\"disabled\";s:23:\"related_products_pr_row\";s:1:\"4\";s:23:\"header_shop_bg_featured\";b:0;s:25:\"category_row_count_tablet\";s:1:\"3\";s:16:\"sale_bubble_text\";s:11:\"Giảm giá\";s:22:\"sale_bubble_percentage\";b:1;s:19:\"cart_sticky_sidebar\";b:0;s:15:\"checkout_layout\";s:7:\"focused\";s:12:\"social_icons\";a:4:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:5:\"email\";i:3;s:10:\"googleplus\";}s:13:\"color_success\";s:7:\"#000000\";s:16:\"follow_pinterest\";s:0:\"\";s:13:\"follow_google\";s:0:\"\";s:22:\"header_button_2_radius\";s:3:\"0px\";s:21:\"header_button_2_style\";s:0:\"\";s:20:\"header_button_2_size\";s:6:\"medium\";s:21:\"header_button_2_depth\";s:1:\"0\";s:12:\"footer_block\";s:6:\"footer\";s:18:\"header_icons_color\";s:0:\"\";s:18:\"footer_bottom_text\";s:5:\"light\";s:10:\"grid_style\";s:5:\"grid2\";s:15:\"category_shadow\";s:1:\"0\";s:21:\"category_shadow_hover\";s:1:\"0\";s:18:\"html_before_footer\";s:0:\"\";s:17:\"product_info_meta\";b:0;s:18:\"cart_dropdown_show\";b:1;s:12:\"bubble_style\";s:6:\"style2\";s:33:\"sale_bubble_percentage_formatting\";s:9:\"-{value}%\";s:20:\"header_height_mobile\";s:2:\"70\";s:25:\"category_row_count_mobile\";s:1:\"2\";s:24:\"header_icons_color_hover\";s:0:\"\";s:17:\"footer_right_text\";s:0:\"\";s:11:\"back_to_top\";b:0;s:8:\"type_alt\";a:6:{s:11:\"font-family\";s:10:\"Montserrat\";s:11:\"font-backup\";s:0:\"\";s:7:\"variant\";s:7:\"regular\";s:11:\"font-weight\";i:400;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";N;}s:26:\"text_transform_breadcrumbs\";s:0:\"\";s:25:\"text_transform_navigation\";s:0:\"\";s:9:\"type_size\";s:3:\"100\";s:16:\"type_size_mobile\";s:3:\"100\";s:22:\"text_transform_buttons\";s:0:\"\";s:29:\"text_transform_section_titles\";s:0:\"\";s:28:\"text_transform_widget_titles\";s:0:\"\";s:13:\"disable_fonts\";b:0;s:23:\"blog_single_header_meta\";b:0;s:18:\"social_icons_style\";s:4:\"fill\";s:19:\"product_image_width\";s:1:\"7\";s:16:\"bottombar_sticky\";b:1;s:18:\"nav_spacing_bottom\";s:5:\"small\";s:18:\"disable_quick_view\";b:1;s:18:\"product_info_share\";b:0;s:20:\"header_button_1_link\";s:27:\"125.212.227.39/demo/tu-van/\";}","yes"),
("156","envato_setup_complete","1536043627","yes"),
("180","theme_mods_numinous","a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536037341;s:4:\"data\";a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:13:\"right-sidebar\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:10:\"footer-one\";a:0:{}s:10:\"footer-two\";a:0:{}s:12:\"footer-three\";a:0:{}}}}","yes"),
("182","widget_numinous_recent_post","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("183","widget_numinous_popular_post","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("184","widget_numinous_social_links","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("188","theme_mods_twentysixteen","a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536037370;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}","yes"),
("192","_transient__flatsome_activation_redirect","1","yes"),
("204","theme_mods_preschool-and-kindergarten","a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536039287;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:0:{}s:13:\"right-sidebar\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:10:\"footer-one\";a:0:{}s:10:\"footer-two\";a:0:{}s:12:\"footer-three\";a:0:{}s:11:\"footer-four\";a:0:{}}}}","yes"),
("205","widget_preschool_and_kindergarten_recent_post","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("206","widget_preschool_and_kindergarten_popular_post","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("207","widget_preschool_and_kindergarten_social_links","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("221","recently_activated","a:0:{}","yes"),
("223","theme_mods_twentyfifteen","a:1:{s:18:\"custom_css_post_id\";i:-1;}","yes"),
("238","nav_menu_options","a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}","yes"),
("265","woocommerce_store_address","","yes"),
("266","woocommerce_store_address_2","","yes"),
("267","woocommerce_store_city","","yes"),
("268","woocommerce_default_country","VN","yes"),
("269","woocommerce_store_postcode","","yes"),
("270","woocommerce_allowed_countries","all","yes"),
("271","woocommerce_all_except_countries","a:0:{}","yes"),
("272","woocommerce_specific_allowed_countries","a:0:{}","yes"),
("273","woocommerce_ship_to_countries","","yes"),
("274","woocommerce_specific_ship_to_countries","a:0:{}","yes"),
("275","woocommerce_default_customer_address","geolocation","yes"),
("276","woocommerce_calc_taxes","no","yes"),
("277","woocommerce_enable_coupons","yes","yes"),
("278","woocommerce_calc_discounts_sequentially","no","no"),
("279","woocommerce_currency","VND","yes"),
("280","woocommerce_currency_pos","right","yes"),
("281","woocommerce_price_thousand_sep",",","yes"),
("282","woocommerce_price_decimal_sep",".","yes"),
("283","woocommerce_price_num_decimals","0","yes"),
("284","woocommerce_shop_page_id","145","yes"),
("285","woocommerce_cart_redirect_after_add","no","yes"),
("286","woocommerce_enable_ajax_add_to_cart","yes","yes"),
("287","woocommerce_weight_unit","kg","yes"),
("288","woocommerce_dimension_unit","cm","yes"),
("289","woocommerce_enable_reviews","yes","yes"),
("290","woocommerce_review_rating_verification_label","yes","no"),
("291","woocommerce_review_rating_verification_required","no","no"),
("292","woocommerce_enable_review_rating","yes","yes"),
("293","woocommerce_review_rating_required","yes","no"),
("294","woocommerce_manage_stock","yes","yes"),
("295","woocommerce_hold_stock_minutes","60","no"),
("296","woocommerce_notify_low_stock","yes","no"),
("297","woocommerce_notify_no_stock","yes","no"),
("298","woocommerce_stock_email_recipient","duongva91@gmail.com","no"),
("299","woocommerce_notify_low_stock_amount","2","no"),
("300","woocommerce_notify_no_stock_amount","0","yes"),
("301","woocommerce_hide_out_of_stock_items","no","yes"),
("302","woocommerce_stock_format","","yes"),
("303","woocommerce_file_download_method","force","no"),
("304","woocommerce_downloads_require_login","no","no"),
("305","woocommerce_downloads_grant_access_after_payment","yes","no"),
("306","woocommerce_prices_include_tax","no","yes"),
("307","woocommerce_tax_based_on","shipping","yes"),
("308","woocommerce_shipping_tax_class","inherit","yes"),
("309","woocommerce_tax_round_at_subtotal","no","yes"),
("310","woocommerce_tax_classes","Giảm tỉ lệ\nTỉ lệ rỗng","yes"),
("311","woocommerce_tax_display_shop","excl","yes"),
("312","woocommerce_tax_display_cart","excl","yes"),
("313","woocommerce_price_display_suffix","","yes"),
("314","woocommerce_tax_total_display","itemized","no"),
("315","woocommerce_enable_shipping_calc","yes","no"),
("316","woocommerce_shipping_cost_requires_address","no","yes"),
("317","woocommerce_ship_to_destination","billing","no"),
("318","woocommerce_shipping_debug_mode","no","yes"),
("319","woocommerce_enable_guest_checkout","yes","no"),
("320","woocommerce_enable_checkout_login_reminder","no","no"),
("321","woocommerce_enable_signup_and_login_from_checkout","no","no"),
("322","woocommerce_enable_myaccount_registration","no","no"),
("323","woocommerce_registration_generate_username","yes","no"),
("324","woocommerce_registration_generate_password","yes","no"),
("325","woocommerce_erasure_request_removes_order_data","no","no"),
("326","woocommerce_erasure_request_removes_download_data","no","no"),
("327","woocommerce_registration_privacy_policy_text","Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].","yes"),
("328","woocommerce_checkout_privacy_policy_text","","yes"),
("329","woocommerce_delete_inactive_accounts","a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}","no");
INSERT INTO wp_options VALUES
("330","woocommerce_trash_pending_orders","","no"),
("331","woocommerce_trash_failed_orders","","no"),
("332","woocommerce_trash_cancelled_orders","","no"),
("333","woocommerce_anonymize_completed_orders","a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}","no"),
("334","woocommerce_email_from_name","admin","no"),
("335","woocommerce_email_from_address","duongva91@gmail.com","no"),
("336","woocommerce_email_header_image","","no"),
("337","woocommerce_email_footer_text","{site_title}","no"),
("338","woocommerce_email_base_color","#96588a","no"),
("339","woocommerce_email_background_color","#f7f7f7","no"),
("340","woocommerce_email_body_background_color","#ffffff","no"),
("341","woocommerce_email_text_color","#3c3c3c","no"),
("342","woocommerce_cart_page_id","146","yes"),
("343","woocommerce_checkout_page_id","147","yes"),
("344","woocommerce_myaccount_page_id","148","yes"),
("345","woocommerce_terms_page_id","","no"),
("346","woocommerce_force_ssl_checkout","no","yes"),
("347","woocommerce_unforce_ssl_checkout","no","yes"),
("348","woocommerce_checkout_pay_endpoint","order-pay","yes"),
("349","woocommerce_checkout_order_received_endpoint","order-received","yes"),
("350","woocommerce_myaccount_add_payment_method_endpoint","add-payment-method","yes"),
("351","woocommerce_myaccount_delete_payment_method_endpoint","delete-payment-method","yes"),
("352","woocommerce_myaccount_set_default_payment_method_endpoint","set-default-payment-method","yes"),
("353","woocommerce_myaccount_orders_endpoint","orders","yes"),
("354","woocommerce_myaccount_view_order_endpoint","view-order","yes"),
("355","woocommerce_myaccount_downloads_endpoint","downloads","yes"),
("356","woocommerce_myaccount_edit_account_endpoint","edit-account","yes"),
("357","woocommerce_myaccount_edit_address_endpoint","edit-address","yes"),
("358","woocommerce_myaccount_payment_methods_endpoint","payment-methods","yes"),
("359","woocommerce_myaccount_lost_password_endpoint","lost-password","yes"),
("360","woocommerce_logout_endpoint","customer-logout","yes"),
("361","woocommerce_api_enabled","no","yes"),
("362","woocommerce_single_image_width","510","yes"),
("363","woocommerce_thumbnail_image_width","247","yes"),
("364","woocommerce_checkout_highlight_required_fields","yes","yes"),
("365","woocommerce_demo_store","no","no"),
("366","woocommerce_permalinks","a:5:{s:12:\"product_base\";s:9:\"/san-pham\";s:13:\"category_base\";s:8:\"danh-muc\";s:8:\"tag_base\";s:7:\"tu-khoa\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}","yes"),
("367","current_theme_supports_woocommerce","yes","yes"),
("368","woocommerce_queue_flush_rewrite_rules","no","yes"),
("371","default_product_cat","17","yes"),
("376","woocommerce_admin_notices","a:1:{i:0;s:20:\"no_secure_connection\";}","yes"),
("377","_transient_woocommerce_webhook_ids","a:0:{}","yes"),
("378","widget_woocommerce_widget_cart","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("379","widget_woocommerce_layered_nav_filters","a:2:{s:12:\"_multiwidget\";i:1;i:3;a:0:{}}","yes"),
("380","widget_woocommerce_layered_nav","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("381","widget_woocommerce_price_filter","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("382","widget_woocommerce_product_categories","a:3:{s:12:\"_multiwidget\";i:1;i:3;a:0:{}i:5;a:0:{}}","yes"),
("383","widget_woocommerce_product_search","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("384","widget_woocommerce_product_tag_cloud","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("385","widget_woocommerce_products","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("386","widget_woocommerce_recently_viewed_products","a:2:{s:12:\"_multiwidget\";i:1;i:3;a:0:{}}","yes"),
("387","widget_woocommerce_top_rated_products","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("388","widget_woocommerce_recent_reviews","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("389","widget_woocommerce_rating_filter","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("390","widget_upsell_widget","a:2:{s:12:\"_multiwidget\";i:1;i:3;a:1:{s:5:\"title\";s:24:\"Sản phẩm bán chạy\";}}","yes"),
("394","woocommerce_meta_box_errors","a:0:{}","yes"),
("421","_transient_product_query-transient-version","1539315609","yes"),
("424","_transient_product-transient-version","1539315609","yes"),
("436","_transient_shipping-transient-version","1536158130","yes"),
("448","woocommerce_cod_settings","a:6:{s:7:\"enabled\";s:3:\"yes\";s:5:\"title\";s:35:\"Trả tiền mặt khi nhận hàng\";s:11:\"description\";s:34:\"Trả tiền mặt khi giao hàng.\";s:12:\"instructions\";s:34:\"Trả tiền mặt khi giao hàng.\";s:18:\"enable_for_methods\";a:0:{}s:18:\"enable_for_virtual\";s:3:\"yes\";}","yes"),
("449","woocommerce_gateway_order","a:4:{s:4:\"bacs\";i:0;s:6:\"cheque\";i:1;s:3:\"cod\";i:2;s:6:\"paypal\";i:3;}","yes"),
("450","woocommerce_bacs_settings","a:11:{s:7:\"enabled\";s:3:\"yes\";s:5:\"title\";s:28:\"Chuyển khoản ngân hàng\";s:11:\"description\";s:226:\"Thực hiện thanh toán vào ngay tài khoản ngân hàng của chúng tôi. Vui lòng sử dụng Mã đơn hàng của bạn trong phần Nội dung thanh toán. Đơn hàng sẽ đươc giao sau khi tiền đã chuyển.\";s:12:\"instructions\";s:0:\"\";s:15:\"account_details\";s:0:\"\";s:12:\"account_name\";s:0:\"\";s:14:\"account_number\";s:0:\"\";s:9:\"sort_code\";s:0:\"\";s:9:\"bank_name\";s:0:\"\";s:4:\"iban\";s:0:\"\";s:3:\"bic\";s:0:\"\";}","yes"),
("451","_transient_orders-transient-version","1536158923","yes"),
("556","woocommerce_maybe_regenerate_images_hash","958afab2d0b050fa8d8b61b9b9cd31bf","yes"),
("865","cfdb7_view_install_date","2018-09-08 13:08:31","yes"),
("874","wpcf7","a:2:{s:7:\"version\";s:5:\"5.0.4\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1536412882;s:7:\"version\";s:5:\"5.0.4\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}","yes"),
("1141","do_activate","0","yes"),
("1242","jpsq_sync_checkout","0:0","no"),
("1247","widget_blog_subscription","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1248","widget_authors","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1249","widget_eu_cookie_law_widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1250","widget_facebook-likebox","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1251","widget_flickr","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1252","widget_wpcom-goodreads","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1253","widget_google_translate_widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1254","widget_googleplus-badge","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1255","widget_grofile","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1256","widget_internet_defense_league_widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1257","widget_widget_mailchimp_subscriber_popup","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1258","widget_milestone_widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1259","widget_jetpack_my_community","a:2:{i:3;a:5:{s:5:\"title\";b:0;s:6:\"number\";i:10;s:14:\"include_likers\";b:1;s:17:\"include_followers\";b:1;s:18:\"include_commenters\";b:1;}s:12:\"_multiwidget\";i:1;}","yes"),
("1260","widget_rss_links","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1261","widget_jetpack_widget_social_icons","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1262","widget_twitter_timeline","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1263","widget_upcoming_events_widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1264","widget_jetpack_display_posts_widget","a:1:{s:12:\"_multiwidget\";i:1;}","yes"),
("1279","jpsq_full_sync_checkout","0:0","no"),
("1337","gravatar_disable_hovercards","0","yes"),
("1339","safecss_add","","yes"),
("1340","verification_services_codes","0","yes"),
("1347","safecss","","yes"),
("1361","trusted_ip_header","O:8:\"stdClass\":3:{s:14:\"trusted_header\";s:11:\"REMOTE_ADDR\";s:8:\"segments\";i:1;s:7:\"reverse\";b:0;}","no"),
("1364","jetpack_plugin_api_action_links","a:3:{s:36:\"contact-form-7/wp-contact-form-7.php\";a:1:{s:11:\"Cấu hình\";s:56:\"http://125.212.227.39/demo/wp-admin/admin.php?page=wpcf7\";}s:19:\"jetpack/jetpack.php\";a:3:{s:7:\"Jetpack\";s:58:\"http://125.212.227.39/demo/wp-admin/admin.php?page=jetpack\";s:11:\"Cài đặt\";s:68:\"http://125.212.227.39/demo/wp-admin/admin.php?page=jetpack#/settings\";s:11:\"Trợ giúp\";s:67:\"http://125.212.227.39/demo/wp-admin/admin.php?page=jetpack-debugger\";}s:27:\"woocommerce/woocommerce.php\";a:1:{s:11:\"Cài đặt\";s:62:\"http://125.212.227.39/demo/wp-admin/admin.php?page=wc-settings\";}}","yes"),
("1439","post_by_email_address1","NULL","yes"),
("1440","monitor_receive_notifications","1","yes"),
("1471","stats_cache","a:2:{s:32:\"0570f69ba552771ed1811ef5a9f485cf\";a:1:{i:1536997178;a:0:{}}s:32:\"22b042ac8a1bcf7ea78b958f143d4950\";a:1:{i:1536997179;a:0:{}}}","yes"),
("1582","widget_blog-stats","a:3:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;i:3;a:2:{s:5:\"title\";s:22:\"Thống kê truy cập\";s:4:\"hits\";s:6:\"online\";}}","yes"),
("1583","widget_top-posts","a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}","yes"),
("1584","widget_widget_contact_info","a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}","yes"),
("1632","open_graph_protocol_site_type","","yes");
INSERT INTO wp_options VALUES
("1633","facebook_admins","a:0:{}","yes"),
("2338","jetpack_constants_sync_checksum","a:31:{s:16:\"EMPTY_TRASH_DAYS\";i:2473281379;s:17:\"WP_POST_REVISIONS\";i:4261170317;s:26:\"AUTOMATIC_UPDATER_DISABLED\";i:634125391;s:7:\"ABSPATH\";i:3040142404;s:14:\"WP_CONTENT_DIR\";i:560012477;s:9:\"FS_METHOD\";i:634125391;s:18:\"DISALLOW_FILE_EDIT\";i:634125391;s:18:\"DISALLOW_FILE_MODS\";i:634125391;s:19:\"WP_AUTO_UPDATE_CORE\";i:634125391;s:22:\"WP_HTTP_BLOCK_EXTERNAL\";i:634125391;s:19:\"WP_ACCESSIBLE_HOSTS\";i:634125391;s:16:\"JETPACK__VERSION\";i:3990996156;s:12:\"IS_PRESSABLE\";i:634125391;s:15:\"DISABLE_WP_CRON\";i:634125391;s:17:\"ALTERNATE_WP_CRON\";i:634125391;s:20:\"WP_CRON_LOCK_TIMEOUT\";i:3994858278;s:11:\"PHP_VERSION\";i:1523529932;s:15:\"WP_MEMORY_LIMIT\";i:3065409971;s:19:\"WP_MAX_MEMORY_LIMIT\";i:1474498405;s:14:\"WC_PLUGIN_FILE\";i:1106829652;s:10:\"WC_ABSPATH\";i:424343044;s:18:\"WC_PLUGIN_BASENAME\";i:1149093810;s:10:\"WC_VERSION\";i:60462307;s:19:\"WOOCOMMERCE_VERSION\";i:60462307;s:21:\"WC_ROUNDING_PRECISION\";i:498629140;s:25:\"WC_DISCOUNT_ROUNDING_MODE\";i:450215437;s:20:\"WC_TAX_ROUNDING_MODE\";i:2212294583;s:12:\"WC_DELIMITER\";i:2455911554;s:10:\"WC_LOG_DIR\";i:706909882;s:22:\"WC_SESSION_CACHE_GROUP\";i:4278978988;s:22:\"WC_TEMPLATE_DEBUG_MODE\";i:734881840;}","yes"),
("2341","jetpack_sync_https_history_main_network_site_url","a:1:{i:0;s:4:\"http\";}","yes"),
("2342","jetpack_sync_https_history_site_url","a:2:{i:0;s:4:\"http\";i:1;s:4:\"http\";}","yes"),
("2343","jetpack_sync_https_history_home_url","a:2:{i:0;s:4:\"http\";i:1;s:4:\"http\";}","yes"),
("2374","jetpack_callables_sync_checksum","a:30:{s:18:\"wp_max_upload_size\";i:2560591053;s:15:\"is_main_network\";i:734881840;s:13:\"is_multi_site\";i:734881840;s:17:\"main_network_site\";i:1913742847;s:8:\"site_url\";i:1913742847;s:8:\"home_url\";i:1913742847;s:16:\"single_user_site\";i:4261170317;s:7:\"updates\";i:3425443202;s:28:\"has_file_system_write_access\";i:4261170317;s:21:\"is_version_controlled\";i:734881840;s:10:\"taxonomies\";i:1117386806;s:10:\"post_types\";i:3058135151;s:18:\"post_type_features\";i:511003515;s:10:\"shortcodes\";i:1597425988;s:27:\"rest_api_allowed_post_types\";i:101922791;s:32:\"rest_api_allowed_public_metadata\";i:223132457;s:24:\"sso_is_two_step_required\";i:734881840;s:26:\"sso_should_hide_login_form\";i:734881840;s:18:\"sso_match_by_email\";i:4261170317;s:21:\"sso_new_user_override\";i:734881840;s:29:\"sso_bypass_default_login_form\";i:734881840;s:10:\"wp_version\";i:1499136715;s:11:\"get_plugins\";i:4262992011;s:24:\"get_plugins_action_links\";i:1015303842;s:14:\"active_modules\";i:3676151046;s:16:\"hosting_provider\";i:769900095;s:6:\"locale\";i:442252609;s:13:\"site_icon_url\";i:734881840;s:5:\"roles\";i:2254693364;s:8:\"timezone\";i:3808505409;}","no"),
("2767","loco_settings","a:3:{s:1:\"c\";s:18:\"Loco_data_Settings\";s:1:\"v\";i:0;s:1:\"d\";a:11:{s:7:\"version\";s:5:\"2.1.5\";s:8:\"gen_hash\";b:0;s:9:\"use_fuzzy\";b:1;s:11:\"num_backups\";i:1;s:9:\"pot_alias\";a:3:{i:0;s:10:\"default.po\";i:1;s:8:\"en_US.po\";i:2;s:5:\"en.po\";}s:9:\"php_alias\";a:2:{i:0;s:3:\"php\";i:1;s:4:\"twig\";}s:10:\"fs_persist\";b:0;s:10:\"fs_protect\";i:1;s:12:\"max_php_size\";s:4:\"100K\";s:11:\"po_utf8_bom\";b:0;s:8:\"po_width\";s:2:\"79\";}}","yes"),
("2768","_transient_loco_po_2e5a702bee3e487469c27fd5d56c402f","a:3:{s:1:\"c\";s:21:\"Loco_gettext_Metadata\";s:1:\"v\";i:0;s:1:\"d\";a:5:{s:5:\"rpath\";s:51:\"plugins/loco-translate/languages/loco-translate.pot\";s:5:\"bytes\";i:42596;s:5:\"mtime\";i:1537714024;s:5:\"valid\";b:1;s:5:\"stats\";a:3:{s:1:\"t\";i:377;s:1:\"p\";i:0;s:1:\"f\";i:0;}}}","yes"),
("2769","loco_recent","a:3:{s:1:\"c\";s:21:\"Loco_data_RecentItems\";s:1:\"v\";i:0;s:1:\"d\";a:1:{s:6:\"bundle\";a:1:{s:30:\"plugin.loco-translate/loco.php\";i:1537714094;}}}","no"),
("2819","product_cat_children","a:0:{}","yes"),
("3431","_transient_wc_attribute_taxonomies","a:0:{}","yes"),
("3598","_transient_wc_count_comments","O:8:\"stdClass\":7:{s:14:\"total_comments\";i:0;s:3:\"all\";i:0;s:9:\"moderated\";i:0;s:8:\"approved\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}","yes"),
("3693","woocommerce_version","3.4.6","yes"),
("3694","woocommerce_db_version","3.4.6","yes"),
("3722","theme_mods_freelancerviet.net","a:102:{i:0;b:0;s:18:\"nav_menu_locations\";a:3:{s:7:\"primary\";i:2;s:14:\"primary_mobile\";i:2;s:11:\"top_bar_nav\";i:3;}s:17:\"flatsome_fallback\";i:1;s:20:\"topbar_elements_left\";a:1:{i:0;s:7:\"contact\";}s:21:\"topbar_elements_right\";a:1:{i:0;s:6:\"social\";}s:20:\"header_elements_left\";a:1:{i:0;s:3:\"nav\";}s:21:\"header_elements_right\";a:1:{i:0;s:4:\"cart\";}s:27:\"header_elements_bottom_left\";a:0:{}s:29:\"header_elements_bottom_center\";a:0:{}s:28:\"header_elements_bottom_right\";a:0:{}s:27:\"header_mobile_elements_left\";a:1:{i:0;s:9:\"menu-icon\";}s:28:\"header_mobile_elements_right\";a:1:{i:0;s:4:\"cart\";}s:26:\"header_mobile_elements_top\";a:1:{i:0;s:4:\"html\";}s:14:\"mobile_sidebar\";a:2:{i:0;s:3:\"nav\";i:1;s:6:\"social\";}s:14:\"product_layout\";s:18:\"right-sidebar-full\";s:23:\"payment_icons_placement\";a:1:{i:0;s:4:\"cart\";}s:14:\"follow_twitter\";s:0:\"\";s:15:\"follow_facebook\";s:43:\"https://www.facebook.com/freelancerviet.net\";s:16:\"follow_instagram\";s:0:\"\";s:12:\"follow_email\";s:26:\"vuonganhduong812@gmail.com\";s:16:\"flatsome_version\";i:3;s:24:\"portfolio_archive_filter\";s:4:\"left\";s:19:\"flatsome_db_version\";s:5:\"3.8.1\";s:7:\"backups\";N;s:9:\"smof_init\";s:31:\"Mon, 15 Oct 2018 15:46:30 +0000\";s:19:\"html_scripts_header\";s:0:\"\";s:19:\"html_scripts_footer\";s:0:\"\";s:15:\"html_custom_css\";s:0:\"\";s:22:\"html_custom_css_tablet\";s:0:\"\";s:22:\"html_custom_css_mobile\";s:0:\"\";s:11:\"site_loader\";i:0;s:17:\"site_loader_color\";s:5:\"light\";s:14:\"site_loader_bg\";s:0:\"\";s:11:\"live_search\";i:1;s:18:\"search_placeholder\";s:0:\"\";s:13:\"search_result\";i:1;s:13:\"search_by_sku\";i:0;s:15:\"flatsome_studio\";i:1;s:22:\"lazy_load_google_fonts\";i:1;s:15:\"lazy_load_icons\";i:0;s:21:\"lazy_load_backgrounds\";i:1;s:16:\"lazy_load_images\";i:0;s:14:\"google_map_api\";s:0:\"\";s:16:\"maintenance_mode\";i:0;s:29:\"maintenance_mode_admin_notice\";i:1;s:21:\"maintenance_mode_page\";i:0;s:21:\"maintenance_mode_text\";s:24:\"Please check back soon..\";s:15:\"disable_reviews\";i:0;s:27:\"product_gallery_woocommerce\";i:0;s:14:\"html_shop_page\";s:0:\"\";s:9:\"tab_title\";s:0:\"\";s:11:\"tab_content\";s:0:\"\";s:23:\"html_before_add_to_cart\";s:1:\" \";s:22:\"html_after_add_to_cart\";s:0:\"\";s:14:\"html_thank_you\";s:0:\"\";s:12:\"catalog_mode\";i:0;s:19:\"catalog_mode_prices\";i:0;s:19:\"catalog_mode_header\";s:0:\"\";s:20:\"catalog_mode_product\";s:0:\"\";s:21:\"catalog_mode_lightbox\";s:0:\"\";s:24:\"flatsome_infinite_scroll\";i:0;s:27:\"infinite_scroll_loader_type\";s:7:\"spinner\";s:26:\"infinite_scroll_loader_img\";s:0:\"\";s:18:\"custom_css_post_id\";i:-1;s:13:\"contact_phone\";s:15:\"+84 03522 98233\";s:17:\"header_top_height\";s:2:\"30\";s:13:\"contact_email\";s:26:\"vuonganhduong812@gmail.com\";s:19:\"contact_email_label\";s:26:\"vuonganhduong812@gmail.com\";s:13:\"contact_hours\";s:0:\"\";s:12:\"follow_phone\";s:10:\"0352298233\";s:10:\"follow_rss\";s:0:\"\";s:12:\"follow_500px\";s:27:\"https://zalo.me/01652298233\";s:9:\"follow_vk\";s:0:\"\";s:9:\"site_logo\";s:82:\"http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/freelancerviet.png\";s:10:\"logo_width\";s:3:\"187\";s:12:\"logo_padding\";s:1:\"0\";s:14:\"pages_template\";s:7:\"default\";s:23:\"blog_single_header_meta\";b:1;s:23:\"blog_single_footer_meta\";b:0;s:15:\"blog_author_box\";b:0;s:13:\"type_headings\";a:6:{s:11:\"font-family\";s:4:\"Muli\";s:7:\"variant\";s:3:\"700\";s:11:\"font-backup\";s:0:\"\";s:11:\"font-weight\";i:700;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";N;}s:10:\"type_texts\";a:6:{s:11:\"font-family\";s:4:\"Muli\";s:7:\"variant\";s:7:\"regular\";s:11:\"font-backup\";s:0:\"\";s:11:\"font-weight\";i:400;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";N;}s:9:\"type_size\";s:3:\"100\";s:8:\"type_nav\";a:6:{s:11:\"font-family\";s:4:\"Muli\";s:7:\"variant\";s:3:\"700\";s:11:\"font-backup\";s:0:\"\";s:11:\"font-weight\";i:700;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";a:1:{i:0;s:10:\"vietnamese\";}}s:8:\"type_alt\";a:6:{s:11:\"font-family\";s:135:\"-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif\";s:11:\"font-backup\";s:0:\"\";s:7:\"variant\";s:7:\"regular\";s:11:\"font-weight\";i:400;s:10:\"font-style\";s:6:\"normal\";s:7:\"subsets\";N;}s:16:\"type_size_mobile\";s:3:\"100\";s:18:\"blog_style_archive\";s:4:\"list\";s:12:\"social_icons\";a:5:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:5:\"email\";i:3;s:10:\"googleplus\";i:4;s:8:\"whatsapp\";}s:13:\"payment_icons\";a:0:{}s:16:\"category_sidebar\";s:12:\"left-sidebar\";s:20:\"product_box_category\";b:0;s:18:\"product_box_rating\";b:0;s:12:\"bubble_style\";s:6:\"style2\";s:16:\"product_lightbox\";s:8:\"flatsome\";s:12:\"product_zoom\";b:1;s:20:\"header_height_sticky\";s:2:\"70\";s:19:\"sticky_logo_padding\";s:1:\"0\";s:12:\"footer_block\";s:6:\"footer\";s:16:\"footer_left_text\";s:66:\"Copyright [ux_current_year] © <strong>Freelancerviet.net</strong>\";s:11:\"back_to_top\";b:0;s:11:\"color_texts\";s:7:\"#000000\";s:12:\"follow_style\";s:7:\"outline\";}","yes"),
("3723","woocommerce_thumbnail_cropping","custom","yes"),
("3724","woocommerce_thumbnail_cropping_custom_width","5","yes"),
("3725","woocommerce_thumbnail_cropping_custom_height","6","yes"),
("3765","woocommerce_checkout_company_field","hidden","yes"),
("3766","woocommerce_checkout_address_2_field","hidden","yes"),
("3767","woocommerce_demo_store_notice","","yes"),
("3783","category_children","a:0:{}","yes"),
("4015","db_upgraded","","yes"),
("4022","can_compress_scripts","1","no"),
("4058","_site_transient_update_core","O:8:\"stdClass\":4:{s:7:\"updates\";a:5:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.3.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.3.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.3.4-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.3.4\";s:7:\"version\";s:5:\"5.3.4\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.7.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.7.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.7-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.7-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.7\";s:7:\"version\";s:5:\"5.2.7\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:4;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.6.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.6.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.6-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.1.6-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.1.6-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.6-rollback-0.zip\";}s:7:\"current\";s:5:\"5.1.6\";s:7:\"version\";s:5:\"5.1.6\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:3:\"5.1\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1592125380;s:15:\"version_checked\";s:3:\"5.1\";s:12:\"translations\";a:0:{}}","no"),
("4059","_site_transient_update_themes","O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1592125382;s:7:\"checked\";a:2:{s:8:\"flatsome\";s:5:\"3.8.1\";s:18:\"freelancerviet.net\";s:3:\"3.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}","no"),
("4103","ossdl_off_cdn_url","http://localhost/wordpress_kickstart","yes"),
("4104","ossdl_off_blog_url","http://localhost/wordpress_kickstart","yes"),
("4105","ossdl_off_include_dirs","wp-content,wp-includes","yes"),
("4106","ossdl_off_exclude",".php","yes"),
("4107","ossdl_cname","","yes"),
("4108","wp_super_cache_index_detected","3","no"),
("4110","wpsupercache_start","1554306995","yes"),
("4111","wpsupercache_count","0","yes"),
("4162","_transient_timeout_wc_term_counts","1594029776","no"),
("4163","_transient_wc_term_counts","a:1:{i:17;s:1:\"2\";}","no"),
("4202","_transient_timeout_external_ip_address_::1","1592650548","no"),
("4203","_transient_external_ip_address_::1","117.1.248.190","no"),
("4211","_site_transient_timeout_theme_roots","1592127181","no"),
("4212","_site_transient_theme_roots","a:2:{s:8:\"flatsome\";s:7:\"/themes\";s:18:\"freelancerviet.net\";s:7:\"/themes\";}","no"),
("4213","_site_transient_update_plugins","O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1592125383;s:7:\"checked\";a:5:{s:34:\"advanced-custom-fields-pro/acf.php\";s:7:\"99.5.14\";s:19:\"akismet/akismet.php\";s:5:\"4.0.8\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.0.4\";s:27:\"woocommerce/woocommerce.php\";s:5:\"3.4.6\";s:27:\"wp-super-cache/wp-cache.php\";s:5:\"1.6.4\";}s:8:\"response\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.1.9\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.1.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696\";s:2:\"1x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=2279696\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"wp-super-cache/wp-cache.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/wp-super-cache\";s:4:\"slug\";s:14:\"wp-super-cache\";s:6:\"plugin\";s:27:\"wp-super-cache/wp-cache.php\";s:11:\"new_version\";s:5:\"1.7.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/wp-super-cache/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/wp-super-cache.1.7.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/wp-super-cache/assets/icon-256x256.png?rev=1095422\";s:2:\"1x\";s:67:\"https://ps.w.org/wp-super-cache/assets/icon-128x128.png?rev=1095422\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/wp-super-cache/assets/banner-1544x500.png?rev=1082414\";s:2:\"1x\";s:69:\"https://ps.w.org/wp-super-cache/assets/banner-772x250.png?rev=1082414\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.3.4\";s:12:\"requires_php\";s:5:\"5.2.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"4.2.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.4.2.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2075035\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2075035\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2075035\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2075035\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"7.0\";s:13:\"compatibility\";a:0:{}}}}","no");




CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2497 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_postmeta VALUES
("1","2","_wp_page_template","default"),
("2","3","_wp_page_template","default"),
("13","10","_edit_last","1"),
("14","10","_footer","normal"),
("15","10","_wp_page_template","page-blank.php"),
("16","10","_edit_lock","1539748384:1"),
("29","23","_wp_attached_file","2018/09/cropped-photo.jpg"),
("30","23","_wp_attachment_context","site-icon"),
("31","23","_wp_attachment_metadata","a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:25:\"2018/09/cropped-photo.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"cropped-photo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"cropped-photo-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:25:\"cropped-photo-270x270.jpg\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:25:\"cropped-photo-192x192.jpg\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:25:\"cropped-photo-180x180.jpg\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:23:\"cropped-photo-32x32.jpg\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}"),
("131","67","_menu_item_type","post_type"),
("132","67","_menu_item_menu_item_parent","0"),
("133","67","_menu_item_object_id","10"),
("134","67","_menu_item_object","page"),
("135","67","_menu_item_target",""),
("136","67","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("137","67","_menu_item_xfn",""),
("138","67","_menu_item_url",""),
("312","149","_order_key","wc_order_5b8fecca3ff66"),
("313","149","_customer_user","1"),
("314","149","_payment_method","cod"),
("315","149","_payment_method_title","Trả tiền mặt khi nhận hàng"),
("316","149","_transaction_id",""),
("317","149","_customer_ip_address","::1"),
("318","149","_customer_user_agent","mozilla/5.0 (windows nt 6.1) applewebkit/537.36 (khtml, like gecko) chrome/68.0.3440.106 safari/537.36"),
("319","149","_created_via","checkout"),
("320","149","_date_completed",""),
("321","149","_completed_date",""),
("322","149","_date_paid",""),
("323","149","_paid_date",""),
("324","149","_cart_hash","723e733f0455a2df4b12e5799ada3168"),
("325","149","_billing_first_name","Vương Thị"),
("326","149","_billing_last_name","Uyên"),
("327","149","_billing_company","1992"),
("328","149","_billing_address_1","10"),
("329","149","_billing_address_2",""),
("330","149","_billing_city","1"),
("331","149","_billing_state",""),
("332","149","_billing_postcode",""),
("333","149","_billing_country","VN"),
("334","149","_billing_email","duongva91@gmail.com"),
("335","149","_billing_phone","7686868"),
("336","149","_shipping_first_name",""),
("337","149","_shipping_last_name",""),
("338","149","_shipping_company",""),
("339","149","_shipping_address_1",""),
("340","149","_shipping_address_2",""),
("341","149","_shipping_city",""),
("342","149","_shipping_state",""),
("343","149","_shipping_postcode",""),
("344","149","_shipping_country",""),
("345","149","_order_currency","GBP"),
("346","149","_cart_discount","0"),
("347","149","_cart_discount_tax","0"),
("348","149","_order_shipping","0.00"),
("349","149","_order_shipping_tax","0"),
("350","149","_order_tax","0"),
("351","149","_order_total","3000000.00"),
("352","149","_order_version","3.4.5"),
("353","149","_prices_include_tax","no"),
("354","149","_billing_address_index","Vương Anh Dương 1991 10  1   VN duongva91@gmail.com 7686868"),
("355","149","_shipping_address_index","        "),
("356","149","_download_permissions_granted","yes"),
("357","149","_recorded_sales","yes"),
("358","149","_recorded_coupon_usage_counts","yes"),
("359","149","_order_stock_reduced","yes"),
("437","154","_sku",""),
("440","154","_sale_price_dates_from",""),
("441","154","_sale_price_dates_to",""),
("442","154","total_sales","0"),
("443","154","_tax_status","taxable"),
("444","154","_tax_class",""),
("445","154","_manage_stock","no"),
("446","154","_backorders","no"),
("447","154","_sold_individually","no"),
("448","154","_weight",""),
("449","154","_length",""),
("450","154","_width",""),
("451","154","_height",""),
("452","154","_upsell_ids","a:0:{}"),
("453","154","_crosssell_ids","a:0:{}"),
("454","154","_purchase_note",""),
("455","154","_default_attributes","a:0:{}"),
("456","154","_virtual","no"),
("457","154","_downloadable","no"),
("458","154","_product_image_gallery",""),
("459","154","_download_limit","-1"),
("460","154","_download_expiry","-1"),
("462","154","_stock",""),
("463","154","_stock_status","instock"),
("464","154","_wc_average_rating","0"),
("465","154","_wc_rating_count","a:0:{}"),
("466","154","_wc_review_count","0"),
("467","154","_downloadable_files","a:0:{}"),
("468","154","_product_attributes","a:1:{s:10:\"kich-thuoc\";a:6:{s:4:\"name\";s:14:\"Kích thước\";s:5:\"value\";s:12:\"1m | 2m | 3m\";s:8:\"position\";i:0;s:10:\"is_visible\";i:0;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}"),
("469","154","_product_version","3.4.5"),
("471","154","wc_productdata_options","a:1:{i:0;a:9:{s:11:\"_bubble_new\";s:0:\"\";s:12:\"_bubble_text\";s:0:\"\";s:17:\"_custom_tab_title\";s:0:\"\";s:11:\"_custom_tab\";s:0:\"\";s:14:\"_product_video\";s:0:\"\";s:19:\"_product_video_size\";s:0:\"\";s:24:\"_product_video_placement\";s:0:\"\";s:12:\"_top_content\";s:0:\"\";s:15:\"_bottom_content\";s:0:\"\";}}"),
("472","154","_edit_lock","1539314967:1"),
("473","154","_edit_last","1"),
("639","154","_wp_old_slug","san-pham-5-sao-chep"),
("674","154","_wp_old_slug","san-pham-5");
INSERT INTO wp_postmeta VALUES
("940","1","_edit_lock","1536667727:1"),
("973","259","_edit_last","1"),
("974","259","_edit_lock","1539241137:1"),
("975","259","_footer","normal"),
("976","259","_wp_page_template","page-blank.php"),
("991","259","_thumbnail_id",""),
("992","266","_form","<label> Tên bạn \n  [text* your-name] </label>\n\n<label> Email \n    [email* your-email] </label>\n\n\n\n[submit \"Gửi đi\"]"),
("993","266","_mail","a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:29:\"Email liên hệ từ website\";s:6:\"sender\";s:31:\"[your-name] <bhiuvad@gmail.com>\";s:9:\"recipient\";s:17:\"bhiuvad@gmail.com\";s:4:\"body\";s:88:\"Gửi đến từ: [your-name] <[your-email]>\n\nNội dung thông điệp:\n[your-message]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}"),
("994","266","_mail_2","a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:22:\"admin \"[your-subject]\"\";s:6:\"sender\";s:25:\"admin <bhiuvad@gmail.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:149:\"Nội dung thông điệp:\n[your-message]\n\n-- \nEmail này được gửi đến từ form liên hệ của website admin (http://localhost/wordpress)\";s:18:\"additional_headers\";s:27:\"Reply-To: bhiuvad@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}"),
("995","266","_messages","a:23:{s:12:\"mail_sent_ok\";s:53:\"Xin cảm ơn, form đã được gửi thành công.\";s:12:\"mail_sent_ng\";s:118:\"Có lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\";s:16:\"validation_error\";s:86:\"Có một hoặc nhiều mục nhập có lỗi. Vui lòng kiểm tra và thử lại.\";s:4:\"spam\";s:118:\"Có lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\";s:12:\"accept_terms\";s:67:\"Bạn phải chấp nhận điều khoản trước khi gửi form.\";s:16:\"invalid_required\";s:28:\"Mục này là bắt buộc.\";s:16:\"invalid_too_long\";s:36:\"Nhập quá số kí tự cho phép.\";s:17:\"invalid_too_short\";s:44:\"Nhập ít hơn số kí tự tối thiểu.\";s:12:\"invalid_date\";s:46:\"Định dạng ngày tháng không hợp lệ.\";s:14:\"date_too_early\";s:58:\"Ngày này trước ngày sớm nhất được cho phép.\";s:13:\"date_too_late\";s:54:\"Ngày này quá ngày gần nhất được cho phép.\";s:13:\"upload_failed\";s:36:\"Tải file lên không thành công.\";s:24:\"upload_file_type_invalid\";s:69:\"Bạn không được phép tải lên file theo định dạng này.\";s:21:\"upload_file_too_large\";s:31:\"File kích thước quá lớn.\";s:23:\"upload_failed_php_error\";s:36:\"Tải file lên không thành công.\";s:14:\"invalid_number\";s:38:\"Định dạng số không hợp lệ.\";s:16:\"number_too_small\";s:48:\"Con số nhỏ hơn số nhỏ nhất cho phép.\";s:16:\"number_too_large\";s:48:\"Con số lớn hơn số lớn nhất cho phép.\";s:23:\"quiz_answer_not_correct\";s:30:\"Câu trả lời chưa đúng.\";s:17:\"captcha_not_match\";s:34:\"Bạn đã nhập sai mã CAPTCHA.\";s:13:\"invalid_email\";s:38:\"Địa chỉ e-mail không hợp lệ.\";s:11:\"invalid_url\";s:22:\"URL không hợp lệ.\";s:11:\"invalid_tel\";s:39:\"Số điện thoại không hợp lệ.\";}"),
("996","266","_additional_settings",""),
("997","266","_locale","vi"),
("998","145","_edit_lock","1536472220:1"),
("999","145","_edit_last","1"),
("1000","145","_wp_page_template","default"),
("1001","145","_footer","normal"),
("1011","276","_menu_item_type","post_type"),
("1012","276","_menu_item_menu_item_parent","0"),
("1013","276","_menu_item_object_id","2"),
("1014","276","_menu_item_object","page"),
("1015","276","_menu_item_target",""),
("1016","276","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("1017","276","_menu_item_xfn",""),
("1018","276","_menu_item_url",""),
("1020","2","_edit_lock","1536743781:1"),
("1021","2","_edit_last","1"),
("1022","2","_footer","normal"),
("1024","280","_edit_last","1"),
("1025","280","_footer","normal"),
("1026","280","_wp_page_template","default"),
("1027","280","_edit_lock","1536475363:1"),
("1029","284","_edit_last","1"),
("1030","284","_footer","normal"),
("1031","284","_wp_page_template","default"),
("1032","284","_edit_lock","1539239995:1"),
("1042","287","_menu_item_type","post_type"),
("1043","287","_menu_item_menu_item_parent","0"),
("1044","287","_menu_item_object_id","284"),
("1045","287","_menu_item_object","page"),
("1046","287","_menu_item_target",""),
("1047","287","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("1048","287","_menu_item_xfn",""),
("1049","287","_menu_item_url",""),
("1051","280","_thumbnail_id",""),
("1056","1","_edit_last","1"),
("1060","298","_edit_last","1"),
("1061","298","_edit_lock","1536667776:1"),
("1066","301","_menu_item_type","taxonomy"),
("1067","301","_menu_item_menu_item_parent","0"),
("1068","301","_menu_item_object_id","1"),
("1069","301","_menu_item_object","category"),
("1070","301","_menu_item_target",""),
("1071","301","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("1072","301","_menu_item_xfn",""),
("1073","301","_menu_item_url",""),
("1103","325","_form","<label> Tên của bạn \n    [text your-name] </label>\n\n<label>  Email (bắt buộc)\n    [email* your-email] </label>\n\n<label> Số điện thoại (bắt buộc)\n    [tel* tel-492]</label>\n\n<label> Thông điệp\n    [textarea your-message] </label>\n\n[submit \"Gửi đi\"]"),
("1104","325","_mail","a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:29:\"Email liên hệ từ website\";s:6:\"sender\";s:33:\"[your-name] <duongva91@gmail.com>\";s:9:\"recipient\";s:19:\"duongva91@gmail.com\";s:4:\"body\";s:115:\"Gửi đến từ: [your-name] <[your-email]>\nĐiện thoại: [tel-492]\n\nNội dung thông điệp:\n[your-message]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}"),
("1105","325","_mail_2","a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:22:\"admin \"[your-subject]\"\";s:6:\"sender\";s:32:\"admin <wordpress@125.212.227.39>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:149:\"Nội dung thông điệp:\n[your-message]\n\n-- \nEmail này được gửi đến từ form liên hệ của website admin (http://125.212.227.39/demo)\";s:18:\"additional_headers\";s:27:\"Reply-To: bhiuvad@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}"),
("1106","325","_messages","a:23:{s:12:\"mail_sent_ok\";s:23:\"Đã gửi thành công\";s:12:\"mail_sent_ng\";s:118:\"Có lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\";s:16:\"validation_error\";s:86:\"Có một hoặc nhiều mục nhập có lỗi. Vui lòng kiểm tra và thử lại.\";s:4:\"spam\";s:118:\"Có lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\";s:12:\"accept_terms\";s:67:\"Bạn phải chấp nhận điều khoản trước khi gửi form.\";s:16:\"invalid_required\";s:28:\"Mục này là bắt buộc.\";s:16:\"invalid_too_long\";s:36:\"Nhập quá số kí tự cho phép.\";s:17:\"invalid_too_short\";s:44:\"Nhập ít hơn số kí tự tối thiểu.\";s:12:\"invalid_date\";s:46:\"Định dạng ngày tháng không hợp lệ.\";s:14:\"date_too_early\";s:58:\"Ngày này trước ngày sớm nhất được cho phép.\";s:13:\"date_too_late\";s:54:\"Ngày này quá ngày gần nhất được cho phép.\";s:13:\"upload_failed\";s:36:\"Tải file lên không thành công.\";s:24:\"upload_file_type_invalid\";s:69:\"Bạn không được phép tải lên file theo định dạng này.\";s:21:\"upload_file_too_large\";s:31:\"File kích thước quá lớn.\";s:23:\"upload_failed_php_error\";s:36:\"Tải file lên không thành công.\";s:14:\"invalid_number\";s:38:\"Định dạng số không hợp lệ.\";s:16:\"number_too_small\";s:48:\"Con số nhỏ hơn số nhỏ nhất cho phép.\";s:16:\"number_too_large\";s:48:\"Con số lớn hơn số lớn nhất cho phép.\";s:23:\"quiz_answer_not_correct\";s:30:\"Câu trả lời chưa đúng.\";s:17:\"captcha_not_match\";s:34:\"Bạn đã nhập sai mã CAPTCHA.\";s:13:\"invalid_email\";s:38:\"Địa chỉ e-mail không hợp lệ.\";s:11:\"invalid_url\";s:22:\"URL không hợp lệ.\";s:11:\"invalid_tel\";s:39:\"Số điện thoại không hợp lệ.\";}"),
("1107","325","_additional_settings",""),
("1108","325","_locale","vi"),
("1117","298","_wp_old_slug","tu-van-tiet-ke"),
("1125","1","_wp_old_slug","chao-moi-nguoi"),
("1175","2","_thumbnail_id",""),
("1179","361","_edit_last","1"),
("1180","361","_edit_lock","1536743005:1"),
("1187","361","_wp_page_template","default"),
("1188","361","_footer","normal"),
("1201","361","_thumbnail_id",""),
("1203","284","_thumbnail_id",""),
("1291","444","_edit_last","1"),
("1292","444","_edit_lock","1537199358:1"),
("1293","444","_thumbnail_id",""),
("1297","460","_edit_last","1"),
("1298","460","_edit_lock","1537343383:1"),
("1304","460","_thumbnail_id",""),
("1312","470","_edit_last","1"),
("1313","470","_edit_lock","1539749571:1"),
("1318","473","_edit_last","1"),
("1319","473","_edit_lock","1539749568:1"),
("1322","475","_edit_last","1"),
("1325","475","_edit_lock","1539749507:1"),
("1372","521","_edit_last","1"),
("1373","521","_edit_lock","1538063541:1"),
("1545","640","_edit_last","1"),
("1546","640","_edit_lock","1537713220:1"),
("1571","640","_thumbnail_id",""),
("1609","521","_thumbnail_id",""),
("1619","697","_edit_last","1"),
("1620","697","_edit_lock","1538062517:1"),
("1621","698","_edit_last","1"),
("1622","698","_edit_lock","1539749473:1"),
("1628","701","_edit_last","1"),
("1629","701","_edit_lock","1547271624:1"),
("1787","821","_menu_item_type","post_type"),
("1788","821","_menu_item_menu_item_parent","0"),
("1789","821","_menu_item_object_id","361"),
("1790","821","_menu_item_object","page"),
("1791","821","_menu_item_target",""),
("1792","821","_menu_item_classes","a:1:{i:0;s:0:\"\";}");
INSERT INTO wp_postmeta VALUES
("1793","821","_menu_item_xfn",""),
("1794","821","_menu_item_url",""),
("1799","824","_menu_item_type","taxonomy"),
("1800","824","_menu_item_menu_item_parent","821"),
("1801","824","_menu_item_object_id","17"),
("1802","824","_menu_item_object","product_cat"),
("1803","824","_menu_item_target",""),
("1804","824","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("1805","824","_menu_item_xfn",""),
("1806","824","_menu_item_url",""),
("1807","825","_menu_item_type","taxonomy"),
("1808","825","_menu_item_menu_item_parent","821"),
("1809","825","_menu_item_object_id","21"),
("1810","825","_menu_item_object","product_cat"),
("1811","825","_menu_item_target",""),
("1812","825","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("1813","825","_menu_item_xfn",""),
("1814","825","_menu_item_url",""),
("1815","826","_menu_item_type","taxonomy"),
("1816","826","_menu_item_menu_item_parent","821"),
("1817","826","_menu_item_object_id","22"),
("1818","826","_menu_item_object","product_cat"),
("1819","826","_menu_item_target",""),
("1820","826","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("1821","826","_menu_item_xfn",""),
("1822","826","_menu_item_url",""),
("1830","829","_edit_last","1"),
("1831","829","_edit_lock","1539746627:1"),
("1840","2","_oembed_97120786a5d618011442f73be26e093f","<iframe width=\"1020\" height=\"574\" src=\"https://www.youtube.com/embed/AoPiLg8DZ3A?feature=oembed\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"),
("1841","2","_oembed_time_97120786a5d618011442f73be26e093f","1539154635"),
("2061","871","_variation_description",""),
("2062","871","_sku",""),
("2063","871","_regular_price","3000000"),
("2064","871","_sale_price",""),
("2065","871","_sale_price_dates_from",""),
("2066","871","_sale_price_dates_to",""),
("2067","871","total_sales","0"),
("2068","871","_tax_status","taxable"),
("2069","871","_tax_class","parent"),
("2070","871","_manage_stock","no"),
("2071","871","_backorders","no"),
("2072","871","_sold_individually","no"),
("2073","871","_weight",""),
("2074","871","_length","100"),
("2075","871","_width","200"),
("2076","871","_height","100"),
("2077","871","_upsell_ids","a:0:{}"),
("2078","871","_crosssell_ids","a:0:{}"),
("2079","871","_purchase_note",""),
("2080","871","_default_attributes","a:0:{}"),
("2081","871","_virtual","no"),
("2082","871","_downloadable","no"),
("2083","871","_product_image_gallery",""),
("2084","871","_download_limit","-1"),
("2085","871","_download_expiry","-1"),
("2086","871","_stock",""),
("2087","871","_stock_status","instock"),
("2088","871","_wc_average_rating","0"),
("2089","871","_wc_rating_count","a:0:{}"),
("2090","871","_wc_review_count","0"),
("2091","871","_downloadable_files","a:0:{}"),
("2092","871","attribute_kich-thuoc","1m"),
("2093","871","_price","3000000"),
("2094","871","_product_version","3.4.5"),
("2095","873","_variation_description",""),
("2096","873","_sku",""),
("2097","873","_regular_price","1200000"),
("2098","873","_sale_price",""),
("2099","873","_sale_price_dates_from",""),
("2100","873","_sale_price_dates_to",""),
("2101","873","total_sales","0"),
("2102","873","_tax_status","taxable"),
("2103","873","_tax_class","parent"),
("2104","873","_manage_stock","no"),
("2105","873","_backorders","no"),
("2106","873","_sold_individually","no"),
("2107","873","_weight",""),
("2108","873","_length","120"),
("2109","873","_width","200"),
("2110","873","_height","100"),
("2111","873","_upsell_ids","a:0:{}"),
("2112","873","_crosssell_ids","a:0:{}"),
("2113","873","_purchase_note",""),
("2114","873","_default_attributes","a:0:{}"),
("2115","873","_virtual","no"),
("2116","873","_downloadable","no"),
("2117","873","_product_image_gallery",""),
("2118","873","_download_limit","-1"),
("2119","873","_download_expiry","-1"),
("2120","873","_stock",""),
("2121","873","_stock_status","instock"),
("2122","873","_wc_average_rating","0"),
("2123","873","_wc_rating_count","a:0:{}"),
("2124","873","_wc_review_count","0"),
("2125","873","_downloadable_files","a:0:{}"),
("2126","873","attribute_kich-thuoc","2m"),
("2127","873","_price","1200000"),
("2128","873","_product_version","3.4.5"),
("2129","874","_variation_description",""),
("2130","874","_sku","");
INSERT INTO wp_postmeta VALUES
("2131","874","_regular_price","1500000"),
("2132","874","_sale_price",""),
("2133","874","_sale_price_dates_from",""),
("2134","874","_sale_price_dates_to",""),
("2135","874","total_sales","0"),
("2136","874","_tax_status","taxable"),
("2137","874","_tax_class","parent"),
("2138","874","_manage_stock","no"),
("2139","874","_backorders","no"),
("2140","874","_sold_individually","no"),
("2141","874","_weight",""),
("2142","874","_length","140"),
("2143","874","_width","200"),
("2144","874","_height","100"),
("2145","874","_upsell_ids","a:0:{}"),
("2146","874","_crosssell_ids","a:0:{}"),
("2147","874","_purchase_note",""),
("2148","874","_default_attributes","a:0:{}"),
("2149","874","_virtual","no"),
("2150","874","_downloadable","no"),
("2151","874","_product_image_gallery",""),
("2152","874","_download_limit","-1"),
("2153","874","_download_expiry","-1"),
("2154","874","_stock",""),
("2155","874","_stock_status","instock"),
("2156","874","_wc_average_rating","0"),
("2157","874","_wc_rating_count","a:0:{}"),
("2158","874","_wc_review_count","0"),
("2159","874","_downloadable_files","a:0:{}"),
("2160","874","attribute_kich-thuoc","3m"),
("2161","874","_price","1500000"),
("2162","874","_product_version","3.4.5"),
("2165","154","_price","1200000"),
("2166","154","_price","1500000"),
("2167","154","_price","3000000"),
("2168","154","_regular_price","3000000"),
("2169","154","_sale_price",""),
("2170","154","_wp_old_slug","san-pham-4-2"),
("2171","875","_sku",""),
("2174","875","_sale_price_dates_from",""),
("2175","875","_sale_price_dates_to",""),
("2176","875","total_sales","0"),
("2177","875","_tax_status","taxable"),
("2178","875","_tax_class",""),
("2179","875","_manage_stock","no"),
("2180","875","_backorders","no"),
("2181","875","_sold_individually","no"),
("2182","875","_weight",""),
("2183","875","_length",""),
("2184","875","_width",""),
("2185","875","_height",""),
("2186","875","_upsell_ids","a:0:{}"),
("2187","875","_crosssell_ids","a:0:{}"),
("2188","875","_purchase_note",""),
("2189","875","_default_attributes","a:1:{s:10:\"kich-thuoc\";s:2:\"2m\";}"),
("2190","875","_virtual","no"),
("2191","875","_downloadable","no"),
("2192","875","_product_image_gallery",""),
("2193","875","_download_limit","-1"),
("2194","875","_download_expiry","-1"),
("2196","875","_stock",""),
("2197","875","_stock_status","instock"),
("2198","875","_wc_average_rating","0"),
("2199","875","_wc_rating_count","a:0:{}"),
("2200","875","_wc_review_count","0"),
("2201","875","_downloadable_files","a:0:{}"),
("2202","875","_product_attributes","a:1:{s:10:\"kich-thuoc\";a:6:{s:4:\"name\";s:14:\"Kích thước\";s:5:\"value\";s:16:\"2m | 2.2m | 2.5m\";s:8:\"position\";i:0;s:10:\"is_visible\";i:0;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}"),
("2203","875","_product_version","3.4.5"),
("2204","875","wc_productdata_options","a:1:{i:0;a:9:{s:11:\"_bubble_new\";s:0:\"\";s:12:\"_bubble_text\";s:0:\"\";s:17:\"_custom_tab_title\";s:0:\"\";s:11:\"_custom_tab\";s:0:\"\";s:14:\"_product_video\";s:0:\"\";s:19:\"_product_video_size\";s:0:\"\";s:24:\"_product_video_placement\";s:0:\"\";s:12:\"_top_content\";s:0:\"\";s:15:\"_bottom_content\";s:0:\"\";}}"),
("2205","876","_variation_description",""),
("2206","876","_sku",""),
("2207","876","_regular_price","3000000"),
("2208","876","_sale_price",""),
("2209","876","_sale_price_dates_from",""),
("2210","876","_sale_price_dates_to",""),
("2211","876","total_sales","0"),
("2212","876","_tax_status","taxable"),
("2213","876","_tax_class","parent"),
("2214","876","_manage_stock","no"),
("2215","876","_backorders","no"),
("2216","876","_sold_individually","no"),
("2217","876","_weight",""),
("2218","876","_length","100"),
("2219","876","_width","200"),
("2220","876","_height","100"),
("2221","876","_upsell_ids","a:0:{}"),
("2222","876","_crosssell_ids","a:0:{}"),
("2223","876","_purchase_note",""),
("2224","876","_default_attributes","a:0:{}"),
("2225","876","_virtual","no"),
("2226","876","_downloadable","no"),
("2227","876","_product_image_gallery",""),
("2228","876","_download_limit","-1"),
("2229","876","_download_expiry","-1"),
("2230","876","_stock",""),
("2231","876","_stock_status","instock"),
("2232","876","_wc_average_rating","0"),
("2233","876","_wc_rating_count","a:0:{}"),
("2234","876","_wc_review_count","0"),
("2235","876","_downloadable_files","a:0:{}");
INSERT INTO wp_postmeta VALUES
("2236","876","attribute_kich-thuoc","2m"),
("2237","876","_price","3000000"),
("2238","876","_product_version","3.4.5"),
("2239","877","_variation_description",""),
("2240","877","_sku",""),
("2241","877","_regular_price","1200000"),
("2242","877","_sale_price",""),
("2243","877","_sale_price_dates_from",""),
("2244","877","_sale_price_dates_to",""),
("2245","877","total_sales","0"),
("2246","877","_tax_status","taxable"),
("2247","877","_tax_class","parent"),
("2248","877","_manage_stock","no"),
("2249","877","_backorders","no"),
("2250","877","_sold_individually","no"),
("2251","877","_weight",""),
("2252","877","_length","120"),
("2253","877","_width","200"),
("2254","877","_height","100"),
("2255","877","_upsell_ids","a:0:{}"),
("2256","877","_crosssell_ids","a:0:{}"),
("2257","877","_purchase_note",""),
("2258","877","_default_attributes","a:0:{}"),
("2259","877","_virtual","no"),
("2260","877","_downloadable","no"),
("2261","877","_product_image_gallery",""),
("2262","877","_download_limit","-1"),
("2263","877","_download_expiry","-1"),
("2264","877","_stock",""),
("2265","877","_stock_status","instock"),
("2266","877","_wc_average_rating","0"),
("2267","877","_wc_rating_count","a:0:{}"),
("2268","877","_wc_review_count","0"),
("2269","877","_downloadable_files","a:0:{}"),
("2270","877","attribute_kich-thuoc","2.2m"),
("2271","877","_price","1200000"),
("2272","877","_product_version","3.4.5"),
("2273","878","_variation_description",""),
("2274","878","_sku",""),
("2275","878","_regular_price","1500000"),
("2276","878","_sale_price",""),
("2277","878","_sale_price_dates_from",""),
("2278","878","_sale_price_dates_to",""),
("2279","878","total_sales","0"),
("2280","878","_tax_status","taxable"),
("2281","878","_tax_class","parent"),
("2282","878","_manage_stock","no"),
("2283","878","_backorders","no"),
("2284","878","_sold_individually","no"),
("2285","878","_weight",""),
("2286","878","_length","140"),
("2287","878","_width","200"),
("2288","878","_height","100"),
("2289","878","_upsell_ids","a:0:{}"),
("2290","878","_crosssell_ids","a:0:{}"),
("2291","878","_purchase_note",""),
("2292","878","_default_attributes","a:0:{}"),
("2293","878","_virtual","no"),
("2294","878","_downloadable","no"),
("2295","878","_product_image_gallery",""),
("2296","878","_download_limit","-1"),
("2297","878","_download_expiry","-1"),
("2298","878","_stock",""),
("2299","878","_stock_status","instock"),
("2300","878","_wc_average_rating","0"),
("2301","878","_wc_rating_count","a:0:{}"),
("2302","878","_wc_review_count","0"),
("2303","878","_downloadable_files","a:0:{}"),
("2304","878","attribute_kich-thuoc","2.5m"),
("2305","878","_price","1500000"),
("2306","878","_product_version","3.4.5"),
("2312","875","_edit_lock","1539315467:1"),
("2313","875","_edit_last","1"),
("2319","875","_price","1200000"),
("2320","875","_price","1500000"),
("2321","875","_price","3000000"),
("2322","875","_regular_price",""),
("2323","875","_sale_price",""),
("2340","885","_wp_attached_file","2018/10/freelancerviet.png"),
("2341","885","_wp_attachment_metadata","a:5:{s:5:\"width\";i:180;s:6:\"height\";i:35;s:4:\"file\";s:26:\"2018/10/freelancerviet.png\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"freelancerviet-150x35.png\";s:5:\"width\";i:150;s:6:\"height\";i:35;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:25:\"freelancerviet-100x35.png\";s:5:\"width\";i:100;s:6:\"height\";i:35;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:25:\"freelancerviet-100x35.png\";s:5:\"width\";i:100;s:6:\"height\";i:35;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}"),
("2342","886","_wp_attached_file","2018/10/cropped-freelancerviet.png"),
("2343","886","_wp_attachment_context","site-icon"),
("2344","886","_wp_attachment_metadata","a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:34:\"2018/10/cropped-freelancerviet.png\";s:5:\"sizes\";a:12:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:34:\"cropped-freelancerviet-247x296.png\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-510x510.png\";s:5:\"width\";i:510;s:6:\"height\";i:510;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-247x296.png\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-510x510.png\";s:5:\"width\";i:510;s:6:\"height\";i:510;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:34:\"cropped-freelancerviet-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:32:\"cropped-freelancerviet-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}"),
("2349","890","_wp_attached_file","2018/10/layers-2.svg"),
("2350","890","_flatsome_studio_id","9368"),
("2351","891","_wp_attached_file","2018/10/O6DXT80-1024x1024.jpg"),
("2352","891","_wp_attachment_metadata","a:5:{s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:4:\"file\";s:29:\"2018/10/O6DXT80-1024x1024.jpg\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-247x296.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-510x510.jpg\";s:5:\"width\";i:510;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-247x296.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-510x510.jpg\";s:5:\"width\";i:510;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:29:\"O6DXT80-1024x1024-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}"),
("2353","891","_flatsome_studio_id","9786"),
("2354","892","_wp_attached_file","2018/10/play-button.svg"),
("2355","892","_flatsome_studio_id","9849"),
("2356","893","_wp_attached_file","2018/10/wifi.svg"),
("2357","893","_flatsome_studio_id","9850"),
("2358","894","_wp_attached_file","2018/10/share.svg"),
("2359","894","_flatsome_studio_id","9851"),
("2360","895","_wp_attached_file","2018/10/settings.svg"),
("2361","895","_flatsome_studio_id","9852"),
("2362","896","_wp_attached_file","2018/10/cloud.svg"),
("2363","896","_flatsome_studio_id","9853"),
("2376","903","_wp_attached_file","2018/10/background.jpg"),
("2377","903","_wp_attachment_metadata","a:5:{s:5:\"width\";i:1380;s:6:\"height\";i:920;s:4:\"file\";s:22:\"2018/10/background.jpg\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"background-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"background-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"background-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"background-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:22:\"background-247x296.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:22:\"background-510x340.jpg\";s:5:\"width\";i:510;s:6:\"height\";i:340;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:22:\"background-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:22:\"background-247x296.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:22:\"background-510x340.jpg\";s:5:\"width\";i:510;s:6:\"height\";i:340;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:22:\"background-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"1.4\";s:6:\"credit\";s:24:\"Getty Images/iStockphoto\";s:6:\"camera\";s:11:\"NIKON D800E\";s:7:\"caption\";s:42:\"Close-up image of coder typing on computer\";s:17:\"created_timestamp\";s:10:\"1459866716\";s:9:\"copyright\";s:12:\"DragonImages\";s:12:\"focal_length\";s:2:\"35\";s:3:\"iso\";s:3:\"400\";s:13:\"shutter_speed\";s:4:\"0.05\";s:5:\"title\";s:22:\"Developing new program\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:25:{i:0;s:19:\"Wireless Technology\";i:1;s:8:\"Computer\";i:2;s:18:\"Information Medium\";i:3;s:12:\"Input Device\";i:4;s:3:\"Men\";i:5;s:7:\"Glowing\";i:6;s:9:\"Searching\";i:7;s:6:\"Coding\";i:8;s:17:\"Computer Language\";i:9;s:19:\"Computer Programmer\";i:10;s:6:\"Typing\";i:11;s:6:\"Keypad\";i:12;s:15:\"Focus - Concept\";i:13;s:4:\"Dark\";i:14;s:10:\"Technology\";i:15;s:8:\"Close-up\";i:16;s:12:\"Human Finger\";i:17;s:10:\"Human Hand\";i:18;s:8:\"Engineer\";i:19;s:5:\"Night\";i:20;s:8:\"Internet\";i:21;s:17:\"Computer Software\";i:22;s:2:\"PC\";i:23;s:4:\"Data\";i:24;s:10:\"Overworked\";}}}");
INSERT INTO wp_postmeta VALUES
("2406","929","_wp_attached_file","2018/10/banner1.jpg"),
("2407","929","_wp_attachment_metadata","a:5:{s:5:\"width\";i:1024;s:6:\"height\";i:586;s:4:\"file\";s:19:\"2018/10/banner1.jpg\";s:5:\"sizes\";a:10:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"banner1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"banner1-300x172.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:172;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:19:\"banner1-768x440.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:440;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:20:\"banner1-1024x586.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:586;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:19:\"banner1-247x296.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:19:\"banner1-510x292.jpg\";s:5:\"width\";i:510;s:6:\"height\";i:292;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:19:\"banner1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:19:\"banner1-247x296.jpg\";s:5:\"width\";i:247;s:6:\"height\";i:296;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:19:\"banner1-510x292.jpg\";s:5:\"width\";i:510;s:6:\"height\";i:292;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:19:\"banner1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}"),
("2408","10","_thumbnail_id",""),
("2443","701","_wp_old_slug","ban-lanh-dao-cong-ty-ghach-secoin__trashed"),
("2446","698","_wp_old_slug","hdqt-cong-ty-co-phan-y-duoc-tan-truong-sinh__trashed"),
("2449","475","_wp_old_slug","cach-sap-xep-van-phong-theo-phong-thuy-dem-lai-nhieu-may-man-va-tai-loc__trashed"),
("2452","473","_wp_old_slug","cach-chon-cong-ty-thiet-ke-van-phong-chuyen-nghiep-vua-y__trashed"),
("2455","470","_wp_old_slug","4-ly-do-nen-thue-thiet-ke-va-thi-cong-noi-that-van-phong-tron-goi__trashed"),
("2471","701","_thumbnail_id","929"),
("2474","698","_thumbnail_id","903"),
("2477","475","_thumbnail_id","891"),
("2480","473","_thumbnail_id","929"),
("2485","470","_thumbnail_id","903"),
("2488","948","_menu_item_type","custom"),
("2489","948","_menu_item_menu_item_parent","0"),
("2490","948","_menu_item_object_id","948"),
("2491","948","_menu_item_object","custom"),
("2492","948","_menu_item_target",""),
("2493","948","_menu_item_classes","a:1:{i:0;s:0:\"\";}"),
("2494","948","_menu_item_xfn",""),
("2495","948","_menu_item_url","#"),
("2496","948","_menu_item_orphaned","1542188602");




CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_posts VALUES
("1","1","2018-09-03 15:02:35","2018-09-03 15:02:35","Nếu bạn không thể sở hữu một căn hộ lớn và sang trọng, cũng đừng quá lo lắng bởi có nhiều giải pháp khiến căn hộ nhỏ trở lên rộng hơn so với diện tích thực tế.","10 chiếc bàn ăn thông minh cho căn hộ nhỏ","","publish","open","open","","10-chiec-ban-an-thong-minh-cho-can-ho-nho","","","2018-09-11 12:10:40","2018-09-11 12:10:40","","0","http://localhost/wordpress/?p=1","0","post","","0"),
("2","1","2018-09-03 15:02:35","2018-09-03 15:02:35","[ux_banner height=\"340px\" bg=\"903\" bg_color=\"rgba(237, 237, 237, 0.98)\" bg_overlay=\"rgba(133, 133, 133, 0.48)\" bg_pos=\"40% 52%\"]\n\n[text_box width__sm=\"60\" position_x=\"50\" position_y=\"50\"]\n\n<h3 class=\"uppercase\"><strong>Về chúng tôi<br /></strong></h3>\n<p>freelancerviet.net</p>\n\n[/text_box]\n\n[/ux_banner]\n[section padding=\"15px\"]\n\n[gap height=\"55px\"]\n\n[row h_align=\"center\"]\n\n[col span=\"4\" span__sm=\"10\" align=\"center\"]\n\n<h3><span style=\"font-size: 100%;\">DỊCH VỤ<br /></span></h3>\n<p>Thiết kế website.<br />Thiết kế giao diện, logo.<br />Gia công mobile app.<br />Viết bài, quản trị website, fanpage.<br />Chạy quảng cáo Facebook, Google</p>\n\n[/col]\n[col span=\"4\" span__sm=\"10\" align=\"center\"]\n\n<h3 class=\"uppercase\">XỨ MỆNH</h3>\n<p>Không chỉ giúp bạn hoàn thành yêu cầu đê ra chúng tôi còn tư vấn để bạn tìm được phương án tốt nhất.</p>\n\n[/col]\n[col span=\"4\" span__sm=\"10\" align=\"center\"]\n\n<h3 class=\"uppercase\"><span style=\"font-size: 100%;\">UY TÍN<br /></span></h3>\n<p>Quan điểm của chúng tôi là giúp khách hàng đạt được kết quả tốt nhất qua đó sự thành công của khách hàng sẽ đem đến nhiều lợi nhuận hơn và sự hợp tác lâu dài với chúng ôti.</p>\n\n[/col]\n\n[/row]\n\n[/section]\n[block id=\"829\"]","gioi thieu","","publish","closed","open","","gioi-thieu","","","2018-10-17 03:23:16","2018-10-17 03:23:16","","0","http://localhost/wordpress/?page_id=2","0","page","","0"),
("3","1","2018-09-03 15:02:35","2018-09-03 15:02:35","<h2>Chúng tôi là ai</h2><p>Địa chỉ website là: http://localhost/wordpress.</p><h2>Thông tin cá nhân nào bị thu thập và tại sao thu thập</h2><h3>Bình luận</h3><p>Khi khách truy cập để lại bình luận trên trang web, chúng tôi thu thập dữ liệu được hiển thị trong biểu mẫu bình luận và cũng là địa chỉ IP của người truy cập và chuỗi user agent của người dùng trình duyệt để giúp phát hiện spam</p><p>Một chuỗi ẩn danh được tạo từ địa chỉ email của bạn (còn được gọi là hash) có thể được cung cấp cho dịch vụ Gravatar để xem bạn có đang sử dụng nó hay không. Chính sách bảo mật của dịch vụ Gravatar có tại đây: https://automattic.com/privacy/. Sau khi chấp nhận bình luận của bạn, ảnh tiểu sử của bạn được hiển thị công khai trong ngữ cảnh bình luận của bạn.</p><h3>Thư viện</h3><p>Nếu bạn tải hình ảnh lên trang web, bạn nên tránh tải lên hình ảnh có dữ liệu vị trí được nhúng (EXIF GPS) đi kèm. Khách truy cập vào trang web có thể tải xuống và giải nén bất kỳ dữ liệu vị trí nào từ hình ảnh trên trang web.</p><h3>Thông tin liên hệ</h3><h3>Cookies</h3><p>Nếu bạn viết bình luận trong website, bạn có thể cung cấp cần nhập tên, email địa chỉ website trong cookie. Các thông tin này nhằm giúp bạn không cần nhập thông tin nhiều lần khi viết bình luận khác. Cookie này sẽ được lưu giữ trong một năm.</p><p>Nếu bạn có tài khoản và đăng nhập và website, chúng tôi sẽ thiết lập một cookie tạm thời để xác định nếu trình duyệt cho phép sử dụng cookie. Cookie này không bao gồm thông tin cá nhân và sẽ được gỡ bỏ khi bạn đóng trình duyệt.</p><p>Khi bạn đăng nhập, chúng tôi sẽ thiết lập một vài cookie để lưu thông tin đăng nhập và lựa chọn hiển thị. Thông tin đăng nhập gần nhất lưu trong hai ngày, và lựa chọn hiển thị gần nhất lưu trong một năm. Nếu bạn chọn &quot;Nhớ tôi&quot;, thông tin đăng nhập sẽ được lưu trong hai tuần. Nếu bạn thoát tài khoản, thông tin cookie đăng nhập sẽ bị xoá.</p><p>Nếu bạn sửa hoặc công bố bài viết, một bản cookie bổ sung sẽ được lưu trong trình duyệt. Cookie này không chứa thông tin cá nhân và chỉ đơn giản bao gồm ID của bài viết bạn đã sửa. Nó tự động hết hạn sau 1 ngày.</p><h3>Nội dung nhúng từ website khác</h3><p>Các bài viết trên trang web này có thể bao gồm nội dung được nhúng (ví dụ: video, hình ảnh, bài viết, v.v.). Nội dung được nhúng từ các trang web khác hoạt động theo cùng một cách chính xác như khi khách truy cập đã truy cập trang web khác.</p><p>Những website này có thể thu thập dữ liệu về bạn, sử dụng cookie, nhúng các trình theo dõi của bên thứ ba và giám sát tương tác của bạn với nội dung được nhúng đó, bao gồm theo dõi tương tác của bạn với nội dung được nhúng nếu bạn có tài khoản và đã đăng nhập vào trang web đó.</p><h3>Phân tích</h3><h2>Chúng tôi chia sẻ dữ liệu của bạn với ai</h2><h2>Dữ liệu của bạn tồn tại bao lâu</h2><p>Nếu bạn để lại bình luận, bình luận và siêu dữ liệu của nó sẽ được giữ lại vô thời hạn. Điều này là để chúng tôi có thể tự động nhận ra và chấp nhận bất kỳ bình luận nào thay vì giữ chúng trong khu vực đợi kiểm duyệt.</p><p>Đối với người dùng đăng ký trên trang web của chúng tôi (nếu có), chúng tôi cũng lưu trữ thông tin cá nhân mà họ cung cấp trong hồ sơ người dùng của họ. Tất cả người dùng có thể xem, chỉnh sửa hoặc xóa thông tin cá nhân của họ bất kỳ lúc nào (ngoại trừ họ không thể thay đổi tên người dùng của họ). Quản trị viên trang web cũng có thể xem và chỉnh sửa thông tin đó.</p><h2>Các quyền nào của bạn với dữ liệu của mình</h2><p>Nếu bạn có tài khoản trên trang web này hoặc đã để lại nhận xét, bạn có thể yêu cầu nhận tệp xuất dữ liệu cá nhân mà chúng tôi lưu giữ về bạn, bao gồm mọi dữ liệu bạn đã cung cấp cho chúng tôi. Bạn cũng có thể yêu cầu chúng tôi xóa mọi dữ liệu cá nhân mà chúng tôi lưu giữ về bạn. Điều này không bao gồm bất kỳ dữ liệu nào chúng tôi có nghĩa vụ giữ cho các mục đích hành chính, pháp lý hoặc bảo mật.</p><h2>Các dữ liệu của bạn được gửi tới đâu</h2><p>Các bình luận của khách (không phải là thành viên) có thể được kiểm tra thông qua dịch vụ tự động phát hiện spam.</p><h2>Thông tin liên hệ của bạn</h2><h2>Thông tin bổ sung</h2><h3>Cách chúng tôi bảo vệ dữ liệu của bạn</h3><h3>Các quá trình tiết lộ dữ liệu mà chúng tôi thực hiện</h3><h3>Những bên thứ ba chúng tôi nhận dữ liệu từ đó</h3><h3>Việc quyết định và/hoặc thu thập thông tin tự động mà chúng tôi áp dụng với dữ liệu người dùng</h3><h3>Các yêu cầu công bố thông tin được quản lý</h3>","Chính sách bảo mật","","draft","closed","open","","chinh-sach-bao-mat","","","2018-09-03 15:02:35","2018-09-03 15:02:35","","0","http://localhost/wordpress/?page_id=3","0","page","","0"),
("10","1","2018-09-03 16:00:34","2018-09-03 16:00:34","[ux_slider]\n\n[ux_banner height=\"40%\" bg=\"929\" bg_size=\"original\" bg_overlay=\"rgba(0, 0, 0, 0.17)\"]\n\n[text_box position_x=\"50\" position_y=\"50\"]\n\n<h3 class=\"uppercase\">Dịch vụ</h3>\n<p>Uy tín - chất lượng.</p>\n[button text=\"Đặt hàng ngay\" color=\"white\" style=\"outline\"]\n\n\n[/text_box]\n\n[/ux_banner]\n[ux_banner height=\"40%\" youtube=\"Q6pGMuyP4rU\"]\n\n\n[/ux_banner]\n\n[/ux_slider]\n[ux_banner height=\"100%\" bg=\"903\" bg_overlay=\"rgba(0, 0, 0, 0.69)\" bg_pos=\"0% 28%\"]\n\n[text_box width=\"51\" position_x=\"50\" position_y=\"50\"]\n\n<h2 class=\"uppercase\"><strong>Chúng tôi là ai<br /></strong></h2>\n<p><span style=\"font-size: 80%;\">freelancerviet.net</span></p>\n[divider align=\"center\" margin=\"0.3em\"]\n\n<p class=\"uppercase\"><span style=\"font-size: 90%;\">Nhóm làm việc tự do, nhận hoàn thành công việc theo yêu cầu.</span></p>\n<p><span style=\"font-size: 85%;\">Chúng tôi là một nhóm các lập trình viên, designer, có người làm tự do toàn thời gian, có người đang làm trong rảnh rỗi.</span></p>\n[gap height=\"20px\"]\n\n\n[/text_box]\n\n[/ux_banner]\n[section bg=\"891\" bg_overlay=\"rgba(78, 93, 162, 0.83)\"]\n\n[row h_align=\"center\"]\n\n[col span=\"10\" span__sm=\"12\"]\n\n[gap height=\"40px\"]\n\n[row_inner h_align=\"center\"]\n\n[col_inner span=\"6\" span__sm=\"9\" align=\"center\" color=\"light\"]\n\n<h1><span style=\"font-size: 140%;\">DỊCH VỤ<br /></span></h1>\n<p><span style=\"font-size: 100%;\">Các dự án về công nghệ, online marketing</span></p>\n\n[/col_inner]\n\n[/row_inner]\n[gap height=\"8px\"]\n\n[row_inner style=\"large\" h_align=\"center\"]\n\n[col_inner span=\"4\" span__sm=\"9\" padding=\"40px 20px 50px 20px\" align=\"center\" bg_color=\"rgb(240, 240, 240)\" color=\"light\"]\n\n[featured_box img=\"890\" pos=\"center\" icon_color=\"rgba(48, 62, 128, 0.85)\"]\n\n<h3 style=\"text-align: center;\"><span style=\"font-size: 85%; color: #303e80;\">Thiết kế website<br /></span></h3>\n\n[/featured_box]\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"9\" padding=\"40px 20px 50px 20px\" bg_color=\"rgba(48, 62, 128, 0.85)\" color=\"light\"]\n\n[featured_box img=\"894\" pos=\"center\"]\n\n<h3 style=\"text-align: center;\"><span style=\"font-size: 85%;\">Mobile app</span></h3>\n\n[/featured_box]\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"9\" padding=\"40px 20px 50px 20px\" bg_color=\"rgb(240, 240, 240)\" color=\"light\"]\n\n[featured_box img=\"892\" pos=\"center\" icon_color=\"rgba(48, 62, 128, 0.85)\"]\n\n<h3 style=\"text-align: center;\"><span style=\"font-size: 85%; color: #303e80;\">Thiết kế giao diện</span></h3>\n\n[/featured_box]\n\n[/col_inner]\n\n[/row_inner]\n[gap]\n\n[row_inner style=\"large\" h_align=\"center\"]\n\n[col_inner span=\"4\" span__sm=\"9\" padding=\"40px 20px 50px 20px\" bg_color=\"rgba(48, 62, 128, 0.85)\" color=\"light\"]\n\n[featured_box img=\"895\" pos=\"center\"]\n\n<h3 style=\"text-align: center;\"><span style=\"font-size: 85%;\">Cung cấp quản trị hosting</span></h3>\n\n[/featured_box]\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"9\" padding=\"40px 20px 50px 20px\" bg_color=\"rgb(240, 240, 240)\" color=\"light\"]\n\n[featured_box img=\"896\" pos=\"center\" icon_color=\"rgba(48, 62, 128, 0.85)\"]\n\n<h3 style=\"text-align: center;\"><span style=\"font-size: 85%; color: #303e80;\">Chạy Ads</span></h3>\n\n[/featured_box]\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"9\" padding=\"40px 20px 50px 20px\" bg_color=\"rgba(48, 62, 128, 0.85)\" color=\"light\"]\n\n[featured_box img=\"893\" pos=\"center\"]\n\n<h3 style=\"text-align: center;\"><span style=\"font-size: 85%;\">Viết content</span></h3>\n\n[/featured_box]\n\n[/col_inner]\n\n[/row_inner]\n\n[/col]\n\n[/row]\n[row h_align=\"center\"]\n\n[col span=\"3\" span__sm=\"12\" align=\"center\" color=\"light\"]\n\n[button text=\"view all\" color=\"white\" style=\"outline\"]\n\n\n[/col]\n\n[/row]\n\n[/section]","trang chu","","publish","closed","closed","","trang-chu","","","2018-10-17 04:02:09","2018-10-17 04:02:09","","0","http://localhost/wordpress/?page_id=10","0","page","","0"),
("23","1","2018-09-04 07:01:50","2018-09-04 07:01:50","http://localhost/wordpress/wp-content/uploads/2018/09/cropped-photo.jpg","cropped-photo.jpg","","inherit","open","closed","","cropped-photo-jpg","","","2018-09-04 07:01:50","2018-09-04 07:01:50","","0","http://localhost/wordpress/wp-content/uploads/2018/09/cropped-photo.jpg","0","attachment","image/jpeg","0"),
("67","1","2018-09-04 15:30:06","2018-09-04 15:30:06","","Trang chủ","","publish","closed","closed","","thi-cong-noi-that","","","2018-10-15 15:50:36","2018-10-15 15:50:36","","0","http://localhost/wordpress/?p=67","1","nav_menu_item","","0"),
("145","1","2018-09-05 14:42:14","2018-09-05 14:42:14","","Sản Phẩm","","publish","closed","closed","","cua-hang","","","2018-09-09 05:52:36","2018-09-09 05:52:36","","0","http://localhost/wordpress/cua-hang/","0","page","","0"),
("146","1","2018-09-05 14:42:14","2018-09-05 14:42:14","[woocommerce_cart]","Giỏ hàng","","publish","closed","closed","","gio-hang","","","2018-09-05 14:42:14","2018-09-05 14:42:14","","0","http://localhost/wordpress/gio-hang/","0","page","","0"),
("147","1","2018-09-05 14:42:14","2018-09-05 14:42:14","[woocommerce_checkout]","Thanh toán","","publish","closed","closed","","thanh-toan","","","2018-09-05 14:42:14","2018-09-05 14:42:14","","0","http://localhost/wordpress/thanh-toan/","0","page","","0"),
("148","1","2018-09-05 14:42:14","2018-09-05 14:42:14","[woocommerce_my_account]","Tài khoản","","publish","closed","closed","","tai-khoan","","","2018-09-05 14:42:14","2018-09-05 14:42:14","","0","http://localhost/wordpress/tai-khoan/","0","page","","0"),
("149","1","2018-09-05 14:48:42","2018-09-05 14:48:42","","Order &ndash; Tháng Chín 5, 2018 @ 02:48 Chiều","","wc-processing","open","closed","order_5b8fecca50522","don-hang-sep-05-2018-0248-pm","","","2018-09-05 14:48:43","2018-09-05 14:48:43","","0","http://localhost/wordpress/?post_type=shop_order&#038;p=149","0","shop_order","","1"),
("154","1","2018-09-05 14:53:20","2018-09-05 14:53:20","mo ta san pham","Bàn phòng khách","day la cai ban","publish","open","closed","","ban-phong-khach","","","2018-10-12 03:31:32","2018-10-12 03:31:32","","0","http://localhost/wordpress/?post_type=product&#038;p=154","0","product","","0"),
("259","1","2018-09-08 09:06:45","2018-09-08 09:06:45","[row]\n\n[col span=\"8\" span__sm=\"12\"]\n\n[title style=\"center\" text=\"Dịch vụ tư vấn thiết kế nội thất\" color=\"rgb(68, 158, 52)\" size=\"143\"]\n\n[divider align=\"center\" width=\"200px\" height=\"0.5px\" margin=\"1.2em\" color=\"rgb(32, 113, 26)\"]\n\n[row_inner]\n\n[col_inner span__sm=\"12\"]\n\n<p style=\"color:black\">Tư vấn thiết kế nội thất văn phòng công ty, phòng làm việc đòi hỏi tính chuyên môn cao nhưng nó yêu cầu cao hơn trong việc bố trí nội thất nhằm đem lại một không gian làm việc hiệu quả, gia tăng sự sáng tạo, thu hút nhân tài, nâng cao hiệu quả Hợp tác & Kinh Doanh hỗ trợ tuyệt vời hình ảnh thương hiệu uy tín & sức mạnh của Doanh nghiệp.</p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span__sm=\"12\"]\n\n[ux_image id=\"188\"]\n\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span__sm=\"12\"]\n\n<p style=\"color:black\">Tư vấn thiết kế nội thất văn phòng công ty, phòng làm việc đòi hỏi tính chuyên môn cao nhưng nó yêu cầu cao hơn trong việc bố trí nội thất nhằm đem lại một không gian làm việc hiệu quả, gia tăng sự sáng tạo, thu hút nhân tài, nâng cao hiệu quả Hợp tác & Kinh Doanh hỗ trợ tuyệt vời hình ảnh thương hiệu uy tín & sức mạnh của Doanh nghiệp. </p>\n\n[/col_inner]\n\n[/row_inner]\n[title text=\"Xem thêm\" color=\"rgb(68, 158, 52)\"]\n\n[ux_slider nav_pos=\"outside\" arrows=\"false\" nav_style=\"simple\" nav_color=\"dark\" bullet_style=\"simple\" timer=\"4000\"]\n\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"104\" image_size=\"original\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"101\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"81\" height=\"56.25%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"89\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"27\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"101\" height=\"56.25%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"254\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"262\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"100\" height=\"56.25%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"81\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"80\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"331\" height=\"56.25%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n\n[/ux_slider]\n[title text=\"Tư Vấn Nâng Cao\" color=\"rgb(68, 158, 52)\"]\n\n[ux_slider nav_pos=\"outside\" arrows=\"false\" nav_color=\"dark\" bullet_style=\"simple\" timer=\"4000\"]\n\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"31\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"28\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"32\" height=\"56.25%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"30\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"91\" height=\"56.25%\"]\n\n\n[/col_inner]\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"335\" height=\"56.25%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n\n[/ux_slider]\n[title text=\"công ty thiết kế nội thất newhouse\" color=\"rgb(68, 158, 52)\"]\n\n<p><b></p>\n<p style=\"padding-left:0%\">Showroom 1: Số 2 Nhà A2 - 39 Pháo Đài Láng - Đống Đa - Hà Nội (Khu TT Phụ nữ Trung ương)<br />\nTell: (84.24)32 595 863/ 62 760 350<br />\nWebsite: http://www.noithatnhamoi.vn<br />\nEmail:nhamoidogo@gmail.com</p>\n<p></b></p>\n[follow style=\"fill\" align=\"left\" scale=\"91\" facebook=\"1\" instagram=\"1\" twitter=\"1\" googleplus=\"1\" youtube=\"1\"]\n\n\n[/col]\n[col span=\"4\" span__sm=\"12\"]\n\n[block id=\"444\"]\n\n\n[/col]\n\n[/row]","Tư Vấn","","publish","closed","closed","","tu-van","","","2018-10-11 07:11:51","2018-10-11 07:11:51","","0","http://localhost/wordpress/?page_id=259","0","page","","0"),
("266","1","2018-09-08 13:21:21","2018-09-08 13:21:21","<label> Tên bạn \n  [text* your-name] </label>\n\n<label> Email \n    [email* your-email] </label>\n\n\n\n[submit \"Gửi đi\"]\n1\nEmail liên hệ từ website\n[your-name] <bhiuvad@gmail.com>\nbhiuvad@gmail.com\nGửi đến từ: [your-name] <[your-email]>\n\nNội dung thông điệp:\n[your-message]\nReply-To: [your-email]\n\n\n\n\nadmin \"[your-subject]\"\nadmin <bhiuvad@gmail.com>\n[your-email]\nNội dung thông điệp:\n[your-message]\n\n-- \nEmail này được gửi đến từ form liên hệ của website admin (http://localhost/wordpress)\nReply-To: bhiuvad@gmail.com\n\n\n\nXin cảm ơn, form đã được gửi thành công.\nCó lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\nCó một hoặc nhiều mục nhập có lỗi. Vui lòng kiểm tra và thử lại.\nCó lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\nBạn phải chấp nhận điều khoản trước khi gửi form.\nMục này là bắt buộc.\nNhập quá số kí tự cho phép.\nNhập ít hơn số kí tự tối thiểu.\nĐịnh dạng ngày tháng không hợp lệ.\nNgày này trước ngày sớm nhất được cho phép.\nNgày này quá ngày gần nhất được cho phép.\nTải file lên không thành công.\nBạn không được phép tải lên file theo định dạng này.\nFile kích thước quá lớn.\nTải file lên không thành công.\nĐịnh dạng số không hợp lệ.\nCon số nhỏ hơn số nhỏ nhất cho phép.\nCon số lớn hơn số lớn nhất cho phép.\nCâu trả lời chưa đúng.\nBạn đã nhập sai mã CAPTCHA.\nĐịa chỉ e-mail không hợp lệ.\nURL không hợp lệ.\nSố điện thoại không hợp lệ.","Form liên hệ ten, email","","publish","closed","closed","","form-lien-he-1","","","2018-10-26 02:52:58","2018-10-26 02:52:58","","0","http://localhost/wordpress/?post_type=wpcf7_contact_form&#038;p=266","0","wpcf7_contact_form","","0"),
("276","1","2018-09-09 05:55:13","2018-09-09 05:55:13","","Giới thiệu","","publish","closed","closed","","gioi-thieu-2","","","2018-10-10 11:59:14","2018-10-10 11:59:14","","0","http://localhost/wordpress/?p=276","6","nav_menu_item","","0"),
("280","1","2018-09-09 06:29:31","2018-09-09 06:29:31","[row]\n\n[col span=\"8\" span__sm=\"12\"]\n\n[title text=\"tin tức mới\" color=\"rgb(53, 146, 43)\"]\n\n[tabgroup style=\"tabs\"]\n\n[tab title=\"1\"]\n\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"188\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"30\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"100\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"262\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"32\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"256\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"185\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n\n[/tab]\n[tab title=\"2\"]\n\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"255\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n\n[/tab]\n[tab title=\"3\"]\n\n[row_inner]\n\n[col_inner span=\"4\" span__sm=\"12\"]\n\n[ux_image id=\"91\" height=\"75%\"]\n\n\n[/col_inner]\n[col_inner span=\"8\" span__sm=\"12\"]\n\n<h5 class=\"uppercase\">This is a simple headline</h5>\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n[/col_inner]\n\n[/row_inner]\n\n[/tab]\n\n[/tabgroup]\n\n[/col]\n[col span=\"4\" span__sm=\"12\"]\n\n[title text=\"bảng tin\" color=\"rgb(53, 146, 43)\"]\n\n<p>- <a href=\"#\">Văn phòng</a></p>\n<p>-<a href=\"#\">Nhà ở</a></p>\n<p>- <a href=\"#\">Cửa hàng</a></p>\n[ux_image id=\"292\" height=\"75%\"]\n\n[title text=\"tin nổi bật\" color=\"rgb(53, 146, 43)\"]\n\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"89\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<h2>This is a simple headline</h2>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"90\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<h2>This is a simple headline</h2>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"193\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<h2>This is a simple headline</h2>\n\n[/col_inner]\n\n[/row_inner]\n[title text=\"mẫu thiết kế\" color=\"rgb(53, 146, 43)\"]\n\n[row_inner]\n\n[col_inner span=\"6\" span__sm=\"12\"]\n\n[ux_image id=\"31\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"6\" span__sm=\"12\"]\n\n[ux_image id=\"29\" height=\"100%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"6\" span__sm=\"12\"]\n\n[ux_image id=\"28\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"6\" span__sm=\"12\"]\n\n[ux_image id=\"27\" height=\"100%\"]\n\n\n[/col_inner]\n\n[/row_inner]\n\n[/col]\n\n[/row]\n[section bg_color=\"rgb(40, 40, 40)\" bg_overlay=\"rgb(46, 124, 57)\" dark=\"true\"]\n\n<h2>Công ty nội thất Newhouse</h2>\n<p>09182747583</p>\n<p>noithatnewhouse@gmail.com<br />\nPhòng 00, Tòa nhà A, Trần Thái Tông, Cầu Giấy, Hà Nội</p>\n[follow facebook=\"1\" instagram=\"1\" twitter=\"1\" googleplus=\"1\"]\n\n\n[/section]","tin tuc","","publish","closed","closed","","tin-tuc","","","2018-09-09 10:26:50","2018-09-09 10:26:50","","0","http://localhost/wordpress/?page_id=280","0","page","","0"),
("284","1","2018-09-09 06:45:19","2018-09-09 06:45:19","[title text=\"liên hệ\" size=\"142\"]\n\n[row style=\"large\"]\n\n[col span=\"5\" span__sm=\"12\"]\n\n<p> </p>\n<p>Showroom 1: Số 2 Nhà A2 - 39 Pháo Đài Láng - Đống Đa - Hà Nội (Khu TT Phụ nữ Trung ương)</p>\n<p><span >Tell: <a href=\"tel:0352298233\">035 229 8233</a></span></p>\n<p style=\"padding-bottom: 0px;\">Website: http://localhost/wordpress_kickstart<br />Email:vuonganhduong812@gmail.com</p>\n<p> </p>\n<p style=\"font-weight: bold;\">Hotline: <a href=\"tel:0352298233\">035 229 8233</a></p>\n<p style=\"font-weight:bold;padding-bottom:40px\">Liên hệ ngay để được tư vấn bởi các chuyên gia hàng đầu về nội thất của chúng tôi</p>\n[contact-form-7 id=\"325\"]\n\n\n[/col]\n[col span=\"7\" span__sm=\"12\"]\n\n<p><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3247607131048!2d105.80457331432396!3d21.019687686003255!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab6775d89b7b%3A0x61778fa3c0d5571c!2zQ8O0bmcgdHkgQ1AgVE0gdsOgIFhEIE5ow6AgTeG7m2k!5e0!3m2!1svi!2s!4v1537611886025\" width=\"100%\" height=\"700\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe></p>\n\n[/col]\n\n[/row]","lien he","","publish","closed","closed","","lien-he","","","2018-10-17 02:47:23","2018-10-17 02:47:23","","0","http://localhost/wordpress/?page_id=284","0","page","","0"),
("287","1","2018-09-09 06:48:33","2018-09-09 06:48:33","","Liên hệ","","publish","closed","closed","","lien-he-4","","","2018-10-10 11:59:14","2018-10-10 11:59:14","","0","http://localhost/wordpress/?p=287","8","nav_menu_item","","0"),
("298","1","2018-09-09 10:45:18","2018-09-09 10:45:18","<strong>Nội thất, màu sắc, ánh sáng là những yếu tố giúp không gian phòng cưới thêm sang trọng, độc đáo. Hãy cùng những nhà thiết kế chuyên nghiệp của noithatnhamoi.vn tìm hiểu những bí quyết trang trí nội thất cho phòng cưới lãng mạn.</strong>","BÍ QUYẾT TRANG TRÍ NỘI THẤT PHÒNG CƯỚI LÃNG MẠN","","publish","open","open","","bi-quyet-trang-trang-tri-noi-that-phiong-cuoi-lang-man","","","2018-09-11 12:11:29","2018-09-11 12:11:29","","0","http://localhost/wordpress/?p=298","0","post","","0"),
("301","1","2018-09-09 10:48:06","2018-09-09 10:48:06"," ","","","publish","closed","closed","","301","","","2018-10-10 11:59:14","2018-10-10 11:59:14","","0","http://localhost/wordpress/301/","7","nav_menu_item","","0"),
("325","1","2018-09-11 11:08:24","2018-09-11 11:08:24","<label> Tên của bạn \n    [text your-name] </label>\n\n<label>  Email (bắt buộc)\n    [email* your-email] </label>\n\n<label> Số điện thoại (bắt buộc)\n    [tel* tel-492]</label>\n\n<label> Thông điệp\n    [textarea your-message] </label>\n\n[submit \"Gửi đi\"]\n1\nEmail liên hệ từ website\n[your-name] <duongva91@gmail.com>\nduongva91@gmail.com\nGửi đến từ: [your-name] <[your-email]>\nĐiện thoại: [tel-492]\n\nNội dung thông điệp:\n[your-message]\nReply-To: [your-email]\n\n\n\n\nadmin \"[your-subject]\"\nadmin <wordpress@125.212.227.39>\n[your-email]\nNội dung thông điệp:\n[your-message]\n\n-- \nEmail này được gửi đến từ form liên hệ của website admin (http://125.212.227.39/demo)\nReply-To: bhiuvad@gmail.com\n\n\n\nĐã gửi thành công\nCó lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\nCó một hoặc nhiều mục nhập có lỗi. Vui lòng kiểm tra và thử lại.\nCó lỗi xảy ra trong quá trình gửi. Xin vui lòng thử lại hoặc liên hệ người quản trị website.\nBạn phải chấp nhận điều khoản trước khi gửi form.\nMục này là bắt buộc.\nNhập quá số kí tự cho phép.\nNhập ít hơn số kí tự tối thiểu.\nĐịnh dạng ngày tháng không hợp lệ.\nNgày này trước ngày sớm nhất được cho phép.\nNgày này quá ngày gần nhất được cho phép.\nTải file lên không thành công.\nBạn không được phép tải lên file theo định dạng này.\nFile kích thước quá lớn.\nTải file lên không thành công.\nĐịnh dạng số không hợp lệ.\nCon số nhỏ hơn số nhỏ nhất cho phép.\nCon số lớn hơn số lớn nhất cho phép.\nCâu trả lời chưa đúng.\nBạn đã nhập sai mã CAPTCHA.\nĐịa chỉ e-mail không hợp lệ.\nURL không hợp lệ.\nSố điện thoại không hợp lệ.","form day du","","publish","closed","closed","","chua-co-tieu-de","","","2018-10-26 02:52:24","2018-10-26 02:52:24","","0","http://125.212.227.39/demo/?post_type=wpcf7_contact_form&#038;p=325","0","wpcf7_contact_form","","0"),
("361","1","2018-09-12 08:28:56","2018-09-12 08:28:56","[title style=\"center\" text=\"sản phẩm\" color=\"rgba(0, 128, 0, 0.77)\" size=\"145\"]\n\n[ux_product_categories style=\"push\" columns=\"3\" auto_slide=\"4000\" image_size=\"original\" image_hover=\"zoom\" text_hover=\"bounce\" text_bg=\"rgba(131, 164, 58, 0.38)\"]\n\n[title style=\"center\" text=\"SẢN PHẨM TIÊU BIỂU\" color=\"rgba(0, 128, 0, 0.77)\" size=\"145\"]\n\n[ux_products type=\"row\" columns=\"3\" products=\"9\"]\n\n[row]\n\n[col span=\"4\" span__sm=\"12\"]\n\n<h3 style=\"color: black; background-color: #eee; padding: 10px;\">SẢN PHẨM KHUYẾN MẠI</h3>\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"342\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Giường</a></p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"366\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Tủ bếp</a></p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"362\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Bàn ghế nhân viên</a></p>\n\n[/col_inner]\n\n[/row_inner]\n\n[/col]\n[col span=\"4\" span__sm=\"12\"]\n\n<h3 style=\"color: black; background-color: #eee; padding: 10px;\">SẢN PHẨM BÁN CHẠY</h3>\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"362\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Bàn ghế nhân viên</a></p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"342\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Giường</a></p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"366\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Tủ bếp</a></p>\n\n[/col_inner]\n\n[/row_inner]\n\n[/col]\n[col span=\"4\" span__sm=\"12\"]\n\n<h3 style=\"color: black; background-color: #eee; padding: 10px;\">SẢN PHẨM MỚI</h3>\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"342\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Giường</a></p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"366\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Tủ bếp</a></p>\n\n[/col_inner]\n\n[/row_inner]\n[row_inner]\n\n[col_inner span=\"5\" span__sm=\"12\"]\n\n[ux_image id=\"362\" height=\"100%\"]\n\n\n[/col_inner]\n[col_inner span=\"7\" span__sm=\"12\"]\n\n<p><a style=\"font-weight:bold;font-size:18px\">Bàn ghế nhân viên</a></p>\n\n[/col_inner]\n\n[/row_inner]\n\n[/col]\n\n[/row]\n[title style=\"center\" text=\"đối tác\" color=\"rgba(0, 128, 0, 0.77)\" size=\"145\"]\n\n[row]\n\n[col span=\"3\" span__sm=\"6\"]\n\n[ux_image id=\"221\"]\n\n\n[/col]\n[col span=\"3\" span__sm=\"6\"]\n\n[ux_image id=\"219\"]\n\n\n[/col]\n\n[/row]\n[row]\n\n[col span=\"3\" span__sm=\"6\"]\n\n[ux_image id=\"193\"]\n\n\n[/col]\n[col span=\"3\" span__sm=\"6\"]\n\n[ux_image id=\"194\"]\n\n\n[/col]\n[col span=\"3\" span__sm=\"6\"]\n\n[ux_image id=\"195\"]\n\n\n[/col]\n[col span=\"3\" span__sm=\"6\"]\n\n[ux_image id=\"196\"]\n\n\n[/col]\n\n[/row]\n[row]\n\n[col span__sm=\"12\"]\n\n[title text=\"thông tin liên hệ\" color=\"rgba(0, 128, 0, 0.77)\" size=\"120\"]\n\n<p><b></p>\n<p>Showroom 1: Số 2 Nhà A2 - 39 Pháo Đài Láng - Đống Đa - Hà Nội (Khu TT Phụ nữ Trung ương)<br />\nTell: (84.24)32 595 863/ 62 760 350<br />\nWebsite: http://www.noithatnhamoi.vn<br />\nEmail:nhamoidogo@gmail.com</p>\n<p></b></p>\n\n[/col]\n\n[/row]","san pham","","publish","closed","closed","","san-pham","","","2018-10-10 07:13:55","2018-10-10 07:13:55","","0","http://125.212.227.39/demo/?page_id=361","0","page","","0"),
("394","1","2018-09-13 16:11:43","0000-00-00 00:00:00","","widget_image","","draft","closed","closed","","","","","2018-09-13 16:11:43","0000-00-00 00:00:00","a:1:{s:12:\"_multiwidget\";i:1;}","0","http://125.212.227.39/demo/?post_type=jetpack_migration&p=394","0","jetpack_migration","","0"),
("395","1","2018-09-13 16:11:43","0000-00-00 00:00:00","","sidebars_widgets","","draft","closed","closed","","","","","2018-09-13 16:11:43","0000-00-00 00:00:00","a:6:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:10:\"archives-2\";i:1;s:6:\"meta-2\";i:2;s:8:\"search-2\";i:3;s:14:\"recent-posts-2\";i:4;s:17:\"recent-comments-2\";}s:12:\"sidebar-main\";a:2:{i:0;s:23:\"flatsome_recent_posts-3\";i:1;s:12:\"categories-2\";}s:16:\"sidebar-footer-1\";a:0:{}s:16:\"sidebar-footer-2\";a:0:{}s:12:\"shop-sidebar\";a:3:{i:0;s:32:\"woocommerce_product_categories-3\";i:1;s:38:\"woocommerce_recently_viewed_products-3\";i:2;s:15:\"upsell_widget-3\";}s:15:\"product-sidebar\";a:0:{}}","0","http://125.212.227.39/demo/?post_type=jetpack_migration&p=395","0","jetpack_migration","","0"),
("403","0","2018-09-14 15:52:33","0000-00-00 00:00:00","PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPCEtLWdlbmVyYXRvcj0namV0cGFjay02LjUnLS0+Cjw/eG1sLXN0eWxlc2hlZXQgdHlwZT0idGV4dC94c2wiIGhyZWY9Imh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3NpdGVtYXAueHNsIj8+Cjx1cmxzZXQgeG1sbnM9Imh0dHA6Ly93d3cuc2l0ZW1hcHMub3JnL3NjaGVtYXMvc2l0ZW1hcC8wLjkiIHhtbG5zOnhzaT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS9YTUxTY2hlbWEtaW5zdGFuY2UiIHhzaTpzY2hlbWFMb2NhdGlvbj0iaHR0cDovL3d3dy5zaXRlbWFwcy5vcmcvc2NoZW1hcy9zaXRlbWFwLzAuOSBodHRwOi8vd3d3LnNpdGVtYXBzLm9yZy9zY2hlbWFzL3NpdGVtYXAvMC45L3NpdGVtYXAueHNkIj48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW88L2xvYz48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vMTAtY2hpZWMtYmFuLWFuLXRob25nLW1pbmgtY2hvLWNhbi1oby1uaG8vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xMVQxMjoxMDo0MFo8L2xhc3Rtb2Q+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2dpb2ktdGhpZXUvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xMlQwOToyNzo1Mlo8L2xhc3Rtb2Q+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMTRUMTU6NTI6MzNaPC9sYXN0bW9kPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9jdWEtaGFuZy88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA5VDA1OjUyOjM2WjwvbGFzdG1vZD48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vZ2lvLWhhbmcvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wNVQxNDo0MjoxNFo8L2xhc3Rtb2Q+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3RoYW5oLXRvYW4vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wNVQxNDo0MjoxNFo8L2xhc3Rtb2Q+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3RhaS1raG9hbi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDE0OjQyOjE0WjwvbGFzdG1vZD48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vdHUtdmFuLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDhUMDc6NDY6MTBaPC9sYXN0bW9kPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby90dS12YW4vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xNFQxNTowNDo1Mlo8L2xhc3Rtb2Q+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3Rpbi10dWMvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wOVQxMDoyNjo1MFo8L2xhc3Rtb2Q+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2xpZW4taGUvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xNFQxNTozNzowOFo8L2xhc3Rtb2Q+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2JpLXF1eWV0LXRyYW5nLXRyYW5nLXRyaS1ub2ktdGhhdC1waGlvbmctY3VvaS1sYW5nLW1hbi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTExVDEyOjExOjI5WjwvbGFzdG1vZD48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vMTMtbW9uLW5vaS10aGF0LWh1YS1oZW4tc2UtbGEtZ2lhaS1waGFwLXZhbmctY2hvLW5nb2ktbmhhLWNoYXQtdHJvbmctdHVvbmctbGFpLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMTFUMTI6MTI6MzBaPC9sYXN0bW9kPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9kby1nby1tZW8taGF5LXZvaS1kby1nby10cm9uZy1naWEtZGluaC88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTExVDExOjU5OjIwWjwvbGFzdG1vZD48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vdHUtdGFvLTEtY2hpZWMtZ2l1b25nLWN1Yy1uZ2F1LXRoZW8tcGhvbmctY2FjaC1jdWEtYmFuLXRyb25nLTMtcGh1dC88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTExVDEyOjEzOjE3WjwvbGFzdG1vZD48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vbGFuZy1uZ2hlLW1vYy1jby10cnV5ZW4tY2hhbmctc29uLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMTFUMTI6MDM6NDhaPC9sYXN0bW9kPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9zYW4tcGhhbS88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTEzVDExOjA0OjQzWjwvbGFzdG1vZD48L3VybD48L3VybHNldD4K","sitemap-1.xml","","draft","closed","closed","","","","","2018-09-15 07:23:58","2018-09-15 07:23:58","","0","http://125.212.227.39/demo/?p=403","0","jp_sitemap","","0"),
("404","0","2018-09-12 08:44:57","0000-00-00 00:00:00","PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPCEtLWdlbmVyYXRvcj0namV0cGFjay02LjUnLS0+Cjw/eG1sLXN0eWxlc2hlZXQgdHlwZT0idGV4dC94c2wiIGhyZWY9Imh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2ltYWdlLXNpdGVtYXAueHNsIj8+Cjx1cmxzZXQgeG1sbnM9Imh0dHA6Ly93d3cuc2l0ZW1hcHMub3JnL3NjaGVtYXMvc2l0ZW1hcC8wLjkiIHhtbG5zOnhzaT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS9YTUxTY2hlbWEtaW5zdGFuY2UiIHhzaTpzY2hlbWFMb2NhdGlvbj0iaHR0cDovL3d3dy5zaXRlbWFwcy5vcmcvc2NoZW1hcy9zaXRlbWFwLzAuOSBodHRwOi8vd3d3LnNpdGVtYXBzLm9yZy9zY2hlbWFzL3NpdGVtYXAvMC45L3NpdGVtYXAueHNkIiB4bWxuczppbWFnZT0iaHR0cDovL3d3dy5nb29nbGUuY29tL3NjaGVtYXMvc2l0ZW1hcC1pbWFnZS8xLjEiPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9kdW1teS1pbWFnZS0yLzwvbG9jPjxsYXN0bW9kPjIwMTYtMDgtMDlUMTM6NDM6MjVaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE2LzA4L2R1bW15LTIuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPkR1bW15IEltYWdlIDI8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9wcm9kLWR1bW15LWltYWdlLTEvPC9sb2M+PGxhc3Rtb2Q+MjAxNi0wOC0wOVQxMzo0MzoyNVo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTYvMDgvZHVtbXktcHJvZC0xLmpwZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5Qcm9kdWN0IER1bW15IEltYWdlPC9pbWFnZTp0aXRsZT48aW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmNhcHRpb24+PC9pbWFnZTppbWFnZT48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vYXZhdGFyX2cvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wM1QxNTo0ODozN1o8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvYXZhdGFyX2cuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmF2YXRhcl9nPC9pbWFnZTp0aXRsZT48aW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmNhcHRpb24+PC9pbWFnZTppbWFnZT48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vY3JvcHBlZC1waG90by1qcGcvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wNFQwNzowMTo1MFo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvY3JvcHBlZC1waG90by5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+Y3JvcHBlZC1waG90by5qcGc8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xNDUxMjg1MjY1X2xvZ28vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wNFQwNzoxOToyMlo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvMTQ1MTI4NTI2NV9sb2dvLWUxNTM2MDQ1NTE3MzU0LnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT4xNDUxMjg1MjY1X2xvZ288L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYxMzA5NTkyNjBiZjk0OGM2YzIyY2NmNGY0MzI3NWViNTkyM2JiYTc2LzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMDc6Mzk6NDVaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjEzMDk1OTI2MGJmOTQ4YzZjMjJjY2Y0ZjQzMjc1ZWI1OTIzYmJhNzYuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjEzMDk1OTI2MGJmOTQ4YzZjMjJjY2Y0ZjQzMjc1ZWI1OTIzYmJhNzY8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYxMzA5NTMzN2IzNDgyZmEyY2Q4ZmYxYmUxNmQzM2I2NDQ2MTI5YjJiLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMDc6NDE6MzNaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjEzMDk1MzM3YjM0ODJmYTJjZDhmZjFiZTE2ZDMzYjY0NDYxMjliMmIuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjEzMDk1MzM3YjM0ODJmYTJjZDhmZjFiZTE2ZDMzYjY0NDYxMjliMmI8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYxMzA5NTExMjJiYTE0YmYzZWY1OWFlNDJiMDAzMTAwNWIyZWVhMTdjLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMDc6NTA6NThaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjEzMDk1MTEyMmJhMTRiZjNlZjU5YWU0MmIwMDMxMDA1YjJlZWExN2MuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjEzMDk1MTEyMmJhMTRiZjNlZjU5YWU0MmIwMDMxMDA1YjJlZWExN2M8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYxMzA5MjQyNGRiMmVlN2YyZGQ2ZGQwZTczZmQ0NjhiYTlkMTU2NjI4LzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMDc6NTc6MDZaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjEzMDkyNDI0ZGIyZWU3ZjJkZDZkZDBlNzNmZDQ2OGJhOWQxNTY2MjguanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjEzMDkyNDI0ZGIyZWU3ZjJkZDZkZDBlNzNmZDQ2OGJhOWQxNTY2Mjg8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYxMzA5MTMyNmZiYzczZWU4ZjIyZTdjYmY5ZTJiNzg4M2NlNzUxNmJiLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMDc6NTc6NDVaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjEzMDkxMzI2ZmJjNzNlZThmMjJlN2NiZjllMmI3ODgzY2U3NTE2YmIuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjEzMDkxMzI2ZmJjNzNlZThmMjJlN2NiZjllMmI3ODgzY2U3NTE2YmI8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYxMzE1MDcxNDgxNjRhMGMxM2Q3MGMzY2FlZTYxYTg1ZDAzNWQ1ZjI1LzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMDc6NTg6MTJaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjEzMTUwNzE0ODE2NGEwYzEzZDcwYzNjYWVlNjFhODVkMDM1ZDVmMjUuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjEzMTUwNzE0ODE2NGEwYzEzZDcwYzNjYWVlNjFhODVkMDM1ZDVmMjU8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDQyNzAzNTkxN2VmNmRmZjk1OTg3ZjQzMzFkZWE5YTAzYzJmOWEyNmUzLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMDk6MTk6MzRaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNDI3MDM1OTE3ZWY2ZGZmOTU5ODdmNDMzMWRlYTlhMDNjMmY5YTI2ZTMucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNDI3MDM1OTE3ZWY2ZGZmOTU5ODdmNDMzMWRlYTlhMDNjMmY5YTI2ZTM8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYwMjE2NTIxNmU1OWRiZTY5YzExOWI1ZDU5ZTkxYjliNjMwZGFkYzA1LzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMTA6Mzg6MzRaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjAyMTY1MjE2ZTU5ZGJlNjljMTE5YjVkNTllOTFiOWI2MzBkYWRjMDUuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjAyMTY1MjE2ZTU5ZGJlNjljMTE5YjVkNTllOTFiOWI2MzBkYWRjMDU8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYwMjE3MDgxMWNkNDJjMWQ0YzAzNGQ3ZTkyMjQwMTgwNWI5NTU5ZDFhLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMTA6Mzg6NTVaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjAyMTcwODExY2Q0MmMxZDRjMDM0ZDdlOTIyNDAxODA1Yjk1NTlkMWEuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjAyMTcwODExY2Q0MmMxZDRjMDM0ZDdlOTIyNDAxODA1Yjk1NTlkMWE8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYxNTA4MzUxNjhlOWRjOWIzYmNiZDkxZWUwZTU1NjdiODFiYzI2ZjZkLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMTA6Mzk6MjlaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjE1MDgzNTE2OGU5ZGM5YjNiY2JkOTFlZTBlNTU2N2I4MWJjMjZmNmQuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjE1MDgzNTE2OGU5ZGM5YjNiY2JkOTFlZTBlNTU2N2I4MWJjMjZmNmQ8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDYwMjE1NDQzNzQ5OTFhMGE4YmMxNmI1MDFkYzhhODVmZjJlOTE3MTkwLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMTA6Mzk6NTVaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwNjAyMTU0NDM3NDk5MWEwYThiYzE2YjUwMWRjOGE4NWZmMmU5MTcxOTAuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwNjAyMTU0NDM3NDk5MWEwYThiYzE2YjUwMWRjOGE4NWZmMmU5MTcxOTA8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8yMDE2MDgwNjA4NTMzMDUyNDJlZjZmNDg5ZmM5YzM1YmEzNTc5MjdmOTFhNTlmLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDRUMTA6NDA6MDdaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzIwMTYwODA2MDg1MzMwNTI0MmVmNmY0ODlmYzljMzViYTM1NzkyN2Y5MWE1OWYuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjIwMTYwODA2MDg1MzMwNTI0MmVmNmY0ODlmYzljMzViYTM1NzkyN2Y5MWE1OWY8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8zMzk2NDE1NV8yMTA3MzMyMDM2MTcxMTAwXzg3MzYwNzI4Mzg1MjEyOTA3NTJfby88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA1OjI0OjQ1WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8zMzk2NDE1NV8yMTA3MzMyMDM2MTcxMTAwXzg3MzYwNzI4Mzg1MjEyOTA3NTJfby5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MzM5NjQxNTVfMjEwNzMzMjAzNjE3MTEwMF84NzM2MDcyODM4NTIxMjkwNzUyX288L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby80MDU4MTQ0N18yMTk0NDI5OTE3NDYxMzExXzM0NDI0Mjg5OTIyNTcyNjE1Njhfby88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA1OjI1OjU1WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS80MDU4MTQ0N18yMTk0NDI5OTE3NDYxMzExXzM0NDI0Mjg5OTIyNTcyNjE1Njhfby5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+NDA1ODE0NDdfMjE5NDQyOTkxNzQ2MTMxMV8zNDQyNDI4OTkyMjU3MjYxNTY4X288L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9sb2dvLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDVUMDU6MzQ6MTRaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5L2xvZ28ucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmxvZ288L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWcyMi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA2OjM1OjMyWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWcyMi5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nMjI8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWcyMy88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA2OjM1OjQxWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWcyMy5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nMjM8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWcyNC88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA2OjM1OjUxWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWcyNC5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nMjQ8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby80MDUxNTUyM18yMTk0NDI5MTE0MTI4MDU4XzIyMjc0OTQ2NzUzNjE1NjI2MjRfbi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA4OjM2OjI5WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS80MDUxNTUyM18yMTk0NDI5MTE0MTI4MDU4XzIyMjc0OTQ2NzUzNjE1NjI2MjRfbi5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+NDA1MTU1MjNfMjE5NDQyOTExNDEyODA1OF8yMjI3NDk0Njc1MzYxNTYyNjI0X248L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby80MDUzMDgxMV8yMTk0NDI5MDYwNzk0NzMwXzIxNzk3Mzg1OTQ2OTQ5MjIyNDBfbi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA4OjM4OjE3WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS80MDUzMDgxMV8yMTk0NDI5MDYwNzk0NzMwXzIxNzk3Mzg1OTQ2OTQ5MjIyNDBfbi5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+NDA1MzA4MTFfMjE5NDQyOTA2MDc5NDczMF8yMTc5NzM4NTk0Njk0OTIyMjQwX248L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby80MDU2ODYzMV8yMTk0NDI5MTMwNzk0NzIzXzEwMDU4NTQ1OTU5NjE4NDc4MDhfbi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA4OjQ0OjEwWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS80MDU2ODYzMV8yMTk0NDI5MTMwNzk0NzIzXzEwMDU4NTQ1OTU5NjE4NDc4MDhfbi5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+NDA1Njg2MzFfMjE5NDQyOTEzMDc5NDcyM18xMDA1ODU0NTk1OTYxODQ3ODA4X248L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9sYXphZGEtc2FuLXBoYW0tbm9pLXRoYXQtMS0xNDg2ODk3ODQ0LTkwMjk1LzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDVUMDk6MDE6MzZaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5L2xhemFkYS1zYW4tcGhhbS1ub2ktdGhhdC0xLTE0ODY4OTc4NDQuOTAyOTUuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmxhemFkYS1zYW4tcGhhbS1ub2ktdGhhdC0xLTE0ODY4OTc4NDQuOTAyOTU8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWcxXzYyZGYzMTY1LTg4ZWEtNGFmYi1iNjk4LTYzOTI0ZmM4ZTI5Ni88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA5OjI1OjEyWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWcxXzYyZGYzMTY1LTg4ZWEtNGFmYi1iNjk4LTYzOTI0ZmM4ZTI5Ni5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nMV82MmRmMzE2NS04OGVhLTRhZmItYjY5OC02MzkyNGZjOGUyOTY8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWcyXzYwNjkxYmZmLWUxOGQtNDdmMi04MmNiLTE3ZGQxMjg2ZTZlOS88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA5OjMzOjE5WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWcyXzYwNjkxYmZmLWUxOGQtNDdmMi04MmNiLTE3ZGQxMjg2ZTZlOS5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nMl82MDY5MWJmZi1lMThkLTQ3ZjItODJjYi0xN2RkMTI4NmU2ZTk8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWczXzRmN2FkYzdiLWFhYWUtNDhiNy1hMGM0LTRlMmQ4ZjRmNDg0OS88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA5OjM3OjQ1WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWczXzRmN2FkYzdiLWFhYWUtNDhiNy1hMGM0LTRlMmQ4ZjRmNDg0OS5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nM180ZjdhZGM3Yi1hYWFlLTQ4YjctYTBjNC00ZTJkOGY0ZjQ4NDk8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWc0X2RkZWYzYjhiLTYwYzMtNGVlOC1iNzUwLTQwYTc0YzY5MDM3Mi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA5OjQwOjM3WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWc0X2RkZWYzYjhiLTYwYzMtNGVlOC1iNzUwLTQwYTc0YzY5MDM3Mi5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nNF9kZGVmM2I4Yi02MGMzLTRlZTgtYjc1MC00MGE3NGM2OTAzNzI8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWc1XzNhZjU3MjU1LWFlY2UtNDdiNi05M2I3LWNlODc4MWM5OTk4MC88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA5OjQ4OjAyWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWc1XzNhZjU3MjU1LWFlY2UtNDdiNi05M2I3LWNlODc4MWM5OTk4MC5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nNV8zYWY1NzI1NS1hZWNlLTQ3YjYtOTNiNy1jZTg3ODFjOTk5ODA8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pbWc2XzYzYTYzOGE5LWMwNTUtNGY0NC05ZWYwLWEyYTJhNjlmYzE5OC88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA1VDA5OjQ4OjEzWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pbWc2XzYzYTYzOGE5LWMwNTUtNGY0NC05ZWYwLWEyYTJhNjlmYzE5OC5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aW1nNl82M2E2MzhhOS1jMDU1LTRmNDQtOWVmMC1hMmEyYTY5ZmMxOTg8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9wb3B1cF9uZXdzbGV0dGVyX2ltZy88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA2VDE2OjU5OjM3WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9wb3B1cF9uZXdzbGV0dGVyX2ltZy5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+cG9wdXBfbmV3c2xldHRlcl9pbWc8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9sdXh1cnkvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMTo0NjoxOVo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvbHV4dXJ5LmpwZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5sdXh1cnk8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uMV8yOTI1MDcwZi1jNjA0LTQyMWQtYmUzMi05OWQ5YzYzNjRmOThfbWVkaXVtLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDdUMTI6MDM6MzdaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5L2ljb24xXzI5MjUwNzBmLWM2MDQtNDIxZC1iZTMyLTk5ZDljNjM2NGY5OF9tZWRpdW0ucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmljb24xXzI5MjUwNzBmLWM2MDQtNDIxZC1iZTMyLTk5ZDljNjM2NGY5OF9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uOF9tZWRpdW0vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMjoyMzoxN1o8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjhfbWVkaXVtLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5pY29uOF9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xMy88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU0OjQ0WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8xMy5wbmc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MTM8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xNC88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU0OjQ3WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8xNC5wbmc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MTQ8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xNS88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU0OjQ5WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8xNS5wbmc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MTU8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xNy88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU0OjUwWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8xNy5wbmc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MTc8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xOC88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU0OjUyWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8xOC5wbmc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MTg8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9hbWVyaWNhbi1leHByZXNzLTQ4X3NtYWxsLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDdUMTM6NTQ6NTRaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5L2FtZXJpY2FuLWV4cHJlc3MtNDhfc21hbGwucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmFtZXJpY2FuLWV4cHJlc3MtNDhfc21hbGw8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uMl9tZWRpdW0vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMzo1NTowMlo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjJfbWVkaXVtLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5pY29uMl9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uM19tZWRpdW0vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMzo1NTowNFo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjNfbWVkaXVtLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5pY29uM19tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uNl9tZWRpdW0vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMzo1NTowNlo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjZfbWVkaXVtLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5pY29uNl9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uN19tZWRpdW0vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMzo1NTowN1o8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjdfbWVkaXVtLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5pY29uN19tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uMTBfbWVkaXVtLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDdUMTM6NTU6MDlaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5L2ljb24xMF9tZWRpdW0ucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmljb24xMF9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uMTFfbWVkaXVtLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDdUMTM6NTU6MTBaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5L2ljb24xMV9tZWRpdW0ucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmljb24xMV9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uNF9tZWRpdW0vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMzo1NTozNVo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjRfbWVkaXVtLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5pY29uNF9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uNV9tZWRpdW0vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMzo1NTozN1o8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjVfbWVkaXVtLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT5pY29uNV9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uNl9tZWRpdW0tMi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU1OjM5WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pY29uNl9tZWRpdW0tMS5wbmc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+aWNvbjZfbWVkaXVtPC9pbWFnZTp0aXRsZT48aW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmNhcHRpb24+PC9pbWFnZTppbWFnZT48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vaWNvbjhfbWVkaXVtLTIvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wN1QxMzo1NTo0MFo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvaWNvbjhfbWVkaXVtLTEucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmljb244X21lZGl1bTwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2ljb245X21lZGl1bS88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU1OjQyWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pY29uOV9tZWRpdW0ucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmljb245X21lZGl1bTwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2ljb24xMF9tZWRpdW0tMi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDEzOjU1OjQ0WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9pY29uMTBfbWVkaXVtLTEucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmljb24xMF9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9pY29uMTJfbWVkaXVtLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDdUMTM6NTU6NDZaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5L2ljb24xMl9tZWRpdW0ucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmljb24xMl9tZWRpdW08L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xNi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDE0OjQ0OjE5WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8xNi5wbmc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MTY8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xNy0yLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDdUMTQ6NDQ6MjFaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzE3LTEucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjE3PC9pbWFnZTp0aXRsZT48aW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmNhcHRpb24+PC9pbWFnZTppbWFnZT48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vMTgtMi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA3VDE0OjQ0OjIzWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS8xOC0xLnBuZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT4xODwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2RlY294LXRoaWV0LWtlLW5vaS10aGF0LWNhbi1oby1jaHVuZy1jdS1tYXN0ZXJpLXRoYW8tZGllbi02OG0yLTEtcGhvbmcta2hhY2gtbm9pLXRoYXQtY2h1bmctY3UvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0wOFQwODowNToxNlo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvZGVjb3gtdGhpZXQta2Utbm9pLXRoYXQtY2FuLWhvLWNodW5nLWN1LW1hc3RlcmktdGhhby1kaWVuLTY4bTItMS1waG9uZy1raGFjaC1ub2ktdGhhdC1jaHVuZy1jdS5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+ZGVjb3gtdGhpZXQta2Utbm9pLXRoYXQtY2FuLWhvLWNodW5nLWN1LW1hc3RlcmktdGhhby1kaWVuLTY4bTItMS1waG9uZy1raGFjaC1ub2ktdGhhdC1jaHVuZy1jdTwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzY4NjE3YmI0ZmIyZWY1ZmMzZTdmNTZmMTlkMTcyYTQ0LzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDhUMDg6MTA6NDdaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzY4NjE3YmI0ZmIyZWY1ZmMzZTdmNTZmMTlkMTcyYTQ0LmpwZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT42ODYxN2JiNGZiMmVmNWZjM2U3ZjU2ZjE5ZDE3MmE0NDwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzhfMjA0NDI0LzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDhUMDg6MTA6NTFaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzhfMjA0NDI0LmpwZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT44XzIwNDQyNDwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2xheWxhX2U5MTQ5ZWE0LTgxNDUtNGMxYS1iOGYyLTY5NDc3MmRiMTJiYi88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTA4VDA5OjQ5OjUwWjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9sYXlsYV9lOTE0OWVhNC04MTQ1LTRjMWEtYjhmMi02OTQ3NzJkYjEyYmIucG5nPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPmxheWxhX2U5MTQ5ZWE0LTgxNDUtNGMxYS1iOGYyLTY5NDc3MmRiMTJiYjwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzE0Ny0xLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMDlUMDk6NTM6MTdaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzE0Ny0xLmpwZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT4xNDcgKDEpPC9pbWFnZTp0aXRsZT48aW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmNhcHRpb24+PC9pbWFnZTppbWFnZT48L3VybD48dXJsPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vYmktcXV5ZXQtdHJhbmctdHJhbmctdHJpLW5vaS10aGF0LXBoaW9uZy1jdW9pLWxhbmctbWFuLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMTFUMTE6NDk6MDdaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5Lzc3MTUyNzQ5X0JpLXF1eWV0LXRyYW5nLXRyaS1waG9uZy1jdW9pLTEuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjc3MTUyNzQ5X0JpLXF1eWV0LXRyYW5nLXRyaS1waG9uZy1jdW9pLTE8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby8xMC1jaGllYy1iYW4tYW4tdGhvbmctbWluaC1jaG8tY2FuLWhvLW5oby88L2xvYz48bGFzdG1vZD4yMDE4LTA5LTExVDExOjU1OjI2WjwvbGFzdG1vZD48aW1hZ2U6aW1hZ2U+PGltYWdlOmxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS80NDMyNjI0Ml9zcGFjZS1zYXZpbmctZGluaW5nLXRhYmxlcy1hbmQtY2hhaXJzLTUzNXg0MTYuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjQ0MzI2MjQyX3NwYWNlLXNhdmluZy1kaW5pbmctdGFibGVzLWFuZC1jaGFpcnMtNTM1eDQxNjwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3R1LXRhby0xLWNoaWVjLWdpdW9uZy1jdWMtbmdhdS10aGVvLXBob25nLWNhY2gtY3VhLWJhbi10cm9uZy0zLXBodXQvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xMVQxMTo1OTo1NFo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvMTIxODg1NDQ5X2NhdHMtY3JvcHZiLmpwZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT4xMjE4ODU0NDlfY2F0cy1jcm9wdmI8L2ltYWdlOnRpdGxlPjxpbWFnZTpjYXB0aW9uPjwvaW1hZ2U6Y2FwdGlvbj48L2ltYWdlOmltYWdlPjwvdXJsPjx1cmw+PGxvYz5odHRwOi8vMTI1LjIxMi4yMjcuMzkvZGVtby9sYW5nLW5naGUtbW9jLWNvLXRydXllbi1jaGFuZy1zb24vPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xMVQxMjowMDo1Mlo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvMjAwMjQ5ODUzMF9QaG90bzAyNzExLmpwZzwvaW1hZ2U6bG9jPjxpbWFnZTp0aXRsZT4yMDAyNDk4NTMwX1Bob3RvMDI3MSgxKTwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzIwMTYwNjAzMTExNDU2MDJiNzEwOTgwMjc0ODAxZTcxMzY3ODFmZmZhOTk3YzkvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xMlQwODowNTozM1o8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvMjAxNjA2MDMxMTE0NTYwMmI3MTA5ODAyNzQ4MDFlNzEzNjc4MWZmZmE5OTdjOS5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MjAxNjA2MDMxMTE0NTYwMmI3MTA5ODAyNzQ4MDFlNzEzNjc4MWZmZmE5OTdjOTwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzIwMTYwNjAzMTE0MjQxOGFjNjUzZTY5NmZjNmY0ODMyMjkwZThkMDY0ZWEyMzMvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xMlQwODowNTo0NVo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvMjAxNjA2MDMxMTQyNDE4YWM2NTNlNjk2ZmM2ZjQ4MzIyOTBlOGQwNjRlYTIzMy5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MjAxNjA2MDMxMTQyNDE4YWM2NTNlNjk2ZmM2ZjQ4MzIyOTBlOGQwNjRlYTIzMzwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzIwMTYwNjAzMTExODU3YmMyYTZkMDU2MGNhNjI1ZTU4Y2NiNTM0YjU0YTM0MzUvPC9sb2M+PGxhc3Rtb2Q+MjAxOC0wOS0xMlQwODowNTo1Nlo8L2xhc3Rtb2Q+PGltYWdlOmltYWdlPjxpbWFnZTpsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vd3AtY29udGVudC91cGxvYWRzLzIwMTgvMDkvMjAxNjA2MDMxMTE4NTdiYzJhNmQwNTYwY2E2MjVlNThjY2I1MzRiNTRhMzQzNS5qcGc8L2ltYWdlOmxvYz48aW1hZ2U6dGl0bGU+MjAxNjA2MDMxMTE4NTdiYzJhNmQwNTYwY2E2MjVlNThjY2I1MzRiNTRhMzQzNTwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PHVybD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vLzE3OTYzMTExMDNfbWVvLWhheS12b2ktZG8tZ28tdHJvbmctZ2lhLWRpbmgtMjIxLzwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMTJUMDg6NDQ6NTdaPC9sYXN0bW9kPjxpbWFnZTppbWFnZT48aW1hZ2U6bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE4LzA5LzE3OTYzMTExMDNfTeG6uW8taGF5LXbhu5tpLcSR4buTLWfhu5ctdHJvbmctZ2lhLcSRw6xuaC0yMjEuanBnPC9pbWFnZTpsb2M+PGltYWdlOnRpdGxlPjE3OTYzMTExMDNfTeG6uW8taGF5LXbhu5tpLcSR4buTLWfhu5ctdHJvbmctZ2lhLcSRw6xuaC0yMigxKTwvaW1hZ2U6dGl0bGU+PGltYWdlOmNhcHRpb24+PC9pbWFnZTpjYXB0aW9uPjwvaW1hZ2U6aW1hZ2U+PC91cmw+PC91cmxzZXQ+Cg==","image-sitemap-1.xml","","draft","closed","closed","","","","","2018-09-15 07:23:59","2018-09-15 07:23:59","","0","http://125.212.227.39/demo/?p=404","0","jp_img_sitemap","","0"),
("405","0","1970-01-01 00:00:00","0000-00-00 00:00:00","PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPCEtLWdlbmVyYXRvcj0namV0cGFjay02LjUnLS0+Cjw/eG1sLXN0eWxlc2hlZXQgdHlwZT0idGV4dC94c2wiIGhyZWY9Imh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL3NpdGVtYXAtaW5kZXgueHNsIj8+CjxzaXRlbWFwaW5kZXggeG1sbnM9Imh0dHA6Ly93d3cuc2l0ZW1hcHMub3JnL3NjaGVtYXMvc2l0ZW1hcC8wLjkiPjxzaXRlbWFwPjxsb2M+aHR0cDovLzEyNS4yMTIuMjI3LjM5L2RlbW8vc2l0ZW1hcC0xLnhtbDwvbG9jPjxsYXN0bW9kPjIwMTgtMDktMTRUMTU6NTI6MzNaPC9sYXN0bW9kPjwvc2l0ZW1hcD48c2l0ZW1hcD48bG9jPmh0dHA6Ly8xMjUuMjEyLjIyNy4zOS9kZW1vL2ltYWdlLXNpdGVtYXAtMS54bWw8L2xvYz48bGFzdG1vZD4yMDE4LTA5LTEyVDA4OjQ0OjU3WjwvbGFzdG1vZD48L3NpdGVtYXA+PC9zaXRlbWFwaW5kZXg+Cg==","sitemap.xml","","draft","closed","closed","","","","","2018-09-15 07:23:59","2018-09-15 07:23:59","","0","http://125.212.227.39/demo/?p=405","0","jp_sitemap_master","","0"),
("428","1","2018-09-15 14:40:39","2018-09-15 14:40:39",".nav>li.html {\n    color: black;\n	font-size:16px;\n}\n.header-main .nav > li > a {\n    line-height: 11px;\n    padding: 0px;\n    font-size: 16px;\n}\n.header:not(.transparent) .header-bottom-nav.nav > li > a {\n    color: #ffffff;\n}\n\n.header-button .button {\n    margin: 0;\n    margin-top: -4px;\n    padding-bottom: 15px;\n	padding-top:10px;\n\n}\n.button.icon.circle {\n    padding-left: 20px;\n    padding-right: 20px;\n    font-size: 11px;\n}\n.nav > li > a {\n   \n    font-size: 17px;\n}\nbody{\n	font-size:15px;\n}\n.icon-google-plus:before {\n    content: \"\\e905\";\n    color: black;\n}\n.icon-twitter:before {\n    content: \"\\e001\";\n    color: black;\n}\n.icon-instagram:before {\n    content: \"\\e00e\";\n    color: black;\n}\n.icon-facebook:before {\n    content: \"\\e002\";\n    color: black;\n}\n.absolute-footer {\n    color: rgba(0,0,0,0.5);\n    padding: 10px 0 15px;\n    font-size: .9em;\n    display: none;\n}\n#content{\n	padding-top:30px\n}\n.entry-image img {\n    width: 100%;\n    display: none;\n}\n.header-button {\n    display: inline-block;\n}\n.button [data-icon-label]:after {\n    top: -12px;\n    right: -12px;\n    background-color: red;\n}\nfooter{\n	background:#292A29;\n}","noithat","","publish","closed","closed","","noithat","","","2018-10-11 07:32:47","2018-10-11 07:32:47","","0","http://125.212.227.39/demo/noithat/","0","custom_css","","0"),
("444","1","2018-09-17 15:23:51","2018-09-17 15:23:51","[button text=\"Hotline: 0352298233\" style=\"gloss\" animate=\"flipInX\" expand=\"true\" icon=\"icon-phone\" icon_pos=\"left\"]\n\n<iframe src=\"https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Ffreelancerviet.net%2F&tabs=timeline&width=340&height=200px&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=1179312628778874\" width=\"340\" height=\"200px\" style=\"border:none;overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowtransparency=\"true\" allow=\"encrypted-media\"></iframe>\n[title style=\"center\" text=\"Liên hệ tư vấn\" margin_top=\"40px\" margin_bottom=\"22px\" size=\"113\"]\n\n[row]\n\n[col span__sm=\"12\"]\n\n[contact-form-7 id=\"707\"]\n\n\n[/col]\n\n[/row]","sidebar thiet ke","","publish","closed","closed","","sidebar-thiet-ke","","","2018-10-17 03:05:18","2018-10-17 03:05:18","","0","http://125.212.227.39/demo/?post_type=blocks&#038;p=444","0","blocks","","0"),
("460","1","2018-09-19 07:24:53","2018-09-19 07:24:53","[row style=\"large\" col_style=\"solid\"]\n\n[col span__sm=\"12\"]\n\n[block id=\"444\"]\n\n\n[/col]\n\n[/row]","sidebar tin tuc","","publish","closed","closed","","sidebar-tin-tuc","","","2018-09-27 11:04:23","2018-09-27 11:04:23","","0","http://125.212.227.39/demo/?post_type=blocks&#038;p=460","0","blocks","","0"),
("470","1","2018-09-19 08:05:36","2018-09-19 08:05:36","Việc lựa chọn nhà thầu thiết kế và thi công nội thất văn phòng chắc chắn cần phải được cân nhắc kĩ càng. Có nhiều ý kiến trái chiều cho rằng có nên hay không việc thuê một nhà thầu trọn gói cả 2 hạng mục này hoặc tách riêng ra cho 2 nhà thầu khác...","4 lý do nên thuê thiết kế và thi công nội thất văn phòng trọn gói","Việc lựa chọn nhà thầu thiết kế và thi công nội thất văn phòng chắc chắn cần phải được cân nhắc kĩ càng. Có nhiều ý kiến trái chiều...","publish","open","open","","4-ly-do-nen-thue-thiet-ke-va-thi-cong-noi-that-van-phong-tron-goi","","","2018-10-17 04:15:12","2018-10-17 04:15:12","","0","http://125.212.227.39/demo/?p=470","0","post","","0"),
("473","1","2018-09-19 08:08:33","2018-09-19 08:08:33","Kinh nghiệm quý giá trong bài viết này sẽ giúp các chủ đầu tư/ khách hàng chọn đúng và chính xác một Công ty thiết kế nội thất văn phòng chuyên nghiệp cho dự án hay ý định sắp xếp, bố trí một văn phòng làm việc đẹp và khoa học với cách trang trí độc...","Cách chọn công ty thiết kế văn phòng chuyên nghiệp vừa ý","Kinh nghiệm quý giá trong bài viết này sẽ giúp các chủ đầu tư/ khách hàng chọn đúng và chính xác một Công ty...","publish","open","open","","cach-chon-cong-ty-thiet-ke-van-phong-chuyen-nghiep-vua-y","","","2018-10-17 04:15:02","2018-10-17 04:15:02","","0","http://125.212.227.39/demo/?p=473","0","post","","0"),
("475","1","2018-09-19 08:10:04","2018-09-19 08:10:04","Trong phong thủy, Mộc và Thủy được xem là những yếu tố có thể mang lại vận may và tiền tài. Một số mẹo nhỏ sau đây sẽ giúp đem lại may mắn cũng như tài lộc cho văn phòng bạn.","Cách săp xếp văn phòng theo phong thủy đem lại nhiều may mắn và tài lộc","Trong phong thủy, Mộc và Thủy được xem là những yếu tố có thể mang lại vận may và tiền tài. Một số mẹo nhỏ sau đây...","publish","open","open","","cach-sap-xep-van-phong-theo-phong-thuy-dem-lai-nhieu-may-man-va-tai-loc","","","2018-10-17 04:14:01","2018-10-17 04:14:01","","0","http://125.212.227.39/demo/?p=475","0","post","","0"),
("521","1","2018-09-22 10:20:05","2018-09-22 10:20:05","[row v_align=\"equal\" h_align=\"center\"]\n\n[col span=\"4\" span__sm=\"12\" padding=\"40px 0px 0px 0px\" align=\"center\" color=\"light\"]\n\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">NEWHOUSE - Home - Decor</span></h3>\n<p style=\"text-align: left;\"><span style=\"color: #000000;\">NEWHOUSE chỉ sử dụng duy nhất một địa chỉ email: nhamoidogo@gmail.com - nhamoinoithat@yahoo.com để liên hệ với khách hàng.</span><br /><span style=\"color: #000000;\">Mọi địa chỉ khác đều không hợp lệ v?không thuộc sự quản lý, điều hành của chúng tôi</span></p>\n\n[/col]\n[col span=\"4\" span__sm=\"12\" padding=\"40px 20px 0px 0px\" align=\"center\" color=\"light\"]\n\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">Thông Tin Liên Hệ</span></h3>\n<p style=\"text-align: left;\"><span style=\"color: #000000;\">Địa chỉ :Thôn 4, xã Chàng Sơn - H.Thạch thất - H?Nội</span><br /><span style=\"color: #000000;\">Điện thoại: <a href=\"tel:0352298233\">0352298233</a></span><br /><span style=\"color: #000000;\">Website: http://www.freelancerviet.net</span><br /><span style=\"color: #000000;\">Email:vuonganhduong812@gmail.com<br /></span></p>\n\n[/col]\n[col span=\"4\" span__sm=\"12\" padding=\"40px 0px 0px 0px\" align=\"center\"]\n\n<p><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3247607131048!2d105.80457331432396!3d21.019687686003255!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab6775d89b7b%3A0x61778fa3c0d5571c!2zQ8O0bmcgdHkgQ1AgVE0gdsOgIFhEIE5ow6AgTeG7m2k!5e0!3m2!1svi!2s!4v1537611886025\" width=\"100%\" height=\"300\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe></p>\n\n[/col]\n\n[/row]\n<div class=\"hotline\">\n<div id=\"phonering-alo-phoneIcon\" class=\"phonering-alo-phone phonering-alo-green phonering-alo-show\">\n<div class=\"phonering-alo-ph-circle\"></div>\n<div class=\"phonering-alo-ph-circle-fill\"></div>\n<div class=\"phonering-alo-ph-img-circle\"><a class=\"pps-btn-img \" title=\"Liên hệ\" href=\"tel:0986199952\"> <img src=\"wp-content/themes/freelancerviet.net/images/phone-ring.png\" alt=\"Liên hệ\" width=\"50\" class=\"img-responsive\"/> </a> </div>\n</div>\n</div>","footer","","publish","closed","closed","","footer","","","2019-04-03 16:21:24","2019-04-03 16:21:24","","0","http://125.212.227.39/demo/?post_type=blocks&#038;p=521","0","blocks","","0"),
("640","1","2018-09-23 14:30:57","2018-09-23 14:30:57","[row col_style=\"dashed\" col_bg=\"#52923c\"]\n\n[col span__sm=\"12\" margin=\"20px 0px 0px 0px\" align=\"center\" color=\"light\"]\n\n<h2>ĐỐI TÁC - KHÁCH HÀNG</h2>\n\n[/col]\n\n[/row]\n[ux_gallery ids=\"221,220,219,197,196,195,193,194\" style=\"default\" type=\"slider\" auto_slide=\"2000\"]","doi tac","","publish","closed","closed","","doi-tac","","","2018-09-27 16:20:13","2018-09-27 16:20:13","","0","http://125.212.227.39/demo/?post_type=blocks&#038;p=640","0","blocks","","0"),
("697","1","2018-09-26 09:12:10","2018-09-26 09:12:10","[blog_posts style=\"vertical\" type=\"row\" columns=\"1\" columns__md=\"1\" ids=\"698,701\" show_date=\"false\" excerpt_length=\"13\" image_height=\"50%\" image_width=\"22\" image_size=\"thumbnail\" image_hover=\"zoom\" text_align=\"left\" text_size=\"small\"]\n","y kien khach hang","","publish","closed","closed","","y-kien-khach-hang","","","2018-09-27 15:36:55","2018-09-27 15:36:55","","0","http://125.212.227.39/demo/?post_type=blocks&#038;p=697","0","blocks","","0"),
("698","1","2018-09-26 09:01:14","2018-09-26 09:01:14","","HĐQT CÔNG TY CỔ PHẦN Y DƯỢC TÂN TRƯỜNG SINH","Đây là một công trình lớn, chúng tôi đã cho thấy tác phong chuyên nghiệp cũng như những tư vấn...","publish","open","open","","hdqt-cong-ty-co-phan-y-duoc-tan-truong-sinh","","","2018-10-17 04:12:56","2018-10-17 04:12:56","","0","http://125.212.227.39/demo/?p=698","0","post","","0"),
("701","1","2018-09-26 09:02:21","2018-09-26 09:02:21","","BAN LÃNH ĐẠO CÔNG TY GHẠCH SECOIN","Chúng tôi muốn Showroom thể hiện rõ tâm huyết và niềm đam mê vô bờ đối với các sản phẩm gạch nghệ...","publish","open","open","","ban-lanh-dao-cong-ty-ghach-secoin","","","2018-10-17 04:12:39","2018-10-17 04:12:39","","0","http://125.212.227.39/demo/?p=701","0","post","","0"),
("821","1","2018-10-10 06:20:48","2018-10-10 06:20:48","","Sản phẩm","","publish","closed","closed","","821","","","2018-10-10 11:59:14","2018-10-10 11:59:14","","0","http://125.212.227.39/demo/821/","2","nav_menu_item","","0"),
("824","1","2018-10-10 06:21:58","2018-10-10 06:21:58"," ","","","publish","closed","closed","","824","","","2018-10-10 11:59:14","2018-10-10 11:59:14","","0","http://125.212.227.39/demo/824/","3","nav_menu_item","","0"),
("825","1","2018-10-10 06:22:00","2018-10-10 06:22:00"," ","","","publish","closed","closed","","825","","","2018-10-10 11:59:14","2018-10-10 11:59:14","","0","http://125.212.227.39/demo/825/","4","nav_menu_item","","0"),
("826","1","2018-10-10 06:22:00","2018-10-10 06:22:00"," ","","","publish","closed","closed","","826","","","2018-10-10 11:59:14","2018-10-10 11:59:14","","0","http://125.212.227.39/demo/826/","5","nav_menu_item","","0"),
("829","1","2018-10-10 06:32:19","2018-10-10 06:32:19","<h3>Liên hệ</h3>\n<p><strong>Email</strong>: vuonganhduong812@gmail.com<br /><strong>Điện thoại</strong>: <a href=\"tel:0352298233\">035 229 8233</a></p>","Đoạn liên hệ ngắn","","publish","closed","closed","","contact","","","2018-10-17 03:26:05","2018-10-17 03:26:05","","0","http://125.212.227.39/demo/?post_type=blocks&#038;p=829","0","blocks","","0"),
("871","1","2018-10-12 03:29:09","2018-10-12 03:29:09","","Bàn phòng khách - 1m","","publish","closed","closed","","san-pham-4-1m","","","2018-10-12 03:30:20","2018-10-12 03:30:20","","154","http://125.212.227.39/demo/san-pham/san-pham-4-2/","1","product_variation","","0"),
("873","1","2018-10-12 03:29:13","2018-10-12 03:29:13","","Bàn phòng khách - 2m","","publish","closed","closed","","san-pham-4-2m","","","2018-10-12 03:30:21","2018-10-12 03:30:21","","154","http://125.212.227.39/demo/san-pham/san-pham-4-2/","2","product_variation","","0"),
("874","1","2018-10-12 03:29:16","2018-10-12 03:29:16","","Bàn phòng khách - 3m","","publish","closed","closed","","san-pham-4-3m","","","2018-10-12 03:30:22","2018-10-12 03:30:22","","154","http://125.212.227.39/demo/san-pham/san-pham-4-2/","3","product_variation","","0"),
("875","1","2018-10-12 03:31:55","2018-10-12 03:31:55","mo ta san pham","Bàn phòng khách (Sao chép)","day la cai ban","publish","open","closed","","ban-phong-khach-sao-chep","","","2018-10-12 03:40:08","2018-10-12 03:40:08","","0","http://125.212.227.39/demo/?post_type=product&#038;p=875","0","product","","0"),
("876","1","2018-10-12 03:31:59","2018-10-12 03:31:59","","Bàn phòng khách (Sao chép) - 2m","","publish","closed","closed","","san-pham-4-1m-2","","","2018-10-12 03:40:08","2018-10-12 03:40:08","","875","http://125.212.227.39/demo/?post_type=product&#038;p=875","1","product_variation","","0"),
("877","1","2018-10-12 03:32:02","2018-10-12 03:32:02","","Bàn phòng khách (Sao chép) - 2.2m","","publish","closed","closed","","san-pham-4-2m-2","","","2018-10-12 03:38:21","2018-10-12 03:38:21","","875","http://125.212.227.39/demo/?post_type=product&#038;p=875","2","product_variation","","0"),
("878","1","2018-10-12 03:32:05","2018-10-12 03:32:05","","Bàn phòng khách (Sao chép) - 2.5m","","publish","closed","closed","","san-pham-4-3m-2","","","2018-10-12 03:38:22","2018-10-12 03:38:22","","875","http://125.212.227.39/demo/?post_type=product&#038;p=875","3","product_variation","","0"),
("885","1","2018-10-16 04:38:53","2018-10-16 04:38:53","","freelancerviet","","inherit","open","closed","","freelancerviet","","","2018-10-16 04:38:53","2018-10-16 04:38:53","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/freelancerviet.png","0","attachment","image/png","0"),
("886","1","2018-10-16 04:39:45","2018-10-16 04:39:45","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/cropped-freelancerviet.png","cropped-freelancerviet.png","","inherit","open","closed","","cropped-freelancerviet-png","","","2018-10-16 04:39:45","2018-10-16 04:39:45","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/cropped-freelancerviet.png","0","attachment","image/png","0"),
("890","1","2018-10-16 05:22:13","2018-10-16 05:22:13","","layers-2","","inherit","open","closed","","layers-2","","","2018-10-16 05:22:13","2018-10-16 05:22:13","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/layers-2.svg","0","attachment","image/svg+xml","0"),
("891","1","2018-10-16 05:22:16","2018-10-16 05:22:16","","O6DXT80-1024x1024","","inherit","open","closed","","o6dxt80-1024x1024","","","2018-10-16 05:22:16","2018-10-16 05:22:16","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/O6DXT80-1024x1024.jpg","0","attachment","image/jpeg","0"),
("892","1","2018-10-16 05:22:19","2018-10-16 05:22:19","","play-button","","inherit","open","closed","","play-button","","","2018-10-16 05:22:19","2018-10-16 05:22:19","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/play-button.svg","0","attachment","image/svg+xml","0"),
("893","1","2018-10-16 05:22:22","2018-10-16 05:22:22","","wifi","","inherit","open","closed","","wifi","","","2018-10-16 05:22:22","2018-10-16 05:22:22","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/wifi.svg","0","attachment","image/svg+xml","0"),
("894","1","2018-10-16 05:22:24","2018-10-16 05:22:24","","share","","inherit","open","closed","","share","","","2018-10-16 05:22:24","2018-10-16 05:22:24","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/share.svg","0","attachment","image/svg+xml","0"),
("895","1","2018-10-16 05:22:26","2018-10-16 05:22:26","","settings","","inherit","open","closed","","settings","","","2018-10-16 05:22:26","2018-10-16 05:22:26","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/settings.svg","0","attachment","image/svg+xml","0"),
("896","1","2018-10-16 05:22:28","2018-10-16 05:22:28","","cloud","","inherit","open","closed","","cloud","","","2018-10-16 05:22:28","2018-10-16 05:22:28","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/cloud.svg","0","attachment","image/svg+xml","0"),
("903","1","2018-10-16 05:42:20","2018-10-16 05:42:20","","Developing new program","Close-up image of coder typing on computer","inherit","open","closed","","developing-new-program","","","2018-10-16 05:42:20","2018-10-16 05:42:20","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/background.jpg","0","attachment","image/jpeg","0"),
("929","1","2018-10-17 03:47:14","2018-10-17 03:47:14","","banner1","","inherit","open","closed","","banner1","","","2018-10-17 03:47:14","2018-10-17 03:47:14","","0","http://localhost/wordpress_kickstart/wp-content/uploads/2018/10/banner1.jpg","0","attachment","image/jpeg","0"),
("948","1","2018-11-14 09:43:21","0000-00-00 00:00:00","","test","","draft","closed","closed","","","","","2018-11-14 09:43:21","0000-00-00 00:00:00","","0","http://localhost/wordpress_kickstart/?p=948","1","nav_menu_item","","0"),
("952","1","2019-04-03 16:21:24","2019-04-03 16:21:24","[row v_align=\"equal\" h_align=\"center\"]\n\n[col span=\"4\" span__sm=\"12\" padding=\"40px 0px 0px 0px\" align=\"center\" color=\"light\"]\n\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">NEWHOUSE - Home - Decor</span></h3>\n<p style=\"text-align: left;\"><span style=\"color: #000000;\">NEWHOUSE chỉ sử dụng duy nhất một địa chỉ email: nhamoidogo@gmail.com - nhamoinoithat@yahoo.com để liên hệ với khách hàng.</span><br /><span style=\"color: #000000;\">Mọi địa chỉ khác đều không hợp lệ v?không thuộc sự quản lý, điều hành của chúng tôi</span></p>\n\n[/col]\n[col span=\"4\" span__sm=\"12\" padding=\"40px 20px 0px 0px\" align=\"center\" color=\"light\"]\n\n<h3 style=\"text-align: left;\"><span style=\"color: #000000;\">Thông Tin Liên Hệ</span></h3>\n<p style=\"text-align: left;\"><span style=\"color: #000000;\">Địa chỉ :Thôn 4, xã Chàng Sơn - H.Thạch thất - H?Nội</span><br /><span style=\"color: #000000;\">Điện thoại: <a href=\"tel:0352298233\">0352298233</a></span><br /><span style=\"color: #000000;\">Website: http://www.freelancerviet.net</span><br /><span style=\"color: #000000;\">Email:vuonganhduong812@gmail.com<br /></span></p>\n\n[/col]\n[col span=\"4\" span__sm=\"12\" padding=\"40px 0px 0px 0px\" align=\"center\"]\n\n<p><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3247607131048!2d105.80457331432396!3d21.019687686003255!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab6775d89b7b%3A0x61778fa3c0d5571c!2zQ8O0bmcgdHkgQ1AgVE0gdsOgIFhEIE5ow6AgTeG7m2k!5e0!3m2!1svi!2s!4v1537611886025\" width=\"100%\" height=\"300\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe></p>\n\n[/col]\n\n[/row]\n<div class=\"hotline\">\n<div id=\"phonering-alo-phoneIcon\" class=\"phonering-alo-phone phonering-alo-green phonering-alo-show\">\n<div class=\"phonering-alo-ph-circle\"></div>\n<div class=\"phonering-alo-ph-circle-fill\"></div>\n<div class=\"phonering-alo-ph-img-circle\"><a class=\"pps-btn-img \" title=\"Liên hệ\" href=\"tel:0986199952\"> <img src=\"wp-content/themes/freelancerviet.net/images/phone-ring.png\" alt=\"Liên hệ\" width=\"50\" class=\"img-responsive\"/> </a> </div>\n</div>\n</div>","footer","","inherit","closed","closed","","521-revision-v1","","","2019-04-03 16:21:24","2019-04-03 16:21:24","","521","http://localhost/wordpress_kickstart/521-revision-v1/","0","revision","","0");




CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_term_relationships VALUES
("1","1","0"),
("67","2","0"),
("154","6","0"),
("154","17","0"),
("276","2","0"),
("287","2","0"),
("298","1","0"),
("301","2","0"),
("470","1","0"),
("473","1","0"),
("475","1","0"),
("698","1","0"),
("701","1","0"),
("821","2","0"),
("824","2","0"),
("825","2","0"),
("826","2","0"),
("875","6","0"),
("875","17","0");




CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_term_taxonomy VALUES
("1","1","category","","0","7"),
("2","2","nav_menu","","0","8"),
("3","3","nav_menu","","0","0"),
("4","4","product_type","","0","0"),
("5","5","product_type","","0","0"),
("6","6","product_type","","0","2"),
("7","7","product_type","","0","0"),
("8","8","product_visibility","","0","0"),
("9","9","product_visibility","","0","0"),
("10","10","product_visibility","","0","0"),
("11","11","product_visibility","","0","0"),
("12","12","product_visibility","","0","0"),
("13","13","product_visibility","","0","0"),
("14","14","product_visibility","","0","0"),
("15","15","product_visibility","","0","0"),
("16","16","product_visibility","","0","0"),
("17","17","product_cat","","0","2"),
("21","21","product_cat","","0","0"),
("22","22","product_cat","","0","0"),
("24","24","product_cat","","0","0"),
("25","25","product_cat","","0","0"),
("27","27","product_cat","","0","0");




CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_termmeta VALUES
("8","21","order","5"),
("9","21","display_type",""),
("10","21","thumbnail_id","106"),
("18","21","product_count_product_cat","0"),
("20","17","product_count_product_cat","2"),
("21","17","cat_meta","a:2:{s:10:\"cat_header\";s:0:\"\";s:10:\"cat_footer\";s:0:\"\";}"),
("22","17","display_type",""),
("23","17","thumbnail_id","105"),
("24","21","cat_meta","a:2:{s:10:\"cat_header\";s:0:\"\";s:10:\"cat_footer\";s:0:\"\";}"),
("25","22","order","6"),
("26","22","display_type",""),
("27","22","thumbnail_id","107"),
("28","22","cat_meta",""),
("29","22","product_count_product_cat","0"),
("33","24","order","2"),
("34","24","display_type",""),
("35","24","thumbnail_id","109"),
("36","25","order","3"),
("37","25","display_type",""),
("38","25","thumbnail_id","110"),
("40","24","product_count_product_cat","0"),
("41","25","product_count_product_cat","0"),
("42","17","order","4"),
("43","24","cat_meta","a:2:{s:10:\"cat_header\";s:0:\"\";s:10:\"cat_footer\";s:0:\"\";}"),
("44","27","order","0"),
("45","27","display_type",""),
("46","27","thumbnail_id","106"),
("47","27","product_count_product_cat","0"),
("48","27","cat_meta","a:2:{s:10:\"cat_header\";s:0:\"\";s:10:\"cat_footer\";s:0:\"\";}");




CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_terms VALUES
("1","tin tức","tin-tuc","0"),
("2","menu1","menu1","0"),
("3","menu2","menu2","0"),
("4","simple","simple","0"),
("5","grouped","grouped","0"),
("6","variable","variable","0"),
("7","external","external","0"),
("8","exclude-from-search","exclude-from-search","0"),
("9","exclude-from-catalog","exclude-from-catalog","0"),
("10","featured","featured","0"),
("11","outofstock","outofstock","0"),
("12","rated-1","rated-1","0"),
("13","rated-2","rated-2","0"),
("14","rated-3","rated-3","0"),
("15","rated-4","rated-4","0"),
("16","rated-5","rated-5","0"),
("17","Đèn","den-trang-tri","0"),
("21","Ghế","ghe","0"),
("22","Kệ ti vi","ke-ti-vi","0"),
("24","Bàn","ban","0"),
("25","Sofa","sofa","0"),
("27","Tủ","tu","0");




CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_usermeta VALUES
("1","1","nickname","chinh chinh"),
("2","1","first_name","Vương Thị"),
("3","1","last_name","Uyên"),
("4","1","description",""),
("5","1","rich_editing","true"),
("6","1","syntax_highlighting","true"),
("7","1","comment_shortcuts","false"),
("8","1","admin_color","fresh"),
("9","1","use_ssl","0"),
("10","1","show_admin_bar_front","true"),
("11","1","locale",""),
("12","1","wp_capabilities","a:1:{s:13:\"administrator\";b:1;}"),
("13","1","wp_user_level","10"),
("14","1","dismissed_wp_pointers","wp496_privacy,theme_editor_notice"),
("15","1","show_welcome_panel","1"),
("16","1","session_tokens","a:1:{s:64:\"d8ddea5cad9c0cff8fa476368ef91f15a676eb9ca612903de6002ff8ed393b9e\";a:4:{s:10:\"expiration\";i:1554479667;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0\";s:5:\"login\";i:1554306867;}}"),
("17","1","wp_dashboard_quick_press_last_post_id","949"),
("18","1","wp_user-settings","libraryContent=browse&hidetb=1&editor_plain_text_paste_warning=2&editor=tinymce&posts_list_mode=excerpt"),
("19","1","wp_user-settings-time","1551110028"),
("20","1","managenav-menuscolumnshidden","a:4:{i:0;s:11:\"link-target\";i:1;s:15:\"title-attribute\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}"),
("21","1","metaboxhidden_nav-menus","a:7:{i:0;s:20:\"add-post-type-blocks\";i:1;s:27:\"add-post-type-featured_item\";i:2;s:12:\"add-post_tag\";i:3;s:15:\"add-post_format\";i:4;s:20:\"add-block_categories\";i:5;s:26:\"add-featured_item_category\";i:6;s:21:\"add-featured_item_tag\";}"),
("22","1","nav_menu_recently_edited","2"),
("23","1","closedpostboxes_nav-menus","a:0:{}"),
("25","1","wc_last_active","1554249600"),
("27","1","last_update","1536158922"),
("28","1","billing_first_name","Vương Thị"),
("29","1","billing_last_name","Uyên"),
("30","1","billing_company","1992"),
("31","1","billing_address_1","10"),
("32","1","billing_city","1"),
("33","1","billing_country","VN"),
("34","1","billing_email","bhiuvad@gmail.com"),
("35","1","billing_phone","7686868"),
("36","1","shipping_method",""),
("38","1","_woocommerce_persistent_cart_1","a:1:{s:4:\"cart\";a:1:{s:32:\"e85a48a5f526c53171ea6c8e484d2aae\";a:11:{s:3:\"key\";s:32:\"e85a48a5f526c53171ea6c8e484d2aae\";s:10:\"product_id\";i:154;s:12:\"variation_id\";i:871;s:9:\"variation\";a:1:{s:20:\"attribute_kich-thuoc\";s:2:\"1m\";}s:8:\"quantity\";i:2;s:9:\"data_hash\";s:32:\"5c842a409a59e40ad6c60e6980df02a6\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:6000000;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:6000000;s:8:\"line_tax\";i:0;}}}"),
("39","1","closedpostboxes_product","a:0:{}"),
("40","1","metaboxhidden_product","a:2:{i:0;s:10:\"postcustom\";i:1;s:7:\"slugdiv\";}"),
("41","1","manageedit-product_catcolumnshidden","a:1:{i:0;s:6:\"handle\";}"),
("42","1","edit_product_cat_per_page","20"),
("43","1","closedpostboxes_post","a:0:{}"),
("44","1","metaboxhidden_post","a:5:{i:0;s:13:\"trackbacksdiv\";i:1;s:10:\"postcustom\";i:2;s:16:\"commentstatusdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}"),
("45","1","community-events-location","a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}"),
("47","1","jetpack_tracks_wpcom_id",""),
("48","1","jetpack_tracks_anon_id","jetpack:XOL6mJWqFGTYVxZFaEDtPkDO"),
("49","1","dismissed_no_secure_connection_notice","1"),
("50","1","dismissed_template_files_notice","1"),
("51","1","edit_post_per_page","10"),
("52","1","tgmpa_dismissed_notice_tgmpa","1"),
("53","1","show_try_gutenberg_panel","0");




CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_users VALUES
("1","admin1","e9e83cf61621879be065f45a33a22ea2","Freelancerviet.net","duongva91@gmail.com","","2018-09-03 15:02:35","","0","Freelancerviet.net");




CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`),
  CONSTRAINT `fk_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `wp_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_woocommerce_order_itemmeta VALUES
("1","1","_product_id","144"),
("2","1","_variation_id","0"),
("3","1","_qty","1"),
("4","1","_tax_class",""),
("5","1","_line_subtotal","3000000"),
("6","1","_line_subtotal_tax","0"),
("7","1","_line_total","3000000"),
("8","1","_line_tax","0"),
("9","1","_line_tax_data","a:2:{s:5:\"total\";a:0:{}s:8:\"subtotal\";a:0:{}}");




CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO wp_woocommerce_order_items VALUES
("1","san pham 1","line_item","149");




CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_key`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;