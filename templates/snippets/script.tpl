
{literal}
<script type="text/javascript">
    
    $('#fr').focus();
    
    function pad00(n) { return (n<10?"0"+n:n); }
    
    function timing() { $('#timing').slideToggle(); }
    
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
        $('#result, #from-to').slideUp(function () {
            $('#result tr').slice(1).remove();
        });
        $('iframe.vl').animate({height: 0 + 'px', opacity: 0});
        setTimeout(function () {
            $('#fr').focus();
            $('#fr').select();
            $('#btnS').removeClass("ui-state-hover");
            $('#btnS').removeClass("ui-state-active");
        }, 1);
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
        $('#I' + element).attr('value', html + "|" + item.value + "|1");
        if(element == "fr") { setTimeout(function () { $('#to').focus(); $('#to').select(); }, 1); }
        if(element == "to") { setTimeout(function () { $('button').focus(); }, 1); }
        return true;
    }
    
    $('#fr').autocomplete({
        delay: 0,
        source: "search",
        selectFirst: true,
        focus: function () { return false; },
        select: function (event, ui) {
            return !populate('fr', ui.item);
        }
    });
    
    $('#to').autocomplete({
        delay: 0,
        source: "search",
        selectFirst: true,
        focus: function () { return false; },
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
            $('#Idd').attr('value', "" + parseInt(p[0]));
            $('#Imm').attr('value', "" + parseInt(p[1]));
            $('#Iyy').attr('value', "" + parseInt(p[2]));
            datetime();
        }
    });
    
    $('#btnT').button({icons: {primary: "ui-icon-calendar"}});
    $('#btnS').button({icons: {secondary: "ui-icon-search"}});
    $('#btnN').button({icons: {secondary: "ui-icon-search"}});
    
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
