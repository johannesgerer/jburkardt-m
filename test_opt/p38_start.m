function x = p38_start ( n )

%*****************************************************************************80
%
%% P38_START returns a starting point for optimization for problem 38.
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
  x = [ 0.5, 1.0 ]';

  return
end
