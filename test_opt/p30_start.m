function x = p30_start ( n )

%*****************************************************************************80
%
%% P30_START returns a starting point for optimization for problem 30.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2001
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
  x = [ -1.0, 1.0 ]';

  return
end
