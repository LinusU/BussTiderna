<?php

/* Requirements */
require_once '/opt/Buzzmix/require.php';

/* Create the Buzzmix */
$site = new Buzzmix(dirname(__FILE__) . '/..');

/* Point out the plugins */
$site->plugins_dir[] = dirname(__FILE__) . '/../plugins/';

/* Set header and footer */
$site->header_tpl = 'header.tpl';
$site->footer_tpl = 'footer.tpl';

/* Setup the MySQL Database */
//$site->mysql_setup("localhost", "orkafota", "orkafota", "orkafota");

/* What is the user requesting? */
$pos = strpos($_SERVER['REQUEST_URI'], basename(__FILE__));

if($pos === false) {
    $uri = $_SERVER['REQUEST_URI'];
} else {
    $uri = substr($_SERVER['REQUEST_URI'], $pos + strlen(basename(__FILE__)));
}
/**/

/* Fix for jQueryUI */
if(substr($uri, 0, 8) == "/images/") {
    $uri = "img," . substr($uri, 8);
}

/* Try to handle the users request */
if($site->handle_request($uri) === false) {
    $site->handle_request("home");
}
