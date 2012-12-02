function [ a, b] = p05_interval ( )

%*****************************************************************************80
%
%% P05_INTERVAL returns a starting interval for optimization for problem 5.
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
  a = 0.0002;
  b = 2.0;

  return
end
