<?php

header('Content-Type: text/json; charset=utf-8');

if(!isset($_REQUEST['term']) or strlen($_REQUEST['term']) == 0) {
    die(0);
}

$replace = array(
    array('å', 'ä', 'ö', 'Å', 'Ä', 'Ö'),
    array('&aring;', '&auml;', '&ouml', '&Aring;', '&Auml;', '&Ouml')
);

$db = new SQLite3(dirname(__FILE__) . '/../stops.sqlite');

$term = $_REQUEST['term'];

$data = $db->query(sprintf(
    "SELECT * FROM `stops` WHERE `label` LIKE '%s%%'",
    $db->escapeString($term)
));

$first = true;

echo "[";

while($row = $data->fetchArray(SQLITE3_ASSOC)) {
    if($first) { $first = false; } else { echo ", "; }
    echo json_encode($row);
}

if($first) {
    $data = $db->query(sprintf(
        "SELECT * FROM `stops` WHERE `label` LIKE '%%%s%%'",
        $db->escapeString($term)
    ));
    
    while($row = $data->fetchArray(SQLITE3_ASSOC)) {
        if($first) { $first = false; } else { echo ", "; }
        echo json_encode($row);
    }
    
}

echo "]";
