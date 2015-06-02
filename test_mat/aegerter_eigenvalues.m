function lambda = aegerter_eigenvalues ( n )

%*****************************************************************************80
%
%% AEGERTER_EIGENVALUES returns the eigenvalues of the AEGERTER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  determ = n - ( ( n - 1 ) * n * ( 2 * n - 1 ) ) / 6;

  lambda(1,1)     = 0.5 * ( n + 1 - sqrt ( ( n + 1 )^2 - 4.0 * determ ) );
  lambda(2:n-1,1) = 1.0;
  lambda(n,1)     = 0.5 * ( n + 1 + sqrt ( ( n + 1 )^2 - 4.0 * determ ) );

  return
end
