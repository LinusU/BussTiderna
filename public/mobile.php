<?php

if(trim($_SERVER['REQUEST_URI'], "/") == "") {
    $_SERVER['REQUEST_URI'] = 'mobile';
}

require (dirname(__FILE__) . '/index.php');
