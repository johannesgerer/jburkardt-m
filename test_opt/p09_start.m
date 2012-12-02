function x = p09_start ( n )

%*****************************************************************************80
%
%% P09_START returns a starting point for optimization for problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
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
  x = 0.5 * ones ( n, 1 );

  return
end
