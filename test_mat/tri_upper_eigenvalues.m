function lambda = tri_upper_eigenvalues ( n )

%*****************************************************************************80
%
%% TRI_UPPER_EIGENVALUES returns the eigenvalues of the TRI_UPPER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:n,1) = 1.0;

  return
end
