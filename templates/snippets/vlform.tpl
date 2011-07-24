
<form action="/gateway/resultspage.asp" method="post" target="vl" id="vl">
    
    <input type="hidden" name="selPointFr" id="Ifr" />
    <input type="hidden" name="selPointTo" id="Ito" />
    
    <input type="hidden" name="inpTime" value="{$smarty.now|date_format:"%H%M"}" id="Ihhmm" />
    
    <input type="hidden" name="selDay" value="{$smarty.now|date_format:"%d"|ltrim:"0"}" id="Idd" />
    <input type="hidden" name="selMonth" value="{$smarty.now|date_format:"%m"|ltrim:"0"}" id="Imm" />
    <input type="hidden" name="selYear" value="{$smarty.now|date_format:"%y"|ltrim:"0"}" id="Iyy" />
    
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
