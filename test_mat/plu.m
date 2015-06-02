function a = plu ( n, pivot )

%*****************************************************************************80
%
%% PLU returns the PLU matrix.
%
%  Discussion:
%
%    The PLU matrix has known P, L and U Gauss factors.
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
%    L(I,J) = ( 2 * J - 1 ) / 2^I, which should result in a unique
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
%    25 March 2015
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
%    Output, real A(N,N), the matrix.
%
  [ p, l, u ] = plu_plu ( n, pivot );

  a = p * l * u;

  return
end
