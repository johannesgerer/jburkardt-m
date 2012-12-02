function b = r8bb_to_r8ge ( n1, n2, ml, mu, a )

%*****************************************************************************80
%
%% R8BB_TO_R8GE copies a R8BB matrix to a R8GE matrix.
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
%    A should be defined as a vector.  The user must then store
%    the entries of the four blocks of the matrix into the vector A.
%    Each block is stored by columns.
%
%    A1, the banded portion of the matrix, is stored in
%    the first (2*ML+MU+1)*N1 entries of A, using standard LINPACK
%    general band format.  The reason for the factor of 2 in front of
%    ML is to allocate space that may be required if pivoting occurs.
%
%    The following formulas should be used to determine how to store
%    the entry corresponding to row I and column J in the original matrix:
%
%    Entries of A1:
%
%      1 <= I <= N1, 1 <= J <= N1, (J-I) <= MU and (I-J) <= ML.
%
%      Store the I, J entry into location
%      (I-J+ML+MU+1)+(J-1)*(2*ML+MU+1).
%
%    Entries of A2:
%
%      1 <= I <= N1, N1+1 <= J <= N1+N2.
%
%      Store the I, J entry into location
%      (2*ML+MU+1)*N1+(J-N1-1)*N1+I.
%
%    Entries of A3:
%
%      N1+1 <= I <= N1+N2, 1 <= J <= n1.
%
%      Store the I, J entry into location
%      (2*ML+MU+1)*N1+N1*N2+(J-1)*N2+(I-N1).
%
%    Entries of A4:
%
%      N1+1 <= I <= N1+N2, N1+1 <= J <= N1+N2
%
%      Store the I, J entry into location
%      (2*ML+MU+1)*N1+N1*N2+(J-1)*N2+(I-N1).
%      (same formula used for A3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2004
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
%    ML and MU must be nonnegative, and no greater than N1-1.
%
%    Input, real A((2*ML+MU+1)*N1+2*N1*N2+N2*N2), the R8BB matrix.
%
%    Output, real B(N1+N2,N1+N2), the R8GE matrix.
%
  for i = 1 : n1
    for j = 1 : n1

      if ( mu+ml < (j-i) | ml < (i-j) )
        b(i,j) = 0.0;
      else
        ij = (i-j+ml+mu+1)+(j-1)*(2*ml+mu+1);
        b(i,j) = a(ij);
      end

    end
  end

  for i = 1 : n1
    for j = n1+1 : n2
      ij = (2*ml+mu+1)*n1+(j-n1-1)*n1+i;
      b(i,j) = a(ij);
    end
  end

  for i = n1+1 : n2
    for j = 1 : n1+n2
      ij = (2*ml+mu+1)*n1+n2*n1+(j-1)*n2+(i-n1);
      b(i,j) = a(ij);
    end
  end

  return
end
