%% SGFRONTOGENESIS ?
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

  M=30;
  BU=0.6;
  yc=0.0;

  for i=1:M
    Y0(i) = yc + atanh ( -1 + 2 * i / ( M + 1 ) );
    S0(i) = 1 / BU * ( cosh ( Y0(i) - yc ) )^2;
  end

  for t=0:0.03:1
    for i=1:M
      S=S0(i)*exp(-t);
      Y=Y0(i)*exp(-t);
      zp(1)=0;
      yp(1)=Y-0.5/S;
      zp(2)=1;
      yp(2)=Y+0.5/S;
      set(gca,'XDir','reverse')
      plot(yp,zp);
      xlabel('y')
      ylabel('z')
      axis([-1 1 0 1])
      hold on
    end
    pause(0.1)
    hold off
    xlabel('y')
    ylabel('z')
    axis([-1 1 0 1])
  end

