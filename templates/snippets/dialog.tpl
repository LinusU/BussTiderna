
<div id="dialog" style="display: none;">
    
    <p>
        <img src="{"img/ajax-loader.gif"|cdn}" alt="" />
        Vänligen vänta, sökning pågår.
    </p>
    
</div>

<script type="text/javascript">
    {literal}
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
    {/literal}
</script>
