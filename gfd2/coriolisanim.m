function [pl] = coriolisanim ( n, nend, alpha, beta, X0 ) 

%*****************************************************************************80
%
%% CORIOLISANIM
%
%  Discussion:
%
%    This function is discussed in chapter 2 of the reference.
%
%  Modified:
%
%    01 December 2009
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
%    Input, integer N, the number of time steps for a full period.
%
%    Input, integer NEND, the last time step.
%    NEND = N / 4 + 1 is recommended.
%
%    Input, real ALPHA, the scaled azimuthal initial velocity V_0/(X_0 Omega).
%
%    Input, real BETA, the scaled radial initial velocity U_0/(X_0 Omega).
%
%    Input, real X0, the initial distance (less then 10 for plotting reasons).
%
  matoct(1) = 1;

  if matoct(1)==1
    fig = figure;
  end
  pl = 1;
%
%  Circle to plot
%
  for i=1:101
    xc(i)=10*cos(i*pi*2/100);
    yc(i)=10*sin(i*pi*2/100);
  end
%
%  Time steps to reach nend/n revolutions with rate Omega
%
  for j=1:nend
% omega t
    ot=(j-1)*pi*2/n;
% omega delta t
    dot=pi*2/n;
% for line segments to see rotation of plane
    x1(1)=7*cos((j-1)*pi*2/n);
    z1(1)=7*sin((j-1)*pi*2/n);
    x1(2)=10*cos((j-1)*pi*2/n);
    z1(2)=10*sin((j-1)*pi*2/n);
    x2(1)=10*cos((j-1)*pi*2/n+pi/2);
    z2(1)=10*sin((j-1)*pi*2/n+pi/2);
    x2(2)=7*cos((j-1)*pi*2/n+pi/2);
    z2(2)=7*sin((j-1)*pi*2/n+pi/2);
    x3(1)=10.5;
    z3(1)=0;
    x3(2)=12;
    z3(2)=0;
    x4(1)=0;
    z4(1)=10.5;
    x4(2)=0;
    z4(2)=12;
 % solution in absolute axes in function of initial conditions
    x0=X0;
    XA(1)=x0*cos(ot)+ beta*x0*sin(ot);
    YA(1)=alpha*x0*sin(ot);
 % storage of trajectory in absolute axes
    XAA(j)=XA(1);
    YAA(j)=YA(1);
 % rotation of trajectory inprint on rotating axis        
    for i=1:j-1;
      xn=xt(i)*cos(dot)-yt(i)*sin(dot);
      yn=xt(i)*sin(dot)+yt(i)*cos(dot);
      xt(i)=xn;
      yt(i)=yn;
    end
 % adding of new point to the trajectory
    xt(j)=XA(1);
    yt(j)=YA(1);

% PLOT

    if matoct(1)==1
      h = plot ( x1,    z1,    'b-', ...
                 xc,    yc,    ...
                 XA,    YA,    'o', ...
                 xt,    yt,    '.', ...
                 XAA,   YAA,   '-', ...
                 x1(2), z1(2), 'ko', ...
                 x2,    z2,    'b-', ...
                 x3,    z3,    'b-', ...
                 x4,    z4,    'b-' );
      axis('equal');
      axis('off');
      %set(h,'LineWidth',2);  % set both lines to 2 pixels wide
      set(h(3),'LineWidth',3)
      set(h(5),'LineWidth',2)
      set(h(2),'LineWidth',2)
      set(h(1),'LineWidth',2)
      set(h(6),'LineWidth',6)
      set(h(7),'LineWidth',2)
      set(h(8),'LineWidth',2)
      set(h(9),'LineWidth',2)
      M(j) = getframe;
    else
      plot(xc,yc,x1,z1,'b-',XA,YA,'o',xt,yt,'.',XAA,YAA,'-',x1(2),z1(2),'ko',x2,z2,'b-',x3,z3,'b-',x4,z4,'b-');
      axis([-15 15 -15 15])
      axis('equal');
      axis('off');
      hold off
      pause(0.04)
    end
    
  end

  if matoct(1)==1
    movie(M)
  end

  return
end
