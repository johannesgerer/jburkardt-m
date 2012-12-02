function [ a, b] = p04_interval ( )

%*****************************************************************************80
%
%% P04_INTERVAL returns a starting interval for optimization for problem 4.
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
  a = 0.0001;
  b = 1.0;

  return
end
