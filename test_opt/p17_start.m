function x = p17_start ( n )

%*****************************************************************************80
%
%% P17_START returns a starting point for optimization for problem 17.
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
  x = [ -3.0, -1.0, -3.0, -1.0 ]';

  return
end
