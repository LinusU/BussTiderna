
{include file="snippets/dialog.tpl"}

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

{include file="snippets/vlform.tpl"}

<button id="btnN" onclick="revert();">Ny sökning</button>

<iframe name="vl" class="vl" onload="if(window.loaded) loaded();"></iframe>

{include file="snippets/script.tpl"}
