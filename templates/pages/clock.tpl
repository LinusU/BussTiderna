
<div style="overflow: auto; width: 704px; margin: 16px auto;">
    <div id="clockA"></div>
    <div id="clockB"></div>
    <div id="clockC"></div>
    <div id="clockD"></div>
    <div id="clockE"></div>
    <div id="clockF"></div>
    <div id="clockG"></div>
    <div id="clockH"></div>
    <div id="clockI"></div>
    <div id="clockJ"></div>
    <div id="clockK"></div>
</div>

<p></p>

<div id="slider"></div>

<p></p>

<button>Random!</button>

{literal}
<script type="text/javascript">
    
    var dir = "both";
    
    $('#clockA').flipclock({next: null, direction: dir});
    $('#clockB').flipclock({next: '#clockA', direction: dir});
    $('#clockC').flipclock({next: '#clockB', direction: dir});
    $('#clockD').flipclock({next: '#clockC', direction: dir});
    $('#clockE').flipclock({next: '#clockD', direction: dir});
    $('#clockF').flipclock({next: '#clockE', direction: dir});
    $('#clockG').flipclock({next: '#clockF', direction: dir});
    $('#clockH').flipclock({next: '#clockG', direction: dir});
    $('#clockI').flipclock({next: '#clockH', direction: dir});
    $('#clockJ').flipclock({next: '#clockI', direction: dir});
    $('#clockK').flipclock({next: '#clockJ', direction: dir});
    
    $("#slider").slider({
        animate: "normal",
        range: "min",
        value: 0,
        min: 0,
        max: 99999999999,
        step: 1,
        slide: function (event, ui) {
            $('#clockK').flipclock("flip", ui.value);
        },
        change: function (event, ui) {
            $('#clockK').flipclock("flip", ui.value);
        }
    });
    
    $('button').button();
    
    $('button').click(function () {
        var d = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K'];
        for(var c in d) {
            $('#clock' + d[c]).data("flipclock").next = null;
        }
        setInterval(function () {
            var c = $('#clock' + d[Math.floor(Math.random() * d.length)]);
            c.flipclock("flip", (c.flipclock("value") + 1) % 10);
        }, 13);
    });
    
</script>
{/literal}
