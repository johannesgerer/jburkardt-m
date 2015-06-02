function lambda = zero_eigenvalues ( n )

%*****************************************************************************80
%
%% ZERO_EIGENVALUES returns the eigenvalues of the ZERO matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 November 2007
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
  lambda(1:n,1) = 0.0;

  return
end

