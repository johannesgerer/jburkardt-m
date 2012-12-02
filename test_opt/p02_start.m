function x = p02_start ( n )

%*****************************************************************************80
%
%% P02_START returns a starting point for optimization for problem 2.
%
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
  x = [ 1.0, 2.0, 1.0, 1.0, 1.0, 1.0 ]';

  return
end
