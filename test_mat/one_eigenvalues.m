function lambda = one_eigenvalues ( n )

%*****************************************************************************80
%
%% ONE_EIGENVALUES returns the eigenvalues of the ONE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:n-1,1) = 0.0;
  lambda(n,1) = n;

  return
end
