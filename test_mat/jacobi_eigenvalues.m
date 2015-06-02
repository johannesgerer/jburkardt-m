function lambda = jacobi_eigenvalues ( n )

%*****************************************************************************80
%
%% JACOBI_EIGENVALUES returns the eigenvalues of the Jacobi matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda(1:n,1) = legendre_zeros ( n );

  return
end
