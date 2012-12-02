function [xm,ym,dx,dy] = contourintdef(ip,x,y)

%*****************************************************************************80
%
%% CONTOURINTDEF sets auxilliary data needed for contour integration.
%
%  Discussion:
%
%    We assume the contour is defined by a sequence of IP+1 points, where 
%    the first and last points are equal.
%
%    This function is discussed in chapter 10 of the reference.
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
%    Input, integer IP, the number of points.
%
%    Input, real X(IP+1), Y(IP+1), the coordinates.
%
%    Output, real XM(IP), YM(IP), the midpoints of the intervals.
%
%    Output, real DX(IP), DY(IP), the X and Y lengths of the intervals.
%
  for i = 1 : ip
    xm(i) = ( x(i) + x(i+1) ) * 0.5;
    ym(i) = ( y(i) + y(i+1) ) * 0.5;
    dx(i) = x(i+1) - x(i);
    dy(i) = y(i+1) - y(i);
  end

  return
end
