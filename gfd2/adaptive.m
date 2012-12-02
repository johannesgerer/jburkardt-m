%% ADAPTIVE ?
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

mfine=1000;
xmin=-10;
xmax=10;
m=10;
FSCALE=1;
LSCALE=1;
TSCALE=1;
alpha=LSCALE/(TSCALE*FSCALE);
beta=3.1;
beta=0.1;
beta=0;
dt=0.1;

% Initialization

  for i=1:mfine
    xf(i)=xmin+(xmax-xmin)*(i-1)/(mfine-1);
    ff(i)=functiontofollow(xf(i));
  end
%
%  VALEXACT is never used...
%
  valexact=integral(ff,xf,mfine);

  for i=1:m
    x(i)=xmin+(xmax-xmin)*(i-1)/(m-1);
    f(i)=functiontofollow(x(i));
  end

  plot(x,f,'o',xf,ff);
  pause;

% Adaptation

xn=x;
xini=x;
fini=f;
for n=1:1000
    cof=dt*alpha;
    cof2=dt*beta*alpha*FSCALE/LSCALE;
    for i=2:m-1
        xn(i)=x(i)+(abs(f(i+1)-f(i))-abs(f(i)-f(i-1)))*cof+cof2*(x(i+1)-2*x(i)+x(i-1));
    end
    xn(1)=x(1);
    xn(m)=x(m);
    x=xn;
    for i=1:m
        f(i)=functiontofollow(x(i));
    end
    plot(x,f,'o',xf,ff);
    pause(0.01);
    ffine=interp1(x,f,xf);
    err(n)=norm(ff-ffine);
end
pause;

% Results

plot(err);
pause;

ffineini=interp1(xini,fini,xf);
plot(xf,ffineini,xini,fini,'o',xf,ff);
axis([-10 10 -1.1 1.1]);
axis off;
title('Standard uniform grid')
print -deps uniformgrid.eps;
pause;

plot(xf,ffine,x,f,'o',xf,ff);
axis([-10 10 -1.1 1.1]);
axis off;
title('Adapted grid')
print -deps adaptedgrid.eps;
axis off;
