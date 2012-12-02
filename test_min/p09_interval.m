function [ a, b] = p09_interval ( )

%*****************************************************************************80
%
%% P09_INTERVAL returns a starting interval for optimization for problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2008
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
  a = -5.0;
  b = +5.0;

  return
end
