<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv("WP_DB_NAME"));

/** Database username */
define( 'DB_USER', getenv("WP_DB_ADMIN_USER"));

/** Database password */
define( 'DB_PASSWORD', getenv("WP_DB_ADMIN_PASS") );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'mDm]W}$&J-tw+h!Wk{u[/e7j;yW`]b99/|2)h6->X9AE|eD@;C|hw|!gcU+]&|//');
define('SECURE_AUTH_KEY',  '?iV`_iosdkp!@AWB&]hE!WbZ:8.XSBh7JNWfG<-LF]fK#m#=h#y`JdcV+^]S1=bd');
define('LOGGED_IN_KEY',    'Hgc5vm`V&<=lNS5_WWzKy@-6Xf_>M8vS0Xn5&iY)BZiwP$h0Kz-M|g&k>.3(?;)p');
define('NONCE_KEY',        ',[(5JtmhWCo7XyW2nfMIPn_0fO%v9Zw5P=bKJu;@08y9]#lgr2ZFs|%pC5mcK;<.');
define('AUTH_SALT',        '-EZ8VOvf$-b{Za~|bJ|--u|nqIA| tFJMlsO_[KE@%IO8Z?JY<igHrl6^8>W5<oe');
define('SECURE_AUTH_SALT', '3dgS|NLzwB.^&pg +7+OL&<|Jr-st0xUVf?~(8Ue4_;I!FR6h>x}q79(YB1w_?hl');
define('LOGGED_IN_SALT',   '$rf54=:1xbu#!r3A)^[>aX3jIhRVX({0/ j;g .g}h|++K-_`W[2><*3+&^SA%?z');
define('NONCE_SALT',       '*yXm!KJP~q:V;aj+kM>3w-NYUjrbDAk-a`<@&RvBrb$yEzo p9{|[CMPk1_D-.A/');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

