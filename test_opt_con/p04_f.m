function f = p04_f ( m, n, x )

%*****************************************************************************80
%
%% P04_F returns the objective function value for problem 4.
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
    f(j) = - 100.0 * prod ( x(1:m,j) ) * exp ( - x(4,j) ) ...
      / ( 1.0 + x(1,j) * x(2,j) * x(3,j) )^2;
  end

  return
end
