<?php

$smarty->contentType('text', 'javascript');

$dir = dirname(__FILE__) . '/../js';

include "$dir/jquery-1.6.2.min.js";
include "$dir/jquery-ui-1.8.5.custom.min.js";

include "$dir/flipclock.js";
