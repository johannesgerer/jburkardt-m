function lam = jordan_eigenvalues ( n, alpha )

%*****************************************************************************80
%
%% JORDAN_EIGENVALUES returns the eigenvalues of the JORDAN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the eigenvalue of the Jordan matrix.
%
%    Output, real LAM(N,1), the eigenvalues.
%
  lam = alpha * ones ( n, 1 );

  return
end
