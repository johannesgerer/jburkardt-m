function x = jacobi2 ( n, a, b, x )

%*****************************************************************************80
%
%% JACOBI2 carries out one step of the Jacobi iteration.
%
%  Discussion:
%
%    MATLAB's vector notation is used to express the operation in one line.
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
  x = ( b - a * x + ( diag ( a ) .* x ) ) ./ diag ( a );

  return
end

