
<div id="dialog">
    
    <p>
        <img src="img,ajax-loader.gif" alt="" />
        Vänligen vänta, sökning pågår.
    </p>
    
</div>

<div id="inputs">
    
    <div style="overflow: auto;">
        
        <div class="half">
            <h1> Från: </h1>
            <input type="text" tabindex="1" id="fr" />
        </div>
        
        <div class="half">
            <h1> Till: </h1>
            <input type="text" tabindex="2" id="to" />
        </div>
        
    </div>
    
    <div id="timing" style="display: none;">
        
        <div class="half h280">
            <div id="date"></div>
        </div>
        
        <div class="half h280p">
            
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
        
    </div>
    
    <button onclick="timing();" id="btnT" tabindex="4"> Datum och tid: <span id="datetime">nu</span> </button>
    <button onclick="search();" id="btnS" tabindex="3"> Sök </button>
    
</div>


<form action="http://193.45.213.123/ltt/web2elmer/resultspage.asp" method="post" target="vl" id="vl">
    
    <input type="hidden" name="selPointFr" id="Ifr" />
    <input type="hidden" name="selPointTo" id="Ito" />
    
    <input type="hidden" name="inpTime" value="1200" id="Ihhmm" />
    
    <input type="hidden" name="selDay" value="9" id="Idd" />
    <input type="hidden" name="selMonth" value="10" id="Imm" />
    <input type="hidden" name="selYear" value="10" id="Iyy" />
    
    <input type="hidden" name="selDirection" value="0" />
    
    <input type="hidden" name="TrafficMask" value="1" />
    <input type="hidden" name="TrafficMask" value="2" />
    <input type="hidden" name="TrafficMask" value="3" />
    
    <input type="hidden" name="selChangeTime" value="0" />
    <input type="hidden" name="selPriority" value="0" />
    
    <input type="hidden" name="cmdAction" value="search" />
    <input type="hidden" name="SupportsScript" value="True" />
    <input type="hidden" name="Language" value="sv" />
    <input type="hidden" name="VerNo" value="1.2.0.3" />
    <input type="hidden" name="Source" value="querypage_adv" />
    
</form>

<button id="btnN" onclick="revert();">Ny sökning</button>

<iframe name="vl" class="vl" onload="if(window.loaded) loaded();"></iframe>

{literal}
<script type="text/javascript">
    
    $('#fr').focus();
    
    function pad00(n) {
        if(n < 10) {
            return "0" + n
        } else {
            return n;
        }
    }
    
    function search() {
        setTimeout(function () {
            $('#vl').submit();
            $('#inputs').slideUp();
            $('iframe.vl').animate({height: 600 + 'px'});
            $('#dialog').dialog("open");
        }, 1);
    }
    
    function timing() {
        $('#timing').slideToggle();
    }
    
    function datetime() {
        var d = $('#date').datepicker("getDate");
        $('#datetime').html("");
        $('#datetime').append(d.getFullYear() + "-");
        $('#datetime').append(pad00(d.getMonth() + 1) + "-");
        $('#datetime').append(pad00(d.getDate()) + " ");
        var h = $('#clockH1').flipclock("value");
        var m = $('#clockM1').flipclock("value");
        $('#datetime').append(pad00(h) + ":");
        $('#datetime').append(pad00(m));
        $('#Ihhmm').attr('value', pad00(h) + "" + pad00(m));
    }
    
    function loaded() {
        if($('#dialog').dialog("isOpen")) {
            $('#dialog').dialog("close");
            $('iframe.vl').animate({opacity: 1});
            $('#btnN').fadeIn();
        }
    }
    
    function revert() {
        $('#btnN').fadeOut();
        $('#inputs').slideDown();
        $('iframe.vl').animate({height: 0 + 'px', opacity: 0});
        setTimeout(function () { $('#fr').focus(); $('#fr').select(); }, 1);
    }
    
    function populate(element, item) {
        $('#' + element).attr('value', item.label);
        var html = item.label.replace(
            /[åäöÅÄÖ]/g,
            function (c) { switch(c) {
                case 'å': return '&aring;';
                case 'ä': return '&auml;';
                case 'ö': return '&ouml;';
                case 'Å': return '&Aring;';
                case 'Ä': return '&Auml;';
                case 'Ö': return '&Ouml;';
                default: return c;
            }}
        );
        $('#I' + element).attr('value', html + "|" + item.value);
        if(element == "fr") { setTimeout(function () { $('#to').focus(); $('#to').select(); }, 1); }
        if(element == "to") { setTimeout(function () { $('button').focus(); }, 1); }
        return true;
    }
    
    $('#fr').autocomplete({
        delay: 0,
        source: "search",
        selectFirst: true,
        select: function (event, ui) {
            return !populate('fr', ui.item);
        }
    });
    
    $('#to').autocomplete({
        delay: 0,
        source: "search",
        selectFirst: true,
        select: function (event, ui) {
            return !populate('to', ui.item);
        }
    });
    
    $('#date').datepicker({
        firstDay: 1,
        minDate: new Date(),
        dateFormat: "dd|mm|yy",
        onSelect: function (dateText, inst) {
            var p = dateText.split("|");
            if(p[2].length == 4) { p[2] = p[2].substring(2, 4); }
            $('#Idd').attr('value', p[0]);
            $('#Imm').attr('value', p[1]);
            $('#Iyy').attr('value', p[2]);
            datetime();
        }
    });
    
    $('#btnT').button({icons: {primary: "ui-icon-calendar"}});
    $('#btnS').button({icons: {secondary: "ui-icon-search"}});
    $('#btnN').button({icons: {secondary: "ui-icon-search"}});
    
    $('#dialog').dialog({
        autoOpen: false,
        closeOnEscape: false,
        draggable: true,
        hide: 'fade',
        modal: true,
        resizable: false,
        show: 'fade',
        title: 'Var god dröj...'
    });
    
    $('#clockH0').flipclock();
    $('#clockH1').flipclock({next: "#clockH0"});
    
    $('#clockM0').flipclock();
    $('#clockM1').flipclock({next: "#clockM0"});
    
    $('#H0U').click(function () { $('#clockH1').flipclock("flip", ($('#clockH1').flipclock("value") + 10) % 24); datetime(); });
    $('#H1U').click(function () { $('#clockH1').flipclock("flip", ($('#clockH1').flipclock("value") + 1) % 24); datetime(); });
    
    $('#M0U').click(function () { $('#clockM1').flipclock("flip", ($('#clockM1').flipclock("value") + 10) % 60); datetime(); });
    $('#M1U').click(function () { $('#clockM1').flipclock("flip", ($('#clockM1').flipclock("value") + 5) % 60); datetime(); });
    
    $('#H0D').click(function () { $('#clockH1').flipclock("flip", ($('#clockH1').flipclock("value") + 14) % 24); datetime(); });
    $('#H1D').click(function () { $('#clockH1').flipclock("flip", ($('#clockH1').flipclock("value") + 23) % 24); datetime(); });
    
    $('#M0D').click(function () { $('#clockM1').flipclock("flip", ($('#clockM1').flipclock("value") + 50) % 60); datetime(); });
    $('#M1D').click(function () { $('#clockM1').flipclock("flip", ($('#clockM1').flipclock("value") + 55) % 60); datetime(); });
    
    var d = new Date();
    
    $('#clockH1').flipclock("flip", d.getHours());
    $('#clockM1').flipclock("flip", Math.floor(d.getMinutes() / 5.0) * 5);
    
    delete d;
    
    /*
    * jQuery UI Autocomplete Select First Extension
    *
    * Copyright 2010, Scott González (http://scottgonzalez.com)
    * Dual licensed under the MIT or GPL Version 2 licenses.
    *
    * http://github.com/scottgonzalez/jquery-ui-extensions
    */
    (function( $ ) {
        
        $( ".ui-autocomplete-input" ).live( "autocompleteopen", function() {
            var autocomplete = $( this ).data( "autocomplete" ),
                menu = autocomplete.menu;
            
            if ( !autocomplete.options.selectFirst ) {
                return;
            }
            
            menu.activate( $.Event({ type: "mouseenter" }), menu.element.children().first() );
        });
        
    }( jQuery ));
    
    datetime();
    
</script>
{/literal}
