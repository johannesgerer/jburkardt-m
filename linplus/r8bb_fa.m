function [ a_lu, pivot, info ] = r8bb_fa ( n1, n2, ml, mu, a )

%*****************************************************************************80
%
%% R8BB_FA factors a R8BB matrix.
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
%    Once the matrix has been factored by R8BB_FA, R8BB_SL may be called
%    to solve linear systems involving the matrix.
%
%    R8BB_FA uses LINPACK routines to carry out the factorization.
%
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
%         X1 + inv(A1) A2 X2 = inv(A1) B1
%
%      A3 X1 +         A4 X2 = B2
%
%    and then rewrites the second equation as
%
%      ( A4 - A3 inv(A1) A2 ) X2 = B2 - A3 inv(A1) B1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 March 2004
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
%    Input, real A( (2*ML+MU+1)*N1 + 2*N1*N2 + N2*N2 ), the border-banded 
%    matrix to be factored.
%
%    Output, real A_LU( (2*ML+MU+1)*N1 + 2*N1*N2 + N2*N2 ).
%    Information describing a partial factorization
%    of the original coefficient matrix.  This information is required
%    by R8BB_SL in order to solve linear systems associated with that
%    matrix.
%
%    Output, integer PIVOT(N1+N2), contains pivoting information.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  nband = (2*ml+mu+1) * n1;

  a_lu(1:nband+2*n1*n2+n2*n2) = a(1:nband+2*n1*n2+n2*n2);
%
%  Factor the A1 band matrix, overwriting A1 by its factors.
%
  if ( 0 < n1 )

    a1(1:2*ml+mu+1,1:n1) = r8vec_to_r8gb ( n1, n1, ml, mu, a(1:nband) );

    [ a1_lu(1:2*ml+mu+1,1:n1), pivot(1:n1), info ] = r8gb_fa ( n1, ml, mu, a1 );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8BB_FA - Fatal error!\n' );
      fprintf ( 1, '  R8GB_FA returned INFO = %d\n', info );
      fprintf ( 1, '  Factoring failed for column INFO.\n' );
      fprintf ( 1, '  The band matrix A1 is singular.\n' );
      fprintf ( 1, '  This algorithm cannot continue!\n' );
      error ( 'R8BB_FA - Fatal error!' );
      return;
    end

    a_lu(1:nband) = r8gb_to_r8vec ( n1, n1, ml, mu, a1_lu );

  end

  if ( 0 < n1 & 0 < n2 )
%
%  Solve A1 * x = -A2 for x, and overwrite A2 by the results.
%
    job = 0;

    for j = 1 : n2
      b2(1:n1) = -a(nband+(j-1)*n1+1:nband+(j-1)*n1+n1);
      x2(1:n1) = r8gb_sl ( n1, ml, mu, a1_lu, pivot(1:n1), b2, job );
      a_lu(nband+(j-1)*n1+1:nband+(j-1)*n1+n1) = x2(1:n1);
    end
%
%  A4 := A4 + A3 * A2.
%
    for i = 1 : n2
      for j = 1 : n1
        ij = nband + n1*n2 + (j-1)*n2 + i;
        for k = 1 : n2
          ik = nband + 2*n1*n2 + (k-1)*n2 + i;
          jk = nband + (k-1) * n1 + j;
          temp = a_lu(ik);
          a_lu(ik) = a_lu(ik) + a_lu(ij) * a_lu(jk);
        end
      end
    end

  end
%
%  Factor A4.
%
  if ( 0 < n2 )

    a4(1:n2,1:n2) = r8vec_to_r8ge ( ...
      n2, n2, a_lu(nband+2*n1*n2+1:nband+2*n1*n2+n2*n2) );

    [ a4_lu, pivot(n1+1:n1+n2), info ] = r8ge_fa ( n2, a4 );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8BB_FA - Fatal error!\n' );
      fprintf ( 1, '  R8GE_FA returned INFO = %d\n',info );
      fprintf ( 1, '  This indicates singularity in column INFO.\n' );
      fprintf ( 1, '  of the A4 submatrix, which is column %d\n', n1+info );
      fprintf ( 1, '  of the full matrix.\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  It is possible that the full matrix is\n' );
      fprintf ( 1, '  nonsingular, but the algorithm R8BB_FA may\n' );
      fprintf ( 1, '  not be used for this matrix.\n' );
      error ( 'R8BB_FA - Fatal error!' );
      return;
    end

    a_lu(nband+2*n1*n2+1:nband+2*n1*n2+n2*n2) = r8ge_to_r8vec ( n2, n2, a4_lu );

  end

  return
end
