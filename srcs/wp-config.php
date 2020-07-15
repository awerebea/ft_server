<?php
 /**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'site_db' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '28KErS!kx|vza+.%8m).{8kSz6o]>la7=M8N9xu@E:3g5/()YpWe6r6&r1IRpnU=');
define('SECURE_AUTH_KEY',  '-#6Ij/}oz;}=iq^L.,AUr/S8-,`;cTs%{{nCHcYyRu])o(5w$Z3cwu.(|B7y#~zq');
define('LOGGED_IN_KEY',    '$[^_M- *` ]J~{?E(Ps=,ow,QWB5GKKbo}!P`1>o%t/?FHnuo,ec`27eGz3xU-Dl');
define('NONCE_KEY',        '2LQQP[>x<Q~59B;A<Xyox bAVe:K* eBsz%!EGeN%v#`Y,GMH4kzi%ho yf1}3G4');
define('AUTH_SALT',        '{_Q=G5+uIbpvh^fR^Xi2~tU4I&-0D&585FH<h|ApVqZ*dtn~znX.d*F,Z;_ugnzG');
define('SECURE_AUTH_SALT', 'RE$M8iwT!q=*MO&^4-I-t0g@<ZZWT<mQ{0_V}P^6oV:a|I^W3Sh[1:tA|%{g_<O<');
define('LOGGED_IN_SALT',   'cF/9ct8)tK/QH*VvBe?;3eiQ9h0_l#241E=kQ%rry0Z/,|<E7K]n!rgwwegB5V+g');
define('NONCE_SALT',       '*yun+spN&c9Oy8kv(v+R,s)Xd_5{T/L=@LJkE.xs3U78}LHI{+Sam%8-_m[ArdaB');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
