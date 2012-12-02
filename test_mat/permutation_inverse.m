function b = permutation_inverse ( n, a )

%*****************************************************************************80
%
%% PERMUTATION_INVERSE returns the inverse of a PERMUTATION matrix.
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
%    Output, real B(N,N), the inverse matrix.
%
  p = perm_mat_to_vec ( n, a );

  p = perm_inverse ( n, p );

  b = perm_vec_to_mat ( n, p );

  return
end
