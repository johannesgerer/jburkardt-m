function f = p03_f ( m, n, x )

%*****************************************************************************80
%
%% P03_F returns the objective function value for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Harald Niederreiter, Kevin McCurley,
%    Optimization of functions by quasi-random search methods,
%    Computing,
%    Volume 22, Number 2, 1979, pages 119-123.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the arguments.
%
%    Output, real F(N), the function values.
%
  f = zeros ( n, 1 );

  for j = 1 : n
    s = - x(1,j) - 2.0 * x(2,j) - 3.0 * x(3,j) - 4.0 * x(4,j);
    f(j) = - 10000.0 * prod ( x(1:m,j) ) * exp ( s );
  end

  return
end
