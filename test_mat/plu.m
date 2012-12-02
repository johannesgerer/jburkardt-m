function [ p, l, u, a ] = plu ( n, pivot )

%*****************************************************************************80
%
%% PLU returns a matrix with known P, L and U Gauss factors.
%
%  Example:
%
%    Input:
%
%      N = 5
%      PIVOT = ( 1, 3, 3, 5, 5 )
%
%    Output:
%
%      A:
%
%         11            12           13            14           15
%          1.375         9.75        43.25         44.75        46.25
%          2.75         25           26.25         27.5         28.75
%          0.34375       2.4375       7.71875      17.625       73.125
%          0.6875        4.875       15.4375       60           61.5625
%
%      P:
%
%          1             0            0             0            0
%          0             0            1             0            0
%          0             1            0             0            0
%          0             0            0             0            1
%          0             0            0             1            0
%
%      L:
%
%         1              0            0             0            0
%         0.25           1            0             0            0
%         0.125          0.375        1             0            0
%         0.0625         0.1875       0.3125        1            0
%         0.03125        0.09375      0.15625       0.21875      1
%
%      U:
%
%        11             12           13            14           15
%         0             22           23            24           25
%         0              0           33            34           35
%         0              0            0            44           45
%         0              0            0             0           55
%
%  Note:
%
%    The LINPACK routine DGEFA will factor the above A as:
%
%       11             12             13             14             15
%      -0.125          22             23             24             25
%      -0.25           -0.375         33             34             35
%      -0.03125        -0.09375       -0.15625       44             45
%      -0.0625         -0.1875        -0.3125        -0.21875       55
%
%    and the pivot information in the vector IPVT as:
%
%      ( 1, 3, 3, 5, 5 ).
%
%    The LAPACK routine DGETRF will factor the above A as:
%
%      11              12             13             14             15
%      0.25            22             23             24             25
%      0.125            0.375         33             34             35
%      0.0625           0.1875         0.3125        44             45
%      0.03125          0.09375        0.15625        0.21875       55
%
%   and the pivot information in the vector IPIV as:
%
%     ( 1, 3, 3, 5, 5 ).
%
%  Method:
%
%    The L factor will have unit diagonal, and subdiagonal entries
%    L(I,J) = ( 2 * J - 1 ) / 2**I, which should result in a unique
%    value for every entry.
%
%    The U factor of A will have entries
%    U(I,J) = 10 * I + J, which should result in "nice" entries as long
%    as N < 10.
%
%    The P factor can be deduced by applying the pivoting operations
%    specified by PIVOT in reverse order to the rows of the identity.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer PIVOT(N), the list of pivot rows.  PIVOT(I)
%    must be a value between I and N, reflecting the choice of
%    pivot row on the I-th step.  For no pivoting, set PIVOT(I) = I.
%
%    Output, real P(N,N), L(N,N), U(N,N), the P, L and U factors
%    of A, as defined by Gaussian elimination with partial pivoting.
%    P is a permutation matrix, L is unit lower triangular, and U
%    is upper trianguler.
%
%    Output, real A(N,N), the matrix.
%

%
%  Check that the pivot vector is legal.
%
  for i = 1 : n

    if ( pivot(i) < i )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PLU - Fatal error!\n' );
      fprintf ( 1, '  PIVOT(%d) = %d\n', i, pivot(i) );
      fprintf ( 1, '  but PIVOT(I) must be no less than I!\n' );
      stop
    elseif ( n < pivot(i) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PLU - Fatal error!\n' );
      fprintf ( 1, '  PIVOT(%d) = %d\n', i, pivot(i) );
      fprintf ( 1, '  but PIVOT(I) must be no greater than N\n' );
      fprintf ( 1, '  and N = %d\n', n );
      stop
    end

  end
%
%  Compute U.
%
  for i = 1 : n
    for j = 1 : n

      if ( i <= j )
        u(i,j) = 10 * i + j;
      else
        u(i,j) = 0.0;
      end

    end
  end
%
%  Compute L.
%
  for i = 1 : n
    for j = 1 : n

      if ( i < j )
        l(i,j) = 0.0;
      elseif ( j == i )
        l(i,j) = 1.0;
      else
        l(i,j) = ( 2 * j - 1 ) / 2^i;
      end

    end
  end
%
%  Compute P.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        p(i,j) = 1.0;
      else
        p(i,j) = 0.0;
      end
    end
  end
%
%  Apply the pivot permutations, in reverse order.
%
  for i = n : -1 : 1

    if ( pivot(i) ~= i )
      for j = 1 : n
        temp          = p(i,j);
        p(i,j)        = p(pivot(i),j);
        p(pivot(i),j) = temp;
      end
    end

  end
%
%  Compute L * U.
%
  for i = 1 : n
    for j = 1 : n
      a(i,j) = u(i,j);
      for k = 1 : i - 1
        a(i,j) = a(i,j) + l(i,k) * u(k,j);
      end
    end
  end
%
%  Compute P * ( L * U )
%
  for i = n : -1 : 1

    if ( pivot(i) ~= i )
      for j = 1 : n
        temp          = a(i,j);
        a(i,j)        = a(pivot(i),j);
        a(pivot(i),j) = temp;
      end
    end

  end

  return
end
