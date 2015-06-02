function lambda = pascal1_eigenvalues ( n )

%*****************************************************************************80
%
%% PASCAL1_EIGENVALUES returns eigenvalues of the PASCAL1 matrix.
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
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  lambda(1:n,1) = 1.0;

  return
end
