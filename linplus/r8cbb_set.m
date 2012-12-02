function a = r8cbb_set ( n1, n2, ml, mu, a, i, j, value )

%*****************************************************************************80
%
%% R8CBB_SET sets the value of an entry in a R8CBB matrix.
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
%    ML and MU must be nonnegative, and no greater than N1-1.
%
%    Input, real A((ML+MU+1)*N1 + 2*N1*N2 + N2*N2), the R8CBB matrix.
%
%    Input, integer I, J, the row and column of the entry to set.
%
%    Input, real VALUE, the value to be assigned to the (I,J) entry.
%
%    Output, real A((ML+MU+1)*N1 + 2*N1*N2 + N2*N2), the updated R8CBB matrix.
%

%
%  Check for I or J out of bounds.
%
  if ( i <= 0 | n1+n2 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CBB_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of row index I = %d\n', i );
    error ( 'R8CBB_SET - Fatal error!' );
  end

  if ( j <= 0 | n1+n2 < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CBB_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of column index J = %d\n', j );
    error ( 'R8CBB_SET - Fatal error!' );
  end
%
%  The A1 block of the matrix.
%
%  Check for out of band problems.
%
  if ( i <= n1 & j <= n1 )
    if ( mu < (j-i) | ml < (i-j) )
      if ( value ~= 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8CBB_SET - Warning!\n' );
        fprintf ( 1, '  Unable to set entry (%d,%d).\n', i, j );
        error ( 'R8CBB_SET - Warning!' );
      end
      return
    else
      ij = (i-j+mu+1)+(j-1)*(ml+mu+1);
    end
%
%  The A2 block of the matrix:
%
  elseif ( i <= n1 & n1 < j )
    ij = (ml+mu+1)*n1 + (j-n1-1)*n1 + i;
%
%  The A3 and A4 blocks of the matrix.
%
  else if ( n1 < i )
    ij = (ml+mu+1)*n1 + n2*n1 + (j-1)*n2 + (i-n1);
  end

  a(ij) = value;

  return
end
