function x = p12_start ( n )

%*****************************************************************************80
%
%% P12_START returns a starting point for optimization for problem 12.
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
  x = [ 40.0, 20.0, 1.20 ]';

  return
end
