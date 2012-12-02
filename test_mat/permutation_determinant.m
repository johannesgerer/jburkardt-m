function determ = permutation_determinant ( n, a )

%*****************************************************************************80
%
%% PERMUTATION_DETERMINANT returns the determinant of the PERMUTATION matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Output, real DETERM, the determinant.
%
  p = perm_mat_to_vec ( n, a );

  p_sign = perm_sign ( n, p );

  determ = p_sign;

  return
end
