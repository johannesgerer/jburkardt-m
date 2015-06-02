function lambda = kms_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% KMS_EIGENVALUES returns the eigenvalues of the KMS matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Trench,
%    Spectral decomposition of Kac-Murdock-Szego matrices,
%    Unpublished technical document.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.
%    Eigenvalue computations require 0 <= ALPHA <= 1.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  theta(1:n,1) = kms_eigenvalues_theta ( alpha, n );

  lambda(1:n,1) = ( 1.0 + alpha ) * ( 1.0 - alpha ) ...
    ./ ( 1.0 - 2.0 * alpha * cos ( theta(1:n,1) ) + alpha * alpha );

  return
end
