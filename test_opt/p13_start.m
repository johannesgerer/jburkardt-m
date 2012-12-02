function x = p13_start ( n )

%*****************************************************************************80
%
%% P13_START returns a starting point for optimization for problem 13.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2000
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
  x = ones ( n, 1 ) / n;

  return
end
