function x = p11_start ( n )

%*****************************************************************************80
%
%% P11_START returns a starting point for optimization for problem 11.
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
  x =  [ 25.0, 5.0, -5.0, -1.0 ]';

  return
end
