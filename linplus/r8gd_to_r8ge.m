function b = r8gd_to_r8ge ( n, ndiag, offset, a )

%*****************************************************************************80
%
%% R8GD_TO_R8GE copies a R8GD matrix to a R8GE matrix.
%
%  Discussion:
%
%    The R8GD storage format is suitable for matrices whose only nonzero entries
%    occur along a few diagonals, but for which these diagonals are not all
%    close enough to the main diagonal for band storage to be efficient.
%
%    In that case, we assign the main diagonal the offset value 0.
%    Each successive superdiagonal gets an offset value 1 higher, until
%    the highest superdiagonal (the A(1,N) entry) is assigned the offset N-1.
%    Similarly, the subdiagonals are assigned offsets of -1 through -(N-1).
%
%    Now, assuming that only a few of these diagonals contain nonzeros,
%    then for the I-th diagonal to be saved, we stored its offset in
%    OFFSET(I), and its entries in column I of the matrix.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer NDIAG, the number of diagonals of the matrix
%    that are stored in the array.
%    NDIAG must be at least 1, and no more than 2 * N - 1.
%
%    Input, integer OFFSET(NDIAG), the offsets for the diagonal storage.
%
%    Input, real A(N,NDIAG), the R8GD matrix.
%
%    Output, real B(N,N), the R8GE matrix.
%
  b(1:n,1:n) = 0.0E+00;

  for i = 1 : n
    for diag = 1 : ndiag
      j = i + offset(diag);
      if ( 1 <= j & j <= n )
        b(i,j) = a(i,diag);
      end
    end
  end

  return
end
