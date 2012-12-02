function f = f10_f0 ( n, x, y )

%*****************************************************************************80
%
%% F10_F0 returns the value of function 10.
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
  t1(1:n,1) = sqrt ( ( 80.0 * x(1:n,1) - 40.0 ).^2 + ( 90.0 * y(1:n,1) - 45.0 ).^2 );
  t2(1:n,1) = exp ( - 0.04 * t1(1:n,1) );
  t3(1:n,1) = cos ( 0.15 * t1(1:n,1) );

  f(1:n,1) = t2(1:n,1) .* t3(1:n,1);

  return
end
