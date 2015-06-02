function determ = symm_random_determinant ( n, d, key )

%*****************************************************************************80
%
%% SYMM_RANDOM_DETERMINANT returns the determinant of the SYMM_RANDOM matrix.
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
%    Output, real DETERM, the determinant.
%
  determ = prod ( d(1:n) );

  return
end
