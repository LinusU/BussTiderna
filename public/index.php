<?php

/* Requirements */
require_once (dirname(__FILE__) . '/../lib/Buzzmix/require.php');

/* Create the Buzzmix */
$site = new Buzzmix(dirname(__FILE__) . '/..');

/* Set header and footer */
$site->setHeader('header.tpl');
$site->setFooter('footer.tpl');

/* Try to handle the users request */
$site->handleRequest($_SERVER['REQUEST_URI']);
