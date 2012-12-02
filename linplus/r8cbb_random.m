function [ a, seed ] = r8cbb_random ( n1, n2, ml, mu, seed )

%*****************************************************************************80
%
%% R8CBB_RANDOM randomizes a R8CBB matrix.
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
%    16 February 2005
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A((ML+MU+1)*N1 + 2*N1*N2 + N2*N2), the R8CBB matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Randomize the banded matrix A1.
%  We still believe that the "junk" entries should be set to 0.
%
  for j = 1 : n1
    for row = 1 : ml+mu+1
      i = row + j - mu - 1;
      if ( 1 <= i & i <= n1 )
        [ r, seed ] = r8_uniform_01 ( seed );
      else
        r = 0.0;
      end
      a(row+(j-1)*(ml+mu+1)) = r;
    end
  end
%
%  Randomize the rectangular strips A2+A3+A4.
%
  for k = (ml+mu+1) * n1 + 1 : (ml+mu+1) * n1 + 2*n1*n2 + n2*n2
    [ a(k), seed ] = r8_uniform_01 ( seed );
  end

  return
end
