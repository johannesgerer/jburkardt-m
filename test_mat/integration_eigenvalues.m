function lambda = integration_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% INTEGRATION_EIGENVALUES returns the eigenvalues of the INTEGRATION matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar which defines the first 
%    superdiagonal of the matrix.
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  lambda(1:n) = 1.0;

  return
end
