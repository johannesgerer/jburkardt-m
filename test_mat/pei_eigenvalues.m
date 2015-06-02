function lambda = pei_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% PEI_EIGENVALUES returns the eigenvalues of the PEI matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines the Pei matrix.  A
%    typical value of ALPHA is 1.0.
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:n-1,1) = alpha;
  lambda(n,1) = alpha + n;

  return
end
