function determ = symm_random_determinant ( n, x )

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
%    25 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the desired eigenvalues for the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = prod ( x(1:n) );

  return
end
