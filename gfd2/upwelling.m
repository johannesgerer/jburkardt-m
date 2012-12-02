%% UPWELLING ?
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
clear all;

% PARAMETERS

M=100;
gprime=0.08;
h0=50;
f=0.0001;
RD=sqrt(gprime*h0)/f;
dx=RD/15;
ah=10;
hmin=0.1;
dt=dx/sqrt(gprime*h0)*0.1;
Tf=2*pi/f*10;
ntot=Tf/dt;

for i=1:M+1
    hu(i)=0;
end
hun=hu;
hv=hu;
hvn=hv;
for i=1:M/10;
    forplot(i)=0;
    xplot(i)=(i-1)*10*dx;
end
for i=1:M
    h(i)=h0;
    x(i)=(i-1)*dx;
end
hn=h;

% RESOLUTION & PLOT

t=0;
for n=1:ntot
    
    for i=1:M
        hn(i)=h(i)-dt/dx*(hu(i+1)-hu(i));
        hn(i)=max(hn(i),hmin); 
    end
    h=hn;
    %hu=flooddry(hu,h,hmin);
    for i=2:M
        hun(i)=hu(i)+f*dt*hv(i)-1/2*gprime*dt/dx*(h(i)^2-h(i-1)^2)+dt*ah/(dx*dx)*(hu(i+1)+hu(i-1)-2*hu(i));
    end
    hun(1)=0;
    hun(M+1)=0;
    hu=hun;
    hu=flooddry(hun,h,hmin);
    for i=2:M
        hvn(i)=hv(i)-f*dt*hu(i)+dt*windstress(t)/1024+dt*ah/(dx*dx)*(hv(i+1)+hv(i-1)-2*hv(i));
    end
    hv=hvn;
    
    t=t+dt
    if windstress(t) > 0
        plot(x,-h,xplot,forplot,'x');
        axis([0 x(M) -100 1])
        pause(0.01)
    else
    plot(x,-h);
    axis([0 x(M) -100 1])
    pause(0.01)
    end
end
