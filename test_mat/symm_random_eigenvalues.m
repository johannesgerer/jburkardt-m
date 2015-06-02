function lambda = symm_random_eigenvalues ( n, d, key )

%*****************************************************************************80
%
%% SYMM_RANDOM_EIGENVALUES returns the eigenvalues of the SYMM_RANDOM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real D(N), the desired eigenvalues for the matrix.
%
%    Input, integer KEY, a positive integer that selects the data.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  d = d(:);

  lambda = d;

  return
end
