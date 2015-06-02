function a = parlett ( )

%*****************************************************************************80
%
%% PARLETT returns the PARLETT matrix.
%
%  Formula:
%
%    N = 100
%
%    if ( I < J )
%      if ( I = 1 and J = 2 )
%        A(I,J) = 40 / 102
%      elseif ( I = 1 and J = 100 )
%        A(I,J) = 40
%      else
%        A(I,J) = 0
%    elseif ( I = J )
%      A(I,J) = 101 - I
%    elseif ( J < I )
%      A(I,J) = (-1)^(I+J+1) * 40 / ( I + J - 2 )
%
%  Example:
%
%    100.00    0.39    0       0       0     ...   40.00
%     40.00   99.00    0       0       0     ...    0
%    -20.00   13.33   98.00    0       0     ...    0
%     13.33  -10.00    8.00   97.00    0     ...    0
%    -10.00    8.00   -6.67    5.71   96.00  ...    0
%     ...     ...     ...     ...     ...    ...   ...
%      0.40   -0.40    0.39   -0.39    0.38  ...    1.00
%
%  Properties:
%
%    A is not symmetric: A' ~= A.
%
%    The eigenvalues of A are
%
%      LAMBDA(I) = I.
%
%    det ( A ) = 100!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 5.19,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 99, 
%    LC: QA263.G68.
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Output, real A(100,100), the matrix.
%
  n = 100;
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i < j )
        if ( i == 1 & j == 2 )
          a(i,j) = 40.0 / 102.0;
        elseif ( i == 1 & j == 100 )
          a(i,j) = 40.0;
        else
          a(i,j) = 0.0;
        end
      elseif ( i == j )
        a(i,j) = 101.0 - i;
      elseif ( j < i )
        a(i,j) = ( - 1.0 )^(i+j+1) * 40.0 / ( i + j - 2 );
      end

    end
  end

  return
end
