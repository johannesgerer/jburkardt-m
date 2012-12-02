function [ a_lu, work2, work3, work4, info ] = r83p_fa ( n, a )

%*****************************************************************************80
%
%% R83P_FA factors a R83P matrix.
%
%  Discussion:
%
%    The R83P storage format stores a periodic tridiagonal matrix as 
%    a 3 by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  The matrix value 
%    A(1,N) is stored as the array entry A(3,N), and the matrix value
%    A(N,1) is stored as the array entry A(1,1).
%
%    Once the matrix has been factored by R83P_FA, R83P_SL may be called
%    to solve linear systems involving the matrix.
%
%    The logical matrix has a form which is suggested by this diagram:
%
%      D1 U1          L1
%      L2 D2 U2
%         L3 R83 U3
%            L4 D4 U4
%               L5 D5 U5
%      U6          L6 D6
%
%    The algorithm treats the matrix as a border banded matrix:
%
%      ( A1  A2 )
%      ( A3  A4 )
%
%    where:
%
%      D1 U1          | L1
%      L2 D2 U2       |  0
%         L3 R83 U3    |  0
%            L4 D4 U4 |  0
%               L5 D5 | U5
%      ---------------+---
%      U6  0  0  0 L6 | D6
%
%  Example:
%
%    Here is how a R83P matrix of order 5 would be stored:
%
%      A51 A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54 A15
%
%  Method:
%
%    The algorithm rewrites the system as:
%
%         X1 + inverse(A1) A2 X2 = inverse(A1) B1
%
%      A3 X1 +             A4 X2 = B2
%
%    The first equation can be "solved" for X1 in terms of X2:
%
%         X1 = - inverse(A1) A2 X2 + inverse(A1) B1
%
%    allowing us to rewrite the second equation for X2 explicitly:
%
%      ( A4 - A3 inverse(A1) A2 ) X2 = B2 - A3 inverse(A1) B1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 3.
%
%    Input, real A(3,N), the periodic tridiagonal matrix.  
%    On output, the arrays have been modified to hold information
%    defining the border-banded factorization of submatrices A1
%    and A3.
%
%    Output, real A_LU(3,N), information defining the border-banded factorization 
%    of submatrices A1 and A3.
%
%    Output, real WORK2(N-1), WORK3(N-1), WORK4, factorization information.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%

%
%  Compute inverse(A1):
%
  a_lu = zeros ( 3, n );

  [ a_lu(1:3,1:n-1), info ] = r83_np_fa ( n-1, a );

  a_lu(1,1) = a(1,1);
  a_lu(3,n-1) = a(3,n-1);
  a_lu(1:3,n) = a(1:3,n);
  
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R83P_FA - Fatal error!\n' );
    fprintf ( 1, '  R83_NP_FA returned INFO = %d\n', info );
    fprintf ( 1, '  Factoring failed for column INFO.\n' );
    fprintf ( 1, '  The tridiagonal matrix A1 is singular.\n' );
    fprintf ( 1, '  This algorithm cannot continue!\n' );
    return;
  end
%
%  WORK2 := inverse(A1) * A2.
%
  work2(1) = a(3,n);
  work2(2:n-2) = 0.0E+00;
  work2(n-1) = a(1,n);

  job = 0;
  work2 = r83_np_sl ( n-1, a_lu(1:3,1:n-1), work2, job );
%
%  WORK3 := inverse ( A1' ) * A3'.
%
  work3(1) = a(1,1);
  work3(2:n-2) = 0.0E+00;
  work3(n-1) = a(3,n-1);

  job = 1;
  work3(1:n-1) = r83_np_sl ( n-1, a_lu(1:3,1:n-1), work3, job );
%
%  A4 := ( A4 - A3 * inverse(A1) * A2 )
%
  work4 = a(2,n) - a(1,1) * work2(1) - a(3,n-1) * work2(n-1);

  if ( work4 == 0.0E+00 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R83P_FA - Fatal error!\n' );
    fprintf ( 1, '  The factored A4 submatrix is zero.\n' );
    fprintf ( 1, '  This algorithm cannot continue!\n' );
    return;
  end

  return
end
