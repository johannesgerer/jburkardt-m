function f = p04_f ( m, n, x )

%*****************************************************************************80
%
%% P04_F evaluates the objective function for problem 04.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Howard Rosenbrock,
%    An Automatic Method for Finding the Greatest or Least Value of a Function,
%    Computer Journal,
%    Volume 3, 1960, pages 175-184.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function evaluated at the arguments.
%
  f = zeros ( n, 1 );

  for j = 1 : n
    f(j) = sum ( ( 1.0 - x(1:m,j) ).^2 ) ...
         + sum ( ( x(2:m,j) - x(1:m-1,j) ).^2 );
  end

  return
end
