function x = p28_start ( n )

%*****************************************************************************80
%
%% P28_START returns a starting point for optimization for problem 28.
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
  x = [ -5.0, +10.0 ]';

  return
end
