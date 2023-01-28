%inputfunctions
function input = libPulseDelay(t)

global sinput tpulse traise tdecay sbase tdelay slate;
global term;

if t <= tdelay | term==0
	input = sbase;
elseif tdelay < t & t <= (traise + tdelay)
	input = (t - tdelay)*(sinput - sbase)/traise + sbase;
elseif (traise + tdelay) < t & t <= (tpulse + traise + tdelay)
	input = sinput;
elseif (tpulse + traise + tdelay) < t
	input = (sinput - slate)*exp(-(t - tpulse - traise - tdelay)/tdecay) + slate;
else
	input = 0;
end
