function lambda = ortega_eigenvalues ( n, u, v, d )

%*****************************************************************************80
%
%% ORTEGA_EIGENVALUES returns the eigenvalues of the ORTEGA matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Ortega,
%    Generation of Test Matrices by Similarity Transformations,
%    Communications of the ACM,
%    Volume 7, 1964, pages 377-378.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    2 <= N.
%
%    Input, real U(N,1), V(N,1), vectors which define the matrix.
%    U'V must not equal -1.0.  If, in fact, U'V = 0, and U, V and D are
%    integers, then the matrix, inverse, eigenvalues, and eigenvectors 
%    will be integers.
%
%    Input, real D(N,1), the desired eigenvalues.
%
%    Output, real LAMBDA(N,1), the determinant.
%
  lambda = zeros ( n, 1 );

  lambda(1:n,1) = d(:);

  return
end
