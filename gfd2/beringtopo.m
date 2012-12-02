function[xb,yb,hb] = beringtopo(istoplot)

%*****************************************************************************80
%
%% BERINGTOPO ?
%
%  Discussion:
%
%    This function is discussed in chapter 7 of the reference.
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
%    Input, integer ISTOPLOT, is 1 if the user wishes to see a contor plot.
%
  [ x y h ] = etopo5ncread ( );
%
% for the ocean only
%
  h=-h;
  h(h<0)=NaN;
  vv=size(h);
  IM=vv(1);
  JM=vv(2);

  ISUB=50;
  JSUB=50;
 
  xx=x(1:ISUB:IM);
  yy=y(1:JSUB:JM);
  hh=h(1:ISUB:IM,1:JSUB:JM);

  if istoplot==1
    contour(xx,yy,hh')
    pause
  end

  IS=44*50+42;
  IE=47*50+17+20;
  JS=37*50+11;
  JE=38*50;

  xb=x(IS:1:IE);
  yb=y(JS:1:JE);
  hb=h(IS:1:IE,JS:1:JE);

  if istoplot==1
    contour(xb',yb',hb')
    pause
  end

  return
end

