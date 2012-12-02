%% ADAPTIVEUPWIND: advection with upwind discretization and optional adaptive grid.
%
%  Discussion:
%
%    This script is discussed in chapter 15 of the reference.
%
%  Modified:
%
%    02 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
  close all;
  clear all;

% PARAMETERS

xmin=0;
xmax=50000;
m=41;
FSCALE=1;
LSCALE=1000;
TSCALE=900;
alpha=LSCALE/(TSCALE*FSCALE);    % or alpha=LSCALE/(TSCALE*FSCALE);
beta=0.2;   % 1 or 0.1 or 0.2
islagr=0;   % islagr=1 adds lagrangien-like approach (else : 0)
ktimes=10;  % 10 or 20
dt=1;


% INITIALIZATION

for i=1:m
    x(i)=xmin+(xmax-xmin)*(i-1)/(m-1);
    c(i)=1.;
    u(i)=1.;
    unum(i)=0.;
    flux(i)=0;
end
for i=10:20
    c(i)=2-abs((i-15))/5;
end
cini=c;
xini=x;
plot(x,c);
title('Press Enter');
pause;


% RESOLUTION

xn=x;
dxc=c*(xmax-xmin)/(m-1);
for i=2:m-1
    dxc(i)=c(i)*(x(i+1)-x(i-1))/2;
end
dxcn=dxc;
t=0;
% First get a nice point distribution before advection
for k=1:4000
    xo=xn;
    ca=pchip(x,c,xo);
    plot(xo,ca,'-',x,c,'o');
    pause(0.00001);
    cof =dt*alpha;
    cof2=dt*alpha*beta*FSCALE/LSCALE;
    for i=2:m-1
        xn(i)=xo(i)+cof*(abs(ca(i+1)-ca(i))-abs(ca(i)-ca(i-1)))+cof2*(xo(i+1)-2*xo(i)+xo(i-1));
        xn(i)-xo(i)
    end
    for i=3:m-1
        if xn(i+1) < xn(i)+(xn(i)-xn(i-1))/20
            xn(i)=xn(i+1)-(xn(i)-xn(i-1))/10;
        end
    end
    xn(1)=x(1);
    xn(m)=x(m);
end
xo=xn;
cini=pchip(x,c,xo);


x=xn;
c=cini;
dxc=c*(xmax-xmin)/(m-1);
for i=2:m-1
    dxc(i)=c(i)*(x(i+1)-x(i-1))/2;
end
dxcn=dxc;
plot(x,c,'+')
for n=1:2000
    t=t+dt
    cof=dt*alpha;
    cof2=dt*beta*alpha*FSCALE/LSCALE;
    xo=x;
    xn=x;
    ca=c;
    for k=1:ktimes
        xo=xn;
        ca=pchip(x,c,xo);
        plot(xo,ca,'+',x,c,'o');
        %pause
        for i=2:m-1
            xo(i)=xo(i)+u(i)*dt/ktimes*islagr;  % For lagrangien-like approach
        end
        for i=2:m-1
            xn(i)=xo(i)+cof*(abs(ca(i+1)-ca(i))-abs(ca(i)-ca(i-1)))+cof2*(xo(i+1)-2*xo(i)+xo(i-1));
        end
        for i=3:m-1
            if xn(i+1) < xn(i)+(xn(i)-xn(i-1))/20
                xn(i)=xn(i+1)-(xn(i)-xn(i-1))/10;
            end
        end
        xn(1)=x(1);
        xn(m)=x(m);
    end
    
    
    for i=2:m
        unum(i)=(xn(i)+xn(i-1)-x(i)-x(i-1))/(2*dt);
    end
    % adapte fluxes
    for i=2:m
        if u(i)-unum(i) > 0
            flux(i)=(u(i)-unum(i))*c(i-1);
        else
            flux(i)=(u(i)-unum(i))*c(i);
        end
    end
    for i=2:m-1
        dxcn(i)=dxc(i)+(flux(i)-flux(i+1))*dt;
    end
    for i=2:m-1
        c(i)=dxcn(i)/(xn(i+1)-xn(i-1))*2;
    end
    dxc=dxcn;
    x=xn;
    plot(x,c,'o',x,unum*10,x,-(u-unum)*10)
    axis([xmin xmax -1 2])
    pause(0.01)
end
