<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" manifest="cache-manifest">
<head>
    <title>BussTiderna</title>
    
    <link rel="shortcut icon" href="img,Icon.png" />
    <link rel="stylesheet" type="text/css" href="css" />
    <link rel="apple-touch-icon" href="img,Icon-Apple.png" />
    
    <script type="text/javascript" src="js"></script>
    
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, width=device-width" />
    
</head>
<body class="mobile">

<h1> BussTiderna<span>.se</span> </h1>

{include file="snippets/dialog.tpl"}

<div id="inputs">
    
    <h2> Från: </h2>
    <input type="text" tabindex="1" id="fr" />
    
    <h2> Till: </h2>
    <input type="text" tabindex="2" id="to" />
    
    <div id="timing" style="display: none;">
        
        <div id="date"></div>
        
        <div class="arrows up">
            <div id="H0U"></div>
            <div id="H1U"></div>
            <div id="M0U" style="margin-left: 16px;"></div>
            <div id="M1U"></div>
        </div>
        
        <div class="clocks">
            <div id="clockH0"></div>
            <div id="clockH1"></div>
            <div id="clockM0" style="margin-left: 16px;"></div>
            <div id="clockM1"></div>
        </div>
        
        <div class="arrows down">
            <div id="H0D"></div>
            <div id="H1D"></div>
            <div id="M0D" style="margin-left: 16px;"></div>
            <div id="M1D"></div>
        </div>
        
    </div>
    
    <button onclick="timing();" id="btnT" tabindex="4"> Datum och tid: <span id="datetime">nu</span> </button>
    <button onclick="search();" id="btnS" tabindex="3"> Sök </button>
    
</div>

{include file="snippets/vlform.tpl"}

<button id="btnN" style="display: none;" onclick="revert();">Ny sökning</button>

<div class="mobile-vl">
    <iframe name="vl" class="vl" onload="if(window.loaded) loaded();"></iframe>
</div>

{include file="snippets/script.tpl"}

{literal}
<script type="text/javascript">
    
    $(window).resize(function () {
        $('#fr, #to, #btnS, #btnT, #btnN').each(function () {
            $(this).width($(window).width() - ($(this).outerWidth(true) - $(this).width()));
        });
    });
    
    $(window).resize();
    
</script>
{/literal}

</body>
</html>