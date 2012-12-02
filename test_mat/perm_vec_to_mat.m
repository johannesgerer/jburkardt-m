function a = perm_vec_to_mat ( n, p )

%*****************************************************************************80
%
%% PERM_VEC_TO_MAT returns a permutation matrix.
%
%  Formula:
%
%    if ( J = P(I) )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5, P = ( 2, 4, 1, 3, 5 )
%
%    0  1  0  0  0
%    0  0  0  1  0
%    1  0  0  0  0
%    0  0  1  0  0
%    0  0  0  0  1
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is a zero/one matrix.
%
%    P is a proper definition of a permutation if and only if
%    every value from 1 to N occurs exactly once.  The matrix A
%    will be a permutation matrix if and only if P is a proper
%    definition of a permutation.
%
%    A is nonsingular.
%
%    The inverse of A is the transpose of A, inverse ( A ) = A'.
%
%    The inverse of A is the permutation matrix corresponding to the
%    inverse permutation of the one that formed A.
%
%    det ( A ) = +1 or -1.
%
%    A is unimodular.
%
%    The determinant of A is +1 or -1, depending on the sign of
%    the permutation; Any permutation can be written as the product
%    of pairwise transpositions.  An odd permutation can be written
%    as an odd number of such transpositions, and the corresponding
%    matrix has a determinant of -1.
%
%    The product of two permutation matrices is a permutation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer P(N), contains the permutation.  The
%    entries of P should be a permutation of the indices 1 through N.
%
%    Output, real A(N,N), the matrix.
%
  ierror = perm_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_VEC_TO_MAT - Fatal error!\n' );
    fprintf ( 1, '  The input does not define a permutation.\n' );
    fprintf ( 1, '  PERM_CHECK returned IERROR = %d\n', ierror );
    i4vec_print ( n, p, '  The permutation:' );
    error ( 'PERM_VEC_TO_MAT - Fatal error!' );
  end

  for i = 1 : n
    for j = 1 : n
      if ( j == p(i) )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
