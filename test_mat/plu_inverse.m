function a = plu_inverse ( n, p, l, u )

%*****************************************************************************80
%
%% PLU_INVERSE returns the inverse of a PLU matrix.
%
%  Discussion:
%
%    The inverse matrix is represented by its PLU factors.  The output matrix
%    is given as a single matrix, the product
%
%      inverse(A) = inverse(U) * inverse(L) * inverse(P)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real P(N,N), L(N,N), U(N,N), the P, L and U factors
%    of the matrix.
%
%    Output, real A(N,N), the inverse matrix.
%
  p_inverse = permutation_inverse ( n, p );

  l_inverse = tri_l1_inverse ( n, l );

  u_inverse = tri_u_inverse ( n, u );

  a = u_inverse * l_inverse * p_inverse;

  return
end
