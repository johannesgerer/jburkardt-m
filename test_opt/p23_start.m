function x = p23_start ( n )

%*****************************************************************************80
%
%% P23_START returns a starting point for optimization for problem 23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2000
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
  x = ( linspace ( - 2.048, + 2.048, n ) )';

  return
end
