<?php

header('Content-Type: text/json; charset=utf-8');

if(!isset($_REQUEST['term']) or strlen($_REQUEST['term']) == 0) {
    die(0);
}

$db = new SQLite3(dirname(__FILE__) . '/../stops.sqlite');

$term = $_REQUEST['term'];

$data = $db->query(sprintf(
    "SELECT * FROM `stops` WHERE `label` LIKE '%s%%' OR `label` LIKE '%%/ %s%%' ORDER BY `priority` DESC",
    $db->escapeString($term), $db->escapeString($term)
));

$first = true;

echo "[";

while($row = $data->fetchArray(SQLITE3_ASSOC)) {
    if($first) { $first = false; } else { echo ", "; }
    echo json_encode($row);
}

if($first) {
    $data = $db->query(sprintf(
        "SELECT * FROM `stops` WHERE `label` LIKE '%%%s%%' ORDER BY `priority` DESC",
        $db->escapeString($term)
    ));
    
    while($row = $data->fetchArray(SQLITE3_ASSOC)) {
        if($first) { $first = false; } else { echo ", "; }
        echo json_encode($row);
    }
    
}

echo "]";
