function [ a, b] = p03_interval ( )

%*****************************************************************************80
%
%% P03_INTERVAL returns a starting interval for optimization for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2002
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A, B, two points defining an interval in which
%    the local minimizer should be sought.
%
  a = -2.0;
  b = +2.0;

  return
end
