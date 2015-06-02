function lambda = chow_eigenvalues ( alpha, beta, n )

%*****************************************************************************80
%
%% CHOW_EIGENVALUES returns the eigenvalues of the CHOW matrix.
%
%  Example:
%
%    ALPHA = 2, BETA = 3, N = 5
%
%    9.49395943
%    6.10991621
%    3.0
%    3.0
%    3.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the ALPHA value.  A typical value is 1.0.
%
%    Input, real BETA, the BETA value.  A typical value is 0.0.
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues of A.
%
  lambda = zeros ( n, 1 );

  k = n - round ( ( n + 1 ) / 2 );

  for i = 1 : k
    angle = i * pi / ( n + 2 );
    lambda(i,1) = beta + 4.0 * alpha * ( cos ( angle ) )^2;
  end

  lambda(k+1:n,1) = beta;

  return
end
