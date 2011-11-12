<?php

$smarty->contentType('text', 'cache-manifest');

$cdn = "http://cdn." . (substr($_SERVER['HTTP_HOST'], 0, 2) == "m."?substr($_SERVER['HTTP_HOST'], 2):$_SERVER['HTTP_HOST']) . "/";

?>
CACHE MANIFEST

<?php
if($_SERVER['REMOTE_ADDR'] == "127.0.0.1") {
    echo '# TIME ' . time() . PHP_EOL;
} else {
    echo '# COMMIT ' . shell_exec('git rev-parse HEAD');
}
?>

/js
<?php echo $cdn; ?>/bt.css

<?php echo $cdn; ?>/img/ajax-loader.gif
<?php echo $cdn; ?>/img/arrows.png
<?php echo $cdn; ?>/img/clockBG.png

<?php echo $cdn; ?>/img/clockD0.png
<?php echo $cdn; ?>/img/clockD1.png
<?php echo $cdn; ?>/img/clockD2.png
<?php echo $cdn; ?>/img/clockD3.png
<?php echo $cdn; ?>/img/clockD4.png
<?php echo $cdn; ?>/img/clockD5.png
<?php echo $cdn; ?>/img/clockD6.png
<?php echo $cdn; ?>/img/clockD7.png
<?php echo $cdn; ?>/img/clockD8.png
<?php echo $cdn; ?>/img/clockD9.png

<?php echo $cdn; ?>/img/clockU0.png
<?php echo $cdn; ?>/img/clockU1.png
<?php echo $cdn; ?>/img/clockU2.png
<?php echo $cdn; ?>/img/clockU3.png
<?php echo $cdn; ?>/img/clockU4.png
<?php echo $cdn; ?>/img/clockU5.png
<?php echo $cdn; ?>/img/clockU6.png
<?php echo $cdn; ?>/img/clockU7.png
<?php echo $cdn; ?>/img/clockU8.png
<?php echo $cdn; ?>/img/clockU9.png

<?php echo $cdn; ?>/img/Icon-Apple.png
<?php echo $cdn; ?>/img/Icon.png
<?php echo $cdn; ?>/img/top.png

<?php echo $cdn; ?>/img/ui-bg_flat_0_aaaaaa_40x100.png
<?php echo $cdn; ?>/img/ui-bg_flat_55_fbec88_40x100.png
<?php echo $cdn; ?>/img/ui-bg_glass_75_d0e5f5_1x400.png
<?php echo $cdn; ?>/img/ui-bg_glass_85_dfeffc_1x400.png
<?php echo $cdn; ?>/img/ui-bg_glass_95_fef1ec_1x400.png
<?php echo $cdn; ?>/img/ui-bg_gloss-wave_55_5c9ccc_500x100.png
<?php echo $cdn; ?>/img/ui-bg_inset-hard_100_f5f8f9_1x100.png
<?php echo $cdn; ?>/img/ui-bg_inset-hard_100_fcfdfd_1x100.png
<?php echo $cdn; ?>/img/ui-icons_217bc0_256x240.png
<?php echo $cdn; ?>/img/ui-icons_2e83ff_256x240.png
<?php echo $cdn; ?>/img/ui-icons_469bdd_256x240.png
<?php echo $cdn; ?>/img/ui-icons_6da8d5_256x240.png
<?php echo $cdn; ?>/img/ui-icons_cd0a0a_256x240.png
<?php echo $cdn; ?>/img/ui-icons_d8e7f3_256x240.png
<?php echo $cdn; ?>/img/ui-icons_f9bd01_256x240.png

NETWORK:
/search
