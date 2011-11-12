<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" manifest="cache-manifest">
<head>
    <title>BussTiderna</title>
    
    <link rel="shortcut icon" href="{"img/Icon.png"|cdn}" />
    <link rel="stylesheet" type="text/css" href="{"bt.css"|cdn}" />
    <link rel="apple-touch-icon" href="{"img/Icon-Apple.png"|cdn}" />
    
    <script type="text/javascript">
        function cdn(url) {
            return '{""|cdn}' + url;
        }
    </script>
    
    <script type="text/javascript" src="js"></script>
    
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, width=device-width" />
    
</head>
{if !isset($mobile)}
<body>

<div class="site">
    <div class="header">
        
    </div>
    <div class="content">
        
{/if}