function x_new = jacobi1 ( n, a, b, x )

%*****************************************************************************80
%
%% JACOBI1 carries out one step of the Jacobi iteration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of equations.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real B(N), the right hand side.
%
%    Input, real X(N), the estimated solution.
%
%    Output, real X_NEW(N), the improved estimate of the solution.
%
  x_new = zeros ( n, 1 );

  for i = 1 : n
    x_new(i) = b(i);
    for j = 1 : n
      if ( j ~= i )
        x_new(i) = x_new(i) - a(i,j) * x(j);
      end
    end
    x_new(i) = x_new(i) / a(i,i);
  end

  return
end

