function lambda = clement2_eigenvalues ( n )

%*****************************************************************************80
%
%% CLEMENT2_EIGENVALUES returns the eigenvalues of the CLEMENT2 matrix.
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
%    Output, real LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    lambda(i) = - n - 1 + 2 * i;
  end

  return
end

