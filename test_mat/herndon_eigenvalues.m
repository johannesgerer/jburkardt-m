function lambda = herndon_eigenvalues ( n )

%*****************************************************************************80
%
%% HERNDON_EIGENVALUES returns the eigenvalues of the Herndon matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  p = 3.0 + sqrt ( ( 4 * n - 3 ) * ( n - 1 ) * 3 ) / ( n + 1 ) );

  lambda(1:n-2) = 1.0;
  lambda(n-1) = 6.0 / ( p * ( n + 1 ) );
  lambda(n) = p / ( n * ( 5 - 2 * n ) );

  return
end
