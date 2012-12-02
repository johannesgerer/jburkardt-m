function x = r8cbb_sl ( n1, n2, ml, mu, a_lu, b )

%*****************************************************************************80
%
%% R8CBB_SL solves a R8CBB system factored by R8CBB_FA.
%
%  Discussion:
%
%    Note that in C++ and FORTRAN, we can look at A as an abstract
%    vector, but then look at parts of A as storing a two dimensional
%    array.  MATLAB assigns an inherent dimensionality to a data object,
%    and gets very unhappy when you try to manipulate the data yourself.
%    This means that the MATLAB implementation of this routine requires
%    the use of temporary 2D arrays.
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
%    The linear system A * x = b is decomposable into the block system:
%
%      ( A1 A2 ) * (X1) = (B1)
%      ( A3 A4 )   (X2)   (B2)
%
%    where A1 is a (usually big) banded square matrix, A2 and A3 are
%    column and row strips which may be nonzero, and A4 is a dense
%    square matrix.
%
%    All the arguments except B are input quantities only, which are
%    not changed by the routine.  They should have exactly the same values
%    they had on exit from R8CBB_FA.
%
%    If more than one right hand side is to be solved, with the same
%    matrix, R8CBB_SL should be called repeatedly.  However, R8CBB_FA only
%    needs to be called once to create the factorization.
%
%    See the documentation of R8CBB_FA for details on the matrix storage.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2004
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
%    Input, real A_LU( (ML+MU+1)*N1 + 2*N1*N2 + N2*N2).
%    the compact border banded matrix, as factored by R8CBB_FA.
%
%    Input, real B(N1+N2), the right hand side of the linear system.
%
%    Output, real X(N1+N2), the solution.
%
  nband = (ml+mu+1)*n1;
%
%  Set B1 := inverse(A1) * B1.
%
  if ( 0 < n1 )

    a1_lu(1:ml+mu+1,1:n1) = r8vec_to_r8cb ( n1, n1, ml, mu, a_lu(1:nband) );

    job = 0;

    x(1:n1) = r8cb_np_sl ( n1, ml, mu, a1_lu, b(1:n1), job );

  end
%
%  Modify the right hand side of the second linear subsystem.
%  Replace B2 by B2-A3*B1.
%
  for j = 1 : n1
    for i = 1 : n2
      ij = nband + n1*n2 + (j-1)*n2 + i;
      b(n1+i) = b(n1+i) - a_lu(ij) * x(j);
    end
  end
%
%  Solve A4*B2 = B2.
%
  if ( 0 < n2 )

    a4_lu(1:n2,1:n2) = r8vec_to_r8ge ( ...
      n2, n2, a_lu(nband+2*n1*n2+1:nband+2*n1*n2+n2*n2) );

    job = 0;
    x(n1+1:n1+n2) = r8ge_np_sl ( n2, a4_lu, b(n1+1:n1+n2), job );

  end
%
%  Modify the first subsolution.
%  Set B1 = B1+A2*B2.
%
  for i = 1 : n1
    for j = 1 : n2
      ij = nband + (j-1)*n1 + i;
      x(i) = x(i) + a_lu(ij) * x(n1+j);
    end
  end

  return
end
