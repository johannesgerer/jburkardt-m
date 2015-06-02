function lambda = clement1_eigenvalues ( n )

%*****************************************************************************80
%
%% CLEMENT1_EIGENVALUES returns the eigenvalues of the CLEMENT1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2008
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

  for i = 1 : n
    lambda(i,1) = - n - 1 + 2 * i;
  end

  return
end

