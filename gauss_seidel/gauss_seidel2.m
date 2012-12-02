function x_new = gauss_seidel2 ( n, l, d, u, b, x )

%*****************************************************************************80
%
%% GAUSS_SEIDEL2 carries out the Gauss-Seidel iteration.
%
%  Discussion:
%
%    The linear system A * x = b is to be solved.
%
%    The matrix A has been decomposed as A = L + D + U, where sparse
%    storage is presumed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns in A.
%
%    Input, real sparse L(*,*), D(*,*), U(*,*), the strict lower triangle,
%    the diagonal, and the strict upper triangle of A.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Input, real X(N), the current solution estimate.
%
%    Output, real X_NEW(N), the new solution estimate.
%    
  x_new = ( l + d ) \ ( b - u * x );

  return
end

