function lambda = rodman_eigenvalues ( n, alpha )

%*****************************************************************************80
%
%% RODMAN_EIGENVALUES returns the eigenvalues of the RODMAN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:n-1,1) = 1.0 - alpha;

  lambda(n,1) = 1.0 + alpha * ( n - 1 );

  return
end
