function [ xq, wq ] = gauss3pt ( )

%*****************************************************************************80
%
%% GAUSSPT sets up a 3 point Gauss quadrature rule on [-1,1]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2005
%
%  Parameters:
%
%    Output, real XQ(3), WQ(3), the points and weights for the rule.
%
  xq(1) = -0.7745966692;
  xq(2) =  0.0;
  xq(3) =  0.7745966692;

  wq(1) = 0.5555555556;
  wq(2) = 0.8888888889;
  wq(3) = 0.5555555556;

  return
end
