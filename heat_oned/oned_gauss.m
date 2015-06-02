function [ r, w ] = oned_gauss ( rule )

%*****************************************************************************80
%
%% ONED_GAUSS sets a Gauss quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, integer RULE, the number of Gauss points desired.
%
%    Output, real R(RULE), the coordinates of the Gauss points.
%
%    Output, real W(RULE), the weights of the Gauss points.
%
  r = zeros ( rule, 1 );
  w = zeros ( rule, 1 );

  if rule == 1
    r(1) = 0.0;
    w(1) = 2.0;
  elseif rule == 2
    r(1) =-1.0 / sqrt(3.0);
    r(2) =-r(1);
    w(1) = 1.0;
    w(2) = 1.0;
  elseif rule == 3
    r(1) =-sqrt(3.0/5.0);
    r(2) = 0.0;
    r(3) =-r(1);
    w(1) = 5.0 / 9.0;
    w(2) = 8.0 / 9.0;
    w(3) = w(1);
  elseif rule == 4
    r(1) =-sqrt((3.0+2.0*sqrt(6.0/5.0))/7.0);
    r(2) =-sqrt((3.0-2.0*sqrt(6.0/5.0))/7.0);
    r(3) =-r(2);
    r(4) =-r(1);
    w(1) = 0.5 - 1.0 / ( 6.0 * sqrt(6.0/5.0) );
    w(2) = 0.5 + 1.0 / ( 6.0 * sqrt(6.0/5.0) );
    w(3) = w(2);
    w(4) = w(1);
  elseif rule == 5
    r(1) =-sqrt(5.0+4.0*sqrt(5.0/14.0)) / 3.0;
    r(2) =-sqrt(5.0-4.0*sqrt(5.0/14.0)) / 3.0;
    r(3) = 0.0;
    r(4) =-r(2);
    r(5) =-r(1);
    w(1) = 161.0/450.0-13.0/(180.*sqrt(5.0/14.0));
    w(2) = 161.0/450.0+13.0/(180.*sqrt(5.0/14.0));
    w(3) = 128.0/225.0;
    w(4) = w(2);
    w(5) = w(1);
  elseif rule == 6
    r(1) = -0.2386191861;
    r(2) = -0.6612093865;
    r(3) = -0.9324695142;
    r(4) = - r(1);
    r(5) = - r(2);
    r(6) = - r(3);
    w(1) = 0.4679139346;
    w(2) = 0.3607615730;
    w(3) = 0.1713244924;
    w(4) = w(1);
    w(5) = w(2);
    w(6) = w(3);
  else
    error('ONED_GAUSS: Quadrature rule not supported')
    keyboard
  end

  return
end

