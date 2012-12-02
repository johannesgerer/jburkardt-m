function f = f02_f0 ( n, x, y )

%*****************************************************************************80
%
%% F02_F0 returns the value of function 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), Y(N,1), the evalution points.
%
%    Output, real F(N,1), the function values.
%
  f(1:n,1) = ( tanh ( 9.0 * ( y(1:n,1) - x(1:n,1) ) ) + 1.0 ) / 9.0;

  return
end
