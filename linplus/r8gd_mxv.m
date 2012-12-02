function b = r8gd_mxv ( n, ndiag, offset, a, x )

%*****************************************************************************80
%
%% R8GD_MXV multiplies a R8GD matrix by a vector.
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
%  Example:
%
%    The "offset" value is printed near the first entry of each diagonal
%    in the original matrix, and above the columns in the new matrix.
%
%    Original matrix               New Matrix
%
%      0    1   2   3   4   5        -3  -2   0   1   3   5
%       \    \   \   \   \   \
%        11  12   0  14   0  16      --  --  11  12  14  16
%   -1 =  0  22  23   0  25   0      --  --  22  23  25  --
%   -2 = 31   0  33  34   0  36      --  31  33  34  36  --
%   -3 = 41  42   0  44  45   0      41  42  44  45  --  --
%   -4 =  0  52  53   0  55  56      52  53  55  56  --  --
%   -5 =  0   0  63  64  65  66      63  64  66  --  --  --
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
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  b(1:n) = 0.0E+00;

  for i = 1 : n
    for diag = 1 : ndiag
      j = i + offset(diag);
      if ( 1 <= j & j <= n )
        b(i) = b(i) + a(i,diag) * x(j);
      end
    end
  end

  return
end
