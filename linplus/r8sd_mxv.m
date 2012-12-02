function b = r8sd_mxv ( n, ndiag, offset, a, x )

%*****************************************************************************80
%
%% R8SD_MXV multiplies a R8SD matrix times a vector.
%
%  Discussion:
%
%    The R8SD storage format is for symmetric matrices whose only nonzero entries
%    occur along a few diagonals, but for which these diagonals are not all
%    close enough to the main diagonal for band storage to be efficient.
%
%    In that case, we assign the main diagonal the offset value 0, and 
%    each successive superdiagonal gets an offset value 1 higher, until
%    the highest superdiagonal (the A(1,N) entry) is assigned the offset N-1.
%
%    Assuming there are NDIAG nonzero diagonals (ignoring subdiagonals!),
%    we then create an array B that has N rows and NDIAG columns, and simply
%    "collapse" the matrix A to the left:
%
%  Example:
%
%    The "offset" value is printed above each column.
%
%    Original matrix               New Matrix
%
%       0   1   2   3   4   5       0   1   3   5
%
%      11  12   0  14   0  16      11  12  14  16
%      21  22  23   0  25   0      22  23  25  --
%       0  32  33  34   0  36      33  34  36  --
%      41   0  43  44  45   0      44  45  --  --
%       0  52   0  54  55  56      55  56  --  --
%      61   0  63   0  65  66      66  --  --  --
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2004
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
%    Input, integer NDIAG, the number of diagonals that are stored.
%    NDIAG must be at least 1 and no more than N.
%
%    Input, integer OFFSET(NDIAG), the offsets for the diagonal storage.
%
%    Input, real A(N,NDIAG), the R8SD matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  b(1:n) = 0.0E+00;

  for i = 1 : n
    for jdiag = 1 : ndiag
      j = i + offset(jdiag);
      if ( 1 <= j & j <= n )
        b(i) = b(i) + a(i,jdiag) * x(j);
        if ( offset(jdiag) ~= 0 )
          b(j) = b(j) + a(i,jdiag) * x(i);
        end
      end
    end
  end

  return
end
