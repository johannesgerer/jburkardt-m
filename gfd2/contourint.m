function [u,v] = contourint(ip,xm,ym,dx,dy,xi,yi)

%*****************************************************************************80
%
%% CONTOURINT evaluates a particular contour integral.
%
%  Discussion:
%
%    This function assumes that the X(IP+1) = X(1) and Y(IP+1) = Y(1).
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
%    Input, real XM(IP), YM(IP), the midpoints of the intervals.
%
%    Input, real DX(IP), DY(IP), the X and Y lengths of the intervals.
%
%    Input, real XI, YI, the point with respect to which the integrand
%    is defined.
%
%    Output, real U, V, the X and Y components of the contour integral.
%
  u = 0.0;
  v = 0.0;

  for j = 1 : ip
    dist = ( xi - xm(j) )^2 + ( yi - ym(j) )^2;
    cof = log ( dist );
    u = u + cof * dx(j);
    v = v + cof * dy(j);
  end

  return
end
