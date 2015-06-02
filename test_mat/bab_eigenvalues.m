function lambda = bab_eigenvalues ( n, alpha, beta )

%*****************************************************************************80
%
%% BAB_EIGENVALUES returns the eigenvalues of the BAB matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, BETA, the parameters.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  for i = 1 : n
    angle = i * pi / ( n + 1 );
    lambda(i,1) = alpha + 2.0 * beta * cos ( angle );
  end

  return
end
