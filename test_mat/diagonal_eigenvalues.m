function lambda = diagonal_eigenvalues ( n, x )

%*****************************************************************************80
%
%% DIAGONAL_EIGENVALUES returns the eigenvalues of the DIAGONAL matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N,1), the diagonal entries.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  x = x(:);

  lambda(1:n,1) = x(1:n,1);

  return
end
