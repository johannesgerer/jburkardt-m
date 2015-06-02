function lambda = carry_eigenvalues ( n, alpha )

%*****************************************************************************80
%
%% CARRY_EIGENVALUES returns the eigenvalues of the CARRY matrix.
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
%    Input, integer N, the order of the matrix.
%
%    Input, integer ALPHA, the numeric base being used in the addition.
%
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  for i = 1 : n
    lambda(i,1) = 1.0 / alpha^(i-1);
  end

  return
end
