function a = neumann ( nrow, ncol )

%*****************************************************************************80
%
%% NEUMANN returns the NEUMANN matrix.
%
%  Formula:
%
%    I1 = 1 + ( I - 1 ) / NROW
%    I2 = I - ( I1 - 1 ) * NROW
%    J1 = 1 + ( J - 1 ) / NROW
%
%    if ( I = J )
%      A(I,J) = 4
%    elseif ( I = J-1 )
%      If ( I2 = 1 )
%        A(I,J) = -2
%      else
%        A(I,J) = -1
%    elseif ( I = J+1 )
%      If ( I2 = NROW )
%        A(I,J) = -2
%      else
%        A(I,J) = -1
%    elseif ( I = J - NROW )
%      if ( J1 = 2 )
%        A(I,J) = -2
%      else
%        A(I,J) = -1
%    elseif ( I = J + NROW )
%      if ( J1 = NCOL-1 )
%        A(I,J) = -2
%      else
%        A(I,J) = -1
%    else
%      A(I,J) = 0.0
%
%  Example:
%
%    NROW = NCOL = 3
%
%     4 -2  0 | -2  0  0 |  0  0  0
%    -1  4 -1 |  0 -2  0 |  0  0  0
%     0 -2  4 |  0  0 -2 |  0  0  0
%     ----------------------------
%    -1  0  0 |  4 -1  0 | -1  0  0
%     0 -1  0 | -1  4 -1 |  0 -1  0
%     0  0 -1 |  0 -1  4 |  0  0 -1
%     ----------------------------
%     0  0  0 | -2  0  0 |  4 -2  0
%     0  0  0 |  0 -2  0 | -1  4 -1
%     0  0  0 |  0  0 -2 |  0 -2  4
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is block tridiagonal.
%
%    A results from discretizing Neumann's equation with the
%    5 point operator on a mesh of NROW by NCOL points.
%
%    A is singular.
%
%    A has the null vector ( 1, 1, ..., 1 ).
%
%    det ( A ) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Matrix Computations, second edition,
%    Johns Hopkins University Press, Baltimore, Maryland, 1989
%    (Section 4.5.4).
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the number of rows and columns
%    in the grid.
%
%    Output, integer N, the order of the matrix, which 
%    is NROW*NCOL.
%
%    Output, real A(NROW*NCOL,NROW*NCOL), the NROW*NCOL 
%    by NROW*NCOL matrix.
%
  n = nrow * ncol;
  a = zeros ( n, n );

  i = 0;

  for i1 = 1 : nrow
    for j1 = 1 : ncol

      i = i + 1;

      if ( 1 < i1 )
        j = i - nrow;
      else
        j = i + nrow;
      end

      a(i,j) = a(i,j) - 1.0;

      if ( 1 < j1 )
        j = i - 1;
      else
        j = i + 1;
      end

      a(i,j) = a(i,j) - 1.0;

      j = i;
      a(i,j) = 4.0;

      if ( j1 < ncol )
        j = i + 1;
      else
        j = i - 1;
      end

      a(i,j) = a(i,j) - 1.0;

      if ( i1 < nrow )
        j = i + nrow;
      else
        j = i - nrow;
      end

      a(i,j) = a(i,j) - 1.0;

    end
  end

  return
end
