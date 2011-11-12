{include file="header.tpl" mobile=true}
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

<div id="from-to">
    <div style="float: left;"></div>
    <div style="float: right;"></div>
</div>

<div id="result">
    <table>
        <tr><th>Avgång</th><th>Ankomst</th><th>Linje</th></tr>
    </table>
</di>

<div id="trash"></div>

{include file="snippets/script.tpl"}

<script type="text/javascript">
    
    $(window).resize(function () {
        $('#fr, #to, #btnS, #btnT, #btnN, #result, #from-to').each(function () {
            $(this).width($(window).width() - ($(this).outerWidth(true) - $(this).width()));
        });
    });
    
    $(window).resize();
    
    function search() {
        setTimeout(function () {
            
            $('#from-to div').eq(0).text($('#fr').val());
            $('#from-to div').eq(1).text($('#to').val());
            
            $('#inputs').slideUp();
            $('iframe.vl').animate({ height: 600 });
            $('#dialog').dialog("open");
            
            $.ajax({
                url: $('#vl').attr('action'),
                data: $('#vl').serialize(),
                type: $('#vl').attr('method'),
                success: function (data) {
                    
                    var result = [];
                    
                    $('#trash').append(data);
                    $('#trash').find('#row01').closest('table').find('tr').first().siblings('tr').slice(1, 5).each(function () {
                        
                        var tds = $(this).children('td');
                        var lines = [];
                        
                        tds.eq(7).find('td').filter(':odd').each(function () {
                            lines.push($.trim($(this).text()));
                        });
                        
                        result.push({
                            'date':     $.trim(tds.eq(2).text()),
                            'depature': $.trim(tds.eq(3).text()),
                            'arrival':  $.trim(tds.eq(4).text()),
                            'duration': $.trim(tds.eq(5).text()),
                            'switches': $.trim(tds.eq(6).text()),
                            'lines':    lines
                        });
                        
                    });
                    
                    for(var i in result) {
                        $('#result table').append(
                            '<tr>' +
                            '<td>' + result[i].depature + '</td>' +
                            '<td>' + result[i].arrival + '</td>' +
                            '<td>' + result[i].lines.join(', ') + '</td>' +
                            '</tr>'
                        );
                    }
                    
                    $('#trash').text('');
                    $('#result, #from-to').slideDown();
                    
                    loaded();
                    
                }
            });
            
        }, 1);
    }
    
</script>

</body>
</html>