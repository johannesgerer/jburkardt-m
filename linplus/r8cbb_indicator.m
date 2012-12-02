function a = r8cbb_indicator ( n1, n2, ml, mu )

%*****************************************************************************80
%
%% R8CBB_INDICATOR sets up a R8CBB indicator matrix.
%
%  Discussion:
%
%    The R8CBB storage format is for a compressed border banded matrix.  
%    Such a matrix has the logical form:
%
%      A1 | A2
%      ---+---
%      A3 | A4
%
%    with A1 a (usually large) N1 by N1 banded matrix, while A2, A3 and A4
%    are dense rectangular matrices of orders N1 by N2, N2 by N1, and N2 by N2,
%    respectively.  
%
%    The R8CBB format is the same as the DBB format, except that the banded
%    matrix A1 is stored in compressed band form rather than standard
%    banded form.  In other words, we do not include the extra room
%    set aside for fill in during pivoting.
%
%    A should be defined as a vector.  The user must then store
%    the entries of the four blocks of the matrix into the vector A.
%    Each block is stored by columns.
%
%    A1, the banded portion of the matrix, is stored in
%    the first (ML+MU+1)*N1 entries of A, using the obvious variant
%    of the LINPACK general band format.
%
%    The following formulas should be used to determine how to store
%    the entry corresponding to row I and column J in the original matrix:
%
%    Entries of A1:
%
%      1 <= I <= N1, 1 <= J <= N1, (J-I) <= MU and (I-J) <= ML.
%
%      Store the I, J entry into location
%      (I-J+MU+1)+(J-1)*(ML+MU+1).
%
%    Entries of A2:
%
%      1 <= I <= N1, N1+1 <= J <= N1+N2.
%
%      Store the I, J entry into location
%      (ML+MU+1)*N1+(J-N1-1)*N1+I.
%
%    Entries of A3:
%
%      N1+1 <= I <= N1+N2, 1 <= J <= N1.
%
%      Store the I, J entry into location
%      (ML+MU+1)*N1+N1*N2+(J-1)*N2+(I-N1).
%
%    Entries of A4:
%
%      N1+1 <= I <= N1+N2, N1+1 <= J <= N1+N2
%
%      Store the I, J entry into location
%      (ML+MU+1)*N1+N1*N2+(J-1)*N2+(I-N1).
%      (same formula used for A3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2004
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
%    Output, real A((ML+MU+1)*N1+2*N1*N2+N2*N2), the R8CBB matrix.
%
  fac = 10^( i4_log_10 ( n1 + n2 ) + 1 );
%
%  Set the banded matrix A1.
%
  for j = 1 : n1
    for row = 1 : ml + mu + 1
      i = row + j - mu - 1;
      if ( 1 <= i & i <= n1 )
        a(row+(j-1)*(ml+mu+1)) = fac * i + j;
      else
        a(row+(j-1)*(ml+mu+1)) = 0.0;
      end
    end
  end
%
%  Set the N1 by N2 rectangular strip A2.
%
  base = ( ml + mu + 1 ) * n1;

  for i = 1 : n1
    for j = n1 + 1 : n1 + n2
      a(base + i + (j-n1-1)*n1 ) = fac * i + j;
    end
  end
%
%  Set the N2 by N1 rectangular strip A3.
%
  base = ( ml + mu + 1 ) * n1 + n1 * n2;

  for i = n1 + 1 : n1 + n2
    for j = 1 : n1
      a(base + i-n1 + (j-1)*n2 ) = fac * i + j;
    end
  end
%
%  Set the N2 by N2 square A4.
%
  base = ( ml + mu + 1 ) * n1 + n1 * n2 + n2 * n1;

  for i = n1 + 1 : n1 + n2
    for j = n1 + 1 : n1 + n2
      a(base + i-n1 + (j-n1-1)*n2 ) = fac * i + j;
    end
  end

  return
end
