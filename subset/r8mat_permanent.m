function perm = r8mat_permanent ( n, a )

%*****************************************************************************80
%
%% R8MAT_PERMANENT computes the permanent of an R8MAT.
%
%  Discussion:
%
%    The permanent function is similar to the determinant.  Recall that
%    the determinant of a matrix may be defined as the sum of all the
%    products:
%
%      S * A(1,I(1)) * A(2,I(2)) * ... * A(N,I(N))
%
%    where I is any permutation of the columns of the matrix, and S is the
%    sign of the permutation.  By contrast, the permanent function is
%    the (unsigned) sum of all the products
%
%      A(1,I(1)) * A(2,I(2)) * ... * A(N,I(N))
%
%    where I is any permutation of the columns of the matrix.  The only
%    difference is that there is no permutation sign multiplying each summand.
%
%    Symbolically, then, the determinant of a 2 by 2 matrix
%
%      a b
%      c d
%
%    is a*d-b*c, whereas the permanent of the same matrix is a*d+b*c.
%
%
%    The permanent is invariant under row and column permutations.
%    If a row or column of the matrix is multiplied by S, then the
%      permanent is likewise multiplied by S.
%    If the matrix is square, then the permanent is unaffected by
%      transposing the matrix.
%    Unlike the determinant, however, the permanent does change if
%      one row is added to another, and it is not true that the
%      permanent of the product is the product of the permanents.
%
%
%    Note that if A is a matrix of all 1's and 0's, then the permanent
%    of A counts exactly which permutations hit exactly 1's in the matrix.
%    This fact can be exploited for various combinatorial purposes.
%
%    For instance, setting the diagonal of A to 0, and the offdiagonals
%    to 1, the permanent of A counts the number of derangements of N
%    objects.
%
%    Setting the diagonal of A to 0, and ensuring that the offdiagonal
%    entries are symmetric, then A is the adjacency matrix of a graph,
%    and its permanent counts the number of perfect matchings.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 August 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the value of the matrix.
%
%    Output, real PERM, the value of the permanent of the matrix.
%
  more = 0;

  for i = 1 : n
    c(i) = a(i,n) - 0.5 * sum ( a(i,1:n) );
  end

  p = 0.0;
  sgn = -1.0;
  b = [];
  ncard = [];

  while ( 1 )

    sgn = -sgn;
%
%  The proper form of this call to SUBSET_GRAY_NEXT has not been set yet.
%
    [ b, more, ncard, iadd ] = subset_gray_next ( n-1, b, more, ncard );

    if ( ncard ~= 0 )
      z = ( 2 * b(iadd) - 1 );
      c(1:n) = c(1:n) + z * a(1:n,iadd)';
    end

    p = p + sgn * prod ( c(1:n) );

    if ( ~more )
      break
    end

  end

  perm = p * ( 4 * mod ( n, 2 ) - 2 );

  return
end
