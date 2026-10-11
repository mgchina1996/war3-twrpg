function fzzsO_09i takes unit o6u8i returns integer
local unit fzzr8i=yx[(jl[((GetPlayerId(GetOwningPlayer((yx[((((GetUnitUserData((o6u8i))))))])))))])]
return o9q9i(GetHeroStr((fzzr8i),true),o9q9i(GetHeroAgi((fzzr8i),true),GetHeroInt((fzzr8i),true)))
endfunction
function fzzsiOl_1 takes unit o6u8i,real OIo6i,real OIoqi,real OIo9i,real OIOii,real OIO1i,real uO09i,real pIuli returns nothing
local unit o6uui
local integer Oup0i
local integer o69qi 
set o6uui=Opopi(o6u8i,OIOii,OIO1i,160.,function iOl11)
if o6uui!=null then
set Oup0i=(Oupoi(((OIo6i)*1.),((OIoqi)*1.),((OIo9i)*1.),(o6uui)))
else
set Oup0i=Oup_i(OIo6i,OIoqi,OIo9i,OIOii,OIO1i,0)
endif
set o69qi=Oup0i
set HT[Oup0i]=o6u8i
call Ouu9i(Oup0i,.75)
set fT[(Oup0i)]=Te*((3000.)*1.)
call Oo0qi(bT[Oup0i],iO1i1(xQ[(GetUnitUserData((o6u8i)))]))
call SetUnitScale(oJ[(bT[Oup0i])],((iO111(o6u8i))*1.),0,0)
set i18ui[o69qi]=uO09i
set i18pi[o69qi]=pIuli
call iOl01(Oup0i)
set o6uui=null
endfunction
function fzzsiOlu1 takes nothing returns nothing
local unit u1qOi=GetTriggerUnit()
local real ulqqi=GetUnitX(u1qOi)
local real ulq9i=GetUnitY(u1qOi)
local real uoiIi=GetUnitFlyHeight(u1qOi)
local real ul9ii=(Atan2(GetSpellTargetY()-GetUnitY(GetTriggerUnit()),GetSpellTargetX()-GetUnitX(GetTriggerUnit())))
local real u90Oi=o9pli((o9q8i(GetUnitX(GetTriggerUnit()),GetUnitY(GetTriggerUnit()),GetSpellTargetX(),GetSpellTargetY())),0,1000.)
local real uO09i=fzzsO_09i(u1qOi) * 3
local real pIuli=300.
call fzzsiOl_1(u1qOi,ulqqi,ulq9i,uoiIi+60,ulqqi+u90Oi*Cos(ul9ii),ulq9i+u90Oi*Sin(ul9ii),uO09i,pIuli)
call SetUnitFacingTimed(u1qOi,bj_RADTODEG*ul9ii,.0)
call Ol0Oi(Ol0li((GetUnitUserData((u1qOi))),"spell"),"stand")
set u1qOi=null
endfunction
function fzzsiOIi1 takes nothing returns nothing
set SK[YK[OO8Oi('A13S')]]=.33
call OIqui('A13S',function iOlq1)
call OIq6i('A13S',function iOl91)
call OIq0i('A13S',function fzzsiOlu1)
endfunction
function fzzsjineng takes nothing returns nothing
call fzzsiOIi1()
endfunction