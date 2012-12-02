function lambda = carry_eigenvalues ( alpha, n )

%*****************************************************************************80
%
%% CARRY_EIGENVALUES returns the eigenvalues of the Carry matrix.
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
%    Input, integer ALPHA, the ALPHA value, which represents the
%    numeric base being used in the addition.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  for i = 1 : n
    lambda(i) = 1.0 / alpha^(i-1);
  end

  return
end
