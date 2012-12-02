function a = r8bb_indicator ( n1, n2, ml, mu )

%*****************************************************************************80
%
%% R8BB_INDICATOR sets up a R8BB indicator matrix.
%
%  Discussion:
%
%    The R8BB storage format is for a border banded matrix.  Such a
%    matrix has the logical form:
%
%      A1 | A2
%      ---+---
%      A3 | A4
%
%    with A1 a (usually large) N1 by N1 banded matrix, while A2, A3 and A4
%    are dense rectangular matrices of orders N1 by N2, N2 by N1, and N2 by N2,
%    respectively.
%
%  Example:
%
%    With N1 = 4, N2 = 1, ML = 1, MU = 2, the matrix entries would be:
%
%       00
%       00  00
%       00  00  00 --- ---
%      A11 A12 A13  00 ---  A16 A17
%      A21 A22 A23 A24  00  A26 A27
%      --- A32 A33 A34 A35  A36 A37
%      --- --- A43 A44 A45  A46 A47
%      --- --- --- A54 A55  A56 A57
%                       00
%
%      A61 A62 A63 A64 A65  A66 A67
%      A71 A72 A73 A74 A75  A76 A77
%
%    The matrix is actually stored as a vector, and we will simply suggest
%    the structure and values of the indicator matrix as:
%
%      00 00 00 00 00
%      00 00 13 24 35     16 17     61 62 63 64 65     66 67
%      00 12 23 34 45  +  26 27  +  71 72 73 74 75  +  76 77
%      11 22 33 44 55     36 37     
%      21 32 43 54 00     46 47     
%                         56 57     
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, the order of the banded and dense blocks.
%    N1 and N2 must be nonnegative, and at least one must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative and no greater than N1-1.
%
%    Output, real A((2*ML+MU+1)*N1+2*N1*N2+N2*N2), the R8BB matrix.
%
  fac = 10^( i4_log_10 ( n1 + n2 ) + 1 );
%
%  Set the banded matrix A1.
%
  for j = 1 : n1
    for row = 1 : 2 * ml + mu + 1
      i = row + j - ml - mu - 1;
      if ( ml < row & 1 <= i & i <= n1 )
        a(row+(j-1)*(2*ml+mu+1)) = fac * i + j;
      else
        a(row+(j-1)*(2*ml+mu+1)) = 0.0;
      end
    end
  end
%
%  Set the N1 by N2 rectangular strip A2.
%
  base = ( 2 * ml + mu + 1 ) * n1;

  for i = 1 : n1
    for j = n1 + 1 : n1 + n2
      a(base + i + (j-n1-1)*n1 ) = fac * i + j;
    end
  end
%
%  Set the N2 by N1 rectangular strip A3.
%
  base = ( 2 * ml + mu + 1 ) * n1 + n1 * n2;

  for i = n1 + 1 : n1 + n2
    for j = 1 : n1
      a(base + i-n1 + (j-1)*n2 ) = fac * i + j;
    end
  end
%
%  Set the N2 by N2 square A4.
%
  base = ( 2 * ml + mu + 1 ) * n1 + n1 * n2 + n2 * n1;

  for i = n1 + 1 : n1 + n2
    for j = n1 + 1 : n1 + n2
      a(base + i-n1 + (j-n1-1)*n2 ) = fac * i + j;
    end
  end

  return
end
