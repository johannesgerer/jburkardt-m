function lambda = combin_eigenvalues ( alpha, beta, n )

%*****************************************************************************80
%
%% COMBIN_EIGENVALUES returns the eigenvalues of the COMBIN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, scalars that define A.
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:n-1,1) = alpha;
  lambda(n,1) = alpha + n * beta;

  return
end
