function value = kms_eigenvalues_theta_f ( alpha, n, t )

%*****************************************************************************80
%
%% KMS_EIGENVALUES_THETA_F evaluates a function for KMS eigenvalues.
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
%    Input, real T, an angle associated with the eigenvalue.
%
%    Output, real VALUE, the function value.
%
  value = sin ( ( n + 1 ) * t ) ...
    - 2.0 * alpha * sin ( n * t ) ...
    + alpha * alpha * sin ( ( n - 1.0 ) * t );

  return
end
