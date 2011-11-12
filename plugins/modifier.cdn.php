<?php

function smarty_modifier_cdn($url) {
    return "http://cdn." . (substr($_SERVER['HTTP_HOST'], 0, 2) == "m."?substr($_SERVER['HTTP_HOST'], 2):$_SERVER['HTTP_HOST']) . "/" . $url;
}
