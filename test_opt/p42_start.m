function x = p42_start ( n )

%*****************************************************************************80
%
%% P42_START returns a starting point for optimization for problem 42.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2002
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
  x = [ 0.0, 1.0, 2.0 ]';

  return
end
