function lambda = exchange_eigenvalues ( n )

%*****************************************************************************80
%
%% EXCHANGE_EIGENVALUES returns the eigenvalues of the exchange matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  n2 = floor ( n / 2 );

  lambda(1:n2) = -1.0;
  lambda(n2+1:n) = +1.0;

  return
end
