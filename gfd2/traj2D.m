%% TRAJ2D follows the trajectory of points in a 2D Sverdrup velocity field.
%
%  Discussion:
%
%    This script is discussed in chapter 12 of the reference.
%
%  Modified:
%
%    30 November 2009
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
%    Local, integer IM, JM, the number of grid points in the X and Y directions,
%    used as the initial locations of the particles.
%
%    Local, integer NMAX, the number of time steps.
%
%    Local, real DX, DY, the X and Y spacing.
%
%    Local, real DT, the time step.
%
%    Local, real T, the current time.
%
%    Local, integer NP, the number of points.
%
%    Local, real X(IM,JM), Y(IM,JM), the coordinates of the particles.
%
  clear all;

  IM=30;
  JM=30;
  NMAX=100;
  DX=1/(IM-1);
  DY=1/(JM-1);
  DT=1/(NMAX);
  t=0;
  np=IM*JM;
  x=zeros(np);
  y=zeros(np);

  fig=figure;

  itot=0;
  for i=1:IM
    for j=1:JM
      xx=(i-1)/(IM-1);
      yy=2*(j-1)/(JM-1)-1;
      itot=itot+1;
      x(itot)=xx;
      y(itot)=yy;
      del=0.1;
      xp(i,j)=xx;
      yp(i,j)=yy;
      psi(i,j)=cos(yy*pi/2)*(1-xx-exp(-xx/del));
    end
  end

  xi=x;
  yi=y;

  for n=1:NMAX

    for i=1:np
      [u,v]=velocitysver(x(i),y(i));
      % predictor
      xx=x(i)+u*DT;
      yy=y(i)+v*DT;
      % corrector
      [u,v]=velocitysver(xx,yy);
      x(i)=x(i)+u*DT;
      y(i)=y(i)+v*DT;
    end

    t=t+DT;
    plot(x,y,'.');
    xlabel ( 'X' );
    ylabel ( 'Y' );
    title_string = sprintf ( 'T = %f', t );
    title ( title_string );
    axis([0 1 -1 1]);
    hold on;
    contour(xp',yp',psi');
    hold off;
    M(n) = getframe;

  end

  movie(M);

  plot(x,y,'.');
  xlabel ( 'X' );
  ylabel ( 'Y' );
  title_string = sprintf ( 'T = %f', t );
  title ( title_string );
  axis([0 1 -1 1]);
  hold on;
  contour(xp',yp',psi');
  hold off;
