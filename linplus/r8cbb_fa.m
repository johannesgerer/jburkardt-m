function [ a_lu, info ] = r8cbb_fa ( n1, n2, ml, mu, a )

%*****************************************************************************80
%
%% R8CBB_FA factors a R8CBB matrix.
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
%
%    Once the matrix has been factored by R8CBB_FA, R8CBB_SL may be called
%    to solve linear systems involving the matrix.
%
%    R8CBB_FA uses special non-pivoting versions of LINPACK routines to
%    carry out the factorization.  The special version of the banded
%    LINPACK solver also results in a space saving, since no entries
%    need be set aside for fill in due to pivoting.
%
%    The linear system must be border banded, of the form:
%
%      ( A1 A2 ) (X1) = (B1)
%      ( A3 A4 ) (X2)   (B2)
%
%    where A1 is a (usually big) banded square matrix, A2 and A3 are
%    column and row strips which may be nonzero, and A4 is a dense
%    square matrix.
%
%    The algorithm rewrites the system as:
%
%         X1 + inverse(A1) A2 X2 = inverse(A1) B1
%
%      A3 X1 +             A4 X2 = B2
%
%    and then rewrites the second equation as
%
%      ( A4 - A3 inverse(A1) A2 ) X2 = B2 - A3 inverse(A1) B1
%
%    The algorithm will certainly fail if the matrix A1 is singular,
%    or requires pivoting.  The algorithm will also fail if the A4 matrix,
%    as modified during the process, is singular, or requires pivoting.
%    All these possibilities are in addition to the failure that will
%    if the total matrix A is singular.
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
%    Input, real A( (ML+MU+1)*N1 + 2*N1*N2 + N2*N2), the compact 
%    border-banded coefficient matrix.
%
%    Output, real A_LU( (ML+MU+1)*N1 + 2*N1*N2 + N2*N2).
%    information describing a partial factorization
%    of the original coefficient matrix.  
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  nband = (ml+mu+1)*n1;

  a_lu(1:nband+2*n1*n2+n2*n2) = a(1:nband+2*n1*n2+n2*n2);
%
%  Factor the A1 band matrix, overwriting A1 by its factors.
%
  if ( 0 < n1 )

    a1(1:ml+mu+1,1:n1) = r8vec_to_r8cb ( n1, n1, ml, mu, a(1:nband) );

    [ a1_lu, info ] = r8cb_np_fa ( n1, ml, mu, a1 );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8CBB_FA - Fatal error!\n' );
      fprintf ( 1, '  R8CB_NP_FA returned INFO = %d\n', info );
      fprintf ( 1, '  Factoring failed for column INFO.\n' );
      fprintf ( 1, '  The band matrix A1 is singular.\n' );
      fprintf ( 1, '  This algorithm cannot continue!\n' );
      error ( 'R8CBB_FA - Fatal error!' );
    end

    a_lu(1:nband) = r8cb_to_r8vec ( n1, n1, ml, mu, a1_lu );

  end

  if ( 0 < n1 & 0 < n2 )
%
%  Set A2 := -inverse(A1) * A2.
%
    job = 0;

    for j = 1 : n2
      b2(1:n1) = -a(nband+(j-1)*n1+1:nband+(j-1)*n1+n1);
      x2 = r8cb_np_sl ( n1, ml, mu, a1_lu, b2, job );
      a_lu(nband+(j-1)*n1+1:nband+(j-1)*n1+n1) = x2(1:n1);
    end
%
%  Set A4 := A4 + A3*A2
%
    for i = 1 : n2
      for j = 1 : n1
        ij = nband + n1*n2 + (j-1)*n2 + i;
        for k = 1 : n2
          ik = nband + 2*n1*n2 + (k-1)*n2 + i;
          jk = nband + (k-1)*n1 + j;
          a_lu(ik) = a_lu(ik) + a_lu(ij) * a_lu(jk);
        end
      end
    end

  end
%
%  Factor A4.
%
  if ( 0 < n2 )

    a4 = r8vec_to_r8ge ( n2, n2, a_lu(nband+2*n1*n2+1:nband+2*n1*n2+n2*n2) );

    [ a4_lu, info ] = r8ge_np_fa ( n2, a4 );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8CBB_FA - Fatal error!\n' );
      fprintf ( 1, '  R8GE_NP_FA returned INFO = %d\n',info );
      fprintf ( 1, '  This indicates singularity in column INFO\n' );
      info = n1 + info;
      fprintf ( 1, '  of the A4 submatrix, which is column %d\n', info );
      fprintf ( 1, '  of the full matrix.\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  It is possible that the full matrix is \n' );
      fprintf ( 1, '  nonsingular, but the algorithm R8CBB_FA may\n' );
      fprintf ( 1, '  not be used for this matrix.\n' );
      return
    end

    a_lu(nband+2*n1*n2+1:nband+2*n1*n2+n2*n2) = r8ge_to_r8vec ( n2, n2, a4_lu );

  end

  return
end
