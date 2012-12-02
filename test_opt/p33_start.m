function x = p33_start ( n )

%*****************************************************************************80
%
%% P33_START returns a starting point for optimization for problem 33.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables X.
%
%    Output, real X(N), a starting point for the optimization.
%
  x = [ 1.0, 3.0, 5.0, 6.0 ]';

  return
end
