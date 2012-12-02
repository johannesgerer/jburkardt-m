function lambda = diagonal_eigenvalues ( n, x )

%*****************************************************************************80
%
%% DIAGONAL_EIGENVALUES returns the eigenvalues of a diagonal matrix.
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
%    Input, real X(N), the diagonal entries of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda(1:n) = x(1:n);

  return
end
