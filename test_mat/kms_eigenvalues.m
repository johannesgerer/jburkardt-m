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
%    A typical value is 0.5.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  theta = kms_eigenvalues_theta ( alpha, n );

  lambda(1:n) = ( 1.0 + alpha ) * ( 1.0 - alpha ) ...
    ./ ( 1.0 - 2.0 * alpha * cos ( theta(1:n) ) + alpha * alpha );

  return
end
