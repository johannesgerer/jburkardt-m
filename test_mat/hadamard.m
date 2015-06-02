function a = hadamard ( m, n )

%*****************************************************************************80
%
%% HADAMARD returns a HADAMARD matrix.
%
%  Definition:
%
%    A Hadamard matrix is a square matrix A of order N, whose entries are
%    only +1's or -1's, with the property that:
%
%      A * A' = N * I.
%
%  Notes:
%
%    A Hadamard matrix must be of order 1, 2, or else a multiple of 4.
%    It is not known whether a Hadamard matrix exists for every multiple
%    of 4.
%
%    The method used here allows the user to request a Hadamard matrix
%    of any rectangular order, M by N.  The algorithm then essentially
%    finds the largest powers of 2 that are less than or equal to M and
%    N, and produces a Hadamard-like matrix in that space, setting the
%    rest of the matrix to 0.  Thus, the matrix returned by this routine
%    is only a Hadamard matrix if M = N = a power of 2.
%
%  Formula:
%
%    The following recursive formula is used to produce a series of
%    Hadamard matrices of increasing size.
%
%    H(0) = [1]
%
%    H(1) = [ H(0)  H(0) ] = [ 1  1]
%           [ H(0) -H(0) ]   [ 1 -1]
%
%    H(2) = [ H(1)  H(1) ] = [ 1  1  1  1]
%           [ H(1) -H(1) ]   [ 1 -1  1 -1]
%                            [ 1  1 -1 -1]
%                            [ 1 -1 -1  1]
%
%    and so on.
%
%  Properties:
%
%    All entries of a Hadamard matrix are either +1 or -1.  Matrices
%    produced by this routine will be +1 or -1 up to a certain row
%    and column, beyond which the entries will be zero.
%
%    The Hadamard matrices produced by this routine have the property
%    that the first row and column are entirely 1's, although this
%    is not a requirement for a Hadamard matrix.
%
%    The matrices produced by this algorithm are (loosely) symmetric,
%    although that is not required for a Hadamard matrix.
%
%    Hadamard matrices exhibit the maximum possible relative growth of pivot
%    elements during Gaussian elimination with complete pivoting.
%
%    The inverse of a Hadamard matrix of order N is A itself,
%    scaled by 1.0/N.  Thus 1.0/sqrt(N) times a Hadamard matrix
%    yields a symmetric matrix which is its own inverse, or
%    "involutional".
%
%    A is integral: int ( A ) = A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory and David Karney,
%    Example 3.14,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 42, 
%    LC: QA263.G68.
%
%    William Pratt,
%    Digital Image Processing,
%    John Wiley and Sons, 1978.
%
%    Herbert Ryser,
%    Combinatorial Mathematics,
%    John Wiley and Sons, 1963.
%
%  Parameters:
%
%    Input, integer M, the row order of A.
%
%    Input, integer N, the column order of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HADAMARD - Fatal error!\n' );
    fprintf ( 1, '  Input value of M = %d\n', m );
    fprintf ( 1, '  but M must be positive.\n' );
    error ( 'HADAMARD - Fatal error!' );
  end

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HADAMARD - Fatal error!\n' );
    fprintf ( 1, '  Input value of N = %d\n', n );
    fprintf ( 1, '  but N must be positive.\n' );
    error ( 'HADAMARD - Fatal error!' );
  end

  a(1,1) = 1.0;

  nn = 1;

  while ( nn < n | nn < m )

    for i = 1 : nn
      for j = 1 : nn

        if ( i <= m & j+nn <= n )
          if ( 2 * nn <= n )
            a(i,j+nn) = a(i,j);
          else
            a(i,j+nn) = 0.0;
          end
        end

        if ( i + nn <= m & j <= n )
          if ( 2 * nn <= m )
            a(i+nn,j) = a(i,j);
          else
            a(i+nn,j) = 0.0;
          end
        end

        if ( i + nn <= m & j + nn <= n )
          if ( 2 * nn <= m & 2 * nn <= n )
            a(i+nn,j+nn) = - a(i,j);
          else
            a(i+nn,j+nn) = 0.0;
          end
        end

      end
    end

    nn = 2 * nn;

  end

  return
end
