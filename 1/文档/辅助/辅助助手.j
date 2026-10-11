globals
integer array fzzsl
timer array fzzs8lo
unit array fzzs8io
endglobals
function fzzsIi_i takes nothing returns nothing
local integer o69qi=(LoadInteger(Nv,(Lc),((GetHandleId((GetExpiredTimer()))))))
local real pii9i
local real pi1ii

set pii9i = GetUnitX(fzzs8io[o69qi]) + 96.
set pi1ii = GetUnitY(fzzs8io[o69qi]) + 96.

if UnitAlive((yx[(o69qi)]))then
    if not IsUnitInRange((yx[(o69qi)]), fzzs8io[o69qi], 1500.) then

        call SetUnitX((yx[(o69qi)]), pii9i)
        call SetUnitY((yx[(o69qi)]), pi1ii)
        
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", (yx[(o69qi)]), "origin"))
    endif
else
    call ReviveHero((yx[(o69qi)]), pii9i, pi1ii, false)
endif
endfunction 
function cfzzs98 takes unit o6u8i returns integer
local real o961i = GetRandomReal(0, ao)

local integer o69qi = (GetUnitUserData((CreateUnit(GetOwningPlayer(o6u8i), 'H0AI', GetUnitX(o6u8i)+20.*Cos(o961i), GetUnitY(o6u8i)+20.*Sin(o961i), .0))))

set fzzs8io[o69qi] = o6u8i
set fzzs8lo[o69qi] = Oiq9i(o69qi)

call O_O1i((o69qi), false)
call o9Oui((o69qi))
call O_OOi((o69qi), true)

call SetHeroLevel((yx[(o69qi)]), 100, false)
call SuspendHeroXP((yx[(o69qi)]), true)
call OlI9i((yx[(o69qi)]),'A00F')

call TimerStart(fzzs8lo[o69qi], .03125, true, function fzzsIi_i)

return o69qi
endfunction
function qO66i takes integer o69qi returns nothing
set fzzsl[((o69qi))] = cfzzs98(yx[(jl[((o69qi))])])
endfunction