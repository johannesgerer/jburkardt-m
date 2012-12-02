function x = p25_start ( n )

%*****************************************************************************80
%
%% P25_START returns a starting point for optimization for problem 25.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2001
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
  x = ( linspace ( -1.28, +1.28, n ) )';

  return
end
