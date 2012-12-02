function x_new = gauss_seidel1 ( n, a, b, x )

%*****************************************************************************80
%
%% GAUSS_SEIDEL1 carries out one step of the Gauss-Seidel iteration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns in A.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Input, real X(N), the current solution estimate.
%
%    Output, real X_NEW(N), the new solution estimate.
%    
  x_new = zeros ( n, 1 );

  for i = 1 : n
    x_new(i) = b(i);
    x_new(i) = x_new(i) - a(i,1:i-1) * x_new(1:i-1);
    x_new(i) = x_new(i) - a(i,i+1:n) * x(i+1:n);
    x_new(i) = x_new(i) / a(i,i);
  end

  return
end

