function x = p22_start ( n )

%*****************************************************************************80
%
%% P22_START returns a starting point for optimization for problem 22.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 December 2000
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
  x = ( linspace ( - 5.12, + 5.12, n ) )';

  return
end
