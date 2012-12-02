function lambda = rodman_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% RODMAN_EIGENVALUES returns the eigenvalues of the Rodman matrix.
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
%    Input, real ALPHA, the scalar that defines A.
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda(1:n-1) = 1.0 - alpha;

  lambda(n) = 1.0 + alpha * ( n - 1 );

  return
end
