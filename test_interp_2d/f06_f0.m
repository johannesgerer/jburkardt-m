function f = f06_f0 ( n, x, y )

%*****************************************************************************80
%
%% F06_F0 returns the value of function 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2012
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
  t4(1:n,1) = 64.0 - 81.0 * ( ( x(1:n,1) - 0.5 ).^2 + ( y(1:n,1) - 0.5 ).^2 );

  f = zeros ( n, 1 );
  i = find ( 0.0 <= t4(1:n,1) );
  f(i,1) = sqrt ( t4(i,1) ) / 9.0 - 0.5;

  return
end
