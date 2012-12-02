function a = poisson ( nrow, ncol, n )

%*****************************************************************************80
%
%% POISSON returns the POISSON matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = 4.0
%    elseif ( I = J+1 or I = J-1 or I = J+NROW or I = J-NROW )
%      A(I,J) = -1.0
%    else
%      A(I,J) = 0.0
%
%  Example:
%
%    NROW = NCOL = 3
%
%     4 -1  0 | -1  0  0 |  0  0  0
%    -1  4 -1 |  0 -1  0 |  0  0  0
%     0 -1  4 |  0  0 -1 |  0  0  0
%     ----------------------------
%    -1  0  0 |  4 -1  0 | -1  0  0
%     0 -1  0 | -1  4 -1 |  0 -1  0
%     0  0 -1 |  0 -1  4 |  0  0 -1
%     ----------------------------
%     0  0  0 | -1  0  0 |  4 -1  0
%     0  0  0 |  0 -1  0 | -1  4 -1
%     0  0  0 |  0  0 -1 |  0 -1  4
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A results from discretizing Poisson's equation with the
%    5 point operator on a square mesh of N points.
%
%    A has eigenvalues
%
%      LAMBDA(I,J) = 4 - 2 * COS(I*PI/(N+1))
%                      - 2 * COS(J*PI/(M+1)), I = 1 to N, J = 1 to M.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
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
%    Input, integer N, the order of the matrix.  It must be the case
%    that N = NROW * NCOL.
%
%    Output, real A(NROW*NCOL,NROW*NCOL), the matrix.
%
  a(1:n,1:n) = 0.0;

  i = 0;

  for i1 = 1 : nrow
    for j1 = 1 : ncol

      i = i + 1;

      if ( 1 < i1 )
        j = i - ncol;
        a(i,j) = -1.0;
      end

      if ( 1 < j1 )
        j = i - 1;
        a(i,j) = -1.0;
      end

      j = i;
      a(i,j) = 4.0;

      if ( j1 < ncol )
        j = i + 1;
        a(i,j) = -1.0;
      end

      if ( i1 < nrow )
        j = i + ncol;
        a(i,j) = -1.0;
      end

    end
  end

  return
end
