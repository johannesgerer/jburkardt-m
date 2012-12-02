function f = f04_f0 ( n, x, y )

%*****************************************************************************80
%
%% F04_F0 returns the value of function 4.
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
  f(1:n,1) = exp ( - 5.0625 * ( ( x(1:n,1) - 0.5 ).^2 ...
                              + ( y(1:n,1) - 0.5 ).^2 ) ) / 3.0;

  return
end
