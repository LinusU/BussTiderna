<?php

function search($db, $term, $strict = true) {
    if($strict) {
        return $db->query(sprintf(
            "SELECT * FROM `stops` WHERE `label` LIKE '%s%%' OR `label` LIKE '%%/ %s%%' OR `label` LIKE '%%/%s%%' OR `label` LIKE '%%(%s%%' ORDER BY `priority` DESC LIMIT 12",
            $db->escapeString($term), $db->escapeString($term), $db->escapeString($term), $db->escapeString($term)
        ));
    } else {
        $data = $db->query(sprintf(
            "SELECT * FROM `stops` WHERE `label` LIKE '%%%s%%' ORDER BY `priority` DESC LIMIT 12",
            $db->escapeString($term)
        ));
    }
}

function sqprint($data, $first = true) {
    
    $row = $data->fetchArray(SQLITE3_ASSOC);
    
    if(!$row) {
        return !$first;
    }
    
    if(!$first) { echo ", "; }
    
    echo json_encode($row);
    
    return sqprint($data, false);
}

$smarty->contentType('text', 'json');

if(!isset($_REQUEST['term']) or strlen($_REQUEST['term']) == 0) {
    die(0);
}

$db = new SQLite3(dirname(__FILE__) . '/../stops.sqlite');
$term = $_REQUEST['term'];

echo "[";

if(!sqprint(search($db, $term, true))) {
    sqprint(search($db, $term, false));
}

echo "]";
