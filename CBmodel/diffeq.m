
function dydt = diffeq(t, y)

global param term celltype model;

dydt=zeros(3,1);

%get signal value
if term==0
    signal=0.01;
else
    signal=1;
end
if model==1
    % signal-independent inhibition
    if celltype==2
        Tr6I=0.05;
    else
        Tr6I=0.5;
    end
elseif model==2
    % signal-dependent inhibition
    if term==0
        Tr6I=0.05;
    else
        if celltype==2
            Tr6I=0.05;
        else
            if t<3
                Tr6I=0.05;
            else
                Tr6I=0.5;
            end
        end
    end
end


uCARMA1=y(1);
uBCL10=y(2);
uCB=y(3);

v1 = param.k1* signal *uCARMA1*uBCL10;
v2 = param.k2 * Tr6I  * uCB;

rCARMA1 = - v1 + v2;
rBCL10 = - v1 + v2;
rCB = v1 - v2;

dydt = [rCARMA1; rBCL10; rCB];
