function a = rowcolsum_matrix ( row_num, col_num, m, n )

%*****************************************************************************80
%
%% ROWCOLSUM_MATRIX returns the row and column sum matrix.
%
%  Discussion:
%
%    The row and column sum matrix is the linear operator which returns
%    the sums of the rows and columns of a rectangular data array.
%
%    For instance, if the data array has 2 rows and 3 columns,
%    with the values:
%
%      1 2 3
%      4 5 6
%
%    then the row sums are (6,15) and the column sums are (5,7,9), and
%    the matrix, data, and row/column sums can be put in the form:
%
%      1 1 1 0 0 0   1    6
%      0 0 0 1 1 1   2   15
%      1 0 0 1 0 0 * 3 =  5
%      0 1 0 0 1 0   4    7
%      0 0 1 0 0 1   5    9
%                    6
%
%    Here, we have linearly arranged the data array to constitute an
%    element X of an N = ROW_NUM * COL_NUM space, and the row and column sum
%    vectors now form a right hand side vector B which is an element of
%    M = ROW_NUM + COL_NUM space.
%
%    The M by N matrix A has an interesting structure and properties.  In
%    particular, its row rank, rank, range, null space, eigenvalues and
%    eigenvectors are worth knowing.  In some cases, these abstract properties
%    have an interesting explanation or interpretation when looked at
%    in terms of the data array and its row and column sums.
%
%    (Determining something about a matrix from its row and column sums
%    comes up in computer tomography.  A sort of generalized problem of
%    determining the contents of the cells in a rectangular array based on
%    row and column summary information is presented as a game called
%    "Paint by Numbers" or "Descartes's Enigma".  The interpretation of
%    tables of data representing the abundance of different species in
%    different habitats is of some interest in biology, and requires the
%    ability to generate random matrices with 0 or 1 data entries and
%    given row and column sum vectors.)
%
%  Row Rank:
%
%    It is clear that most values of ROW_NUM and COL_NUM, the matrix
%    maps a very large space into a small one, and hence must be
%    chock full of singularity.  We may still wonder if the matrix
%    has as much nonsingularity as possible.  Except for the 1 by 1 case,
%    it doesn't.
%
%    The fact that the sum of the first ROW_NUM rows of the
%    matrix equals the sum of the last COL_NUM rows of the matrix means
%    that the matrix has row rank no more than M-1.  Assuming that 1 < M,
%    then this means we have less than full row rank, and hence there is
%    a corresponding null vector.
%
%    (But this loss of full row rank HAD to happen: the fact that
%    the sum of the row sums equals the sum of the column sums means
%    that the "B" objects that A creates are constrained.  Hence A does
%    not have full range in the image space, and hence there
%    must be some additional loss of rank beyond the requirements imposed
%    simply by the number of rows in the matrix%)
%
%    To determine this null vector, note that:
%
%    * if either ROW_NUM or COL_NUM is even, then a corresponding null
%      vector is the checkerboard vector which is +1 on "red" data cells
%      and -1 on "black" ones.
%
%    * If ROW_NUM and COL_NUM are both odd and greater than 1, then
%      put -1 in each corner, +4 in the center and zeros elsewhere.
%
%    * If ROW_NUM and COL_NUM are both odd, and exactly one of them is 1,
%      then the data array is a single row or column containing an odd number
%      of cells greater than 1.  Put a -1 in the first and last, and put
%      +2 in the center cell.  The other cells can be set to zero.
%
%    * If ROW_NUM and COL_NUM are both odd, and both are in fact 1, then
%      we already pointed out that the matrix has full row rank and there
%      is no corresponding null vector.
%
%    We can deduce that the row rank of A is exactly M-1 (when 1 < M )
%    by noting that if we placed the column summing rows first,
%    and then listed the row summing rows, except that we replaced the
%    first row summing row by a zero row, and moved that to the end,
%    then A is in REDUCED ROW ECHELON FORM and hence must have row rank
%    at least M-1, since there is a leading one in each row.
%
%  Rank:
%
%    This in turn means that (for 1 < M ) the rank of A is also M-1.
%
%  Range:
%
%    We have noted that, by construction, a vector B can be an image
%    of some data vector X only if the sum of the row sum entries equals
%    the sum of the column sum entries.  In fact, we can regard this
%    as defining the range of A, which is the linear subspace of
%    M-space in which the sum of the first ROW_NUM entries equals the
%    sum of the final COL_NUM entries.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ROW_NUM, COL_NUM, the number of rows and 
%    columns in the data array associated with the row and column sum matrix.
%
%    Output, integer M, the number of rows of A, which is 
%    ROW_NUM + COL_NUM.
%
%    Output, integer N, the number of columns of A, which is 
%    ROW_NUM * COL_NUM.
%
%    Output, real A(ROW_NUM+COL_NUM,ROW_NUM * COL_NUM), the 
%    row and column sum matrix.
%
  m = row_num + col_num;
  n = row_num * col_num;

  a = zeros ( m, n );
%
%  Set the matrix rows that compute a row sum.
%
  for row = 1 : row_num

    jlo = ( row - 1 ) * col_num + 1;
    jhi =   row       * col_num;

    a(row,jlo:jhi) = 1.0;

  end
%
%  Set the matrix rows that compute a column sum.
%
  for col = 1 : col_num

    jlo = col;
    jhi = ( row_num - 1 ) * col_num + col;

    a(col+row_num,jlo:jhi:col_num) = 1.0;

  end

  return
end
