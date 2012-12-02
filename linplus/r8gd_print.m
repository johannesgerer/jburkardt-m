function r8gd_print ( n, ndiag, offset, a, title )

%*****************************************************************************80
%
%% R8GD_PRINT prints a R8GD matrix.
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
%    07 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of columns of the matrix.
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
%    Input, string TITLE, a title to be printed.
%
  r8gd_print_some ( n, ndiag, offset, a, 1, 1, n, n, title );

  return
end
