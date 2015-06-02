function [ p, l, u ] = plu_plu ( n, pivot )

%*****************************************************************************80
%
%% PLU_PLU returns the PLU factors of the PLU matrix.
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
%    Output, real P(N,N), L(N,N), U(N,N), the P, L and U factors
%    of A, as defined by Gaussian elimination with partial pivoting.
%    P is a permutation matrix, L is unit lower triangular, and U
%    is upper trianguler.
%

%
%  Check that the pivot vector is legal.
%
  for i = 1 : n

    if ( pivot(i) < i )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PLU_PLU - Fatal error!\n' );
      fprintf ( 1, '  PIVOT(%d) = %d\n', i, pivot(i) );
      fprintf ( 1, '  but PIVOT(I) must be no less than I!\n' );
      error ( 'PLU_PLU - Fatal error!' )
    elseif ( n < pivot(i) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PLU_PLU - Fatal error!\n' );
      fprintf ( 1, '  PIVOT(%d) = %d\n', i, pivot(i) );
      fprintf ( 1, '  but PIVOT(I) must be no greater than N\n' );
      fprintf ( 1, '  and N = %d\n', n );
      error ( 'PLU_PLU - Fatal error!' )
    end

  end
%
%  Compute U.
%
  u = zeros ( n, n );
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
  l = zeros ( n, n );
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
  p = zeros ( n, n );
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

  return
end
