function a = companion_inverse ( n, x )

%*****************************************************************************80
%
%% COMPANION_INVERSE returns the inverse of the COMPANION matrix.
%
%  Example:
%
%    N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    0    1    0    0    0
%    0    0    1    0    0
%    0    0    0    1    0
%    0    0    0    0    1
%   1/1 -5/1 -4/1 -3/1 -2/1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Matrix Computations, second edition,
%    Johns Hopkins University Press, Baltimore, Maryland, 1989,
%    section 7.4.6.
%
%    Charles Kenney, Alan Laub,
%    Controllability and stability radii for companion form systems,
%    Math. Control Signals Systems,
%    Volume 1, 1988, pages 239-256.
%
%    James Wilkinson,
%    The Algebraic Eigenvalue Problem,
%    Oxford University Press,
%    1965, page 12.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N), the coefficients of the polynomial
%    which define the matrix.  X(1) must not be zero.
%
%    Output, real A(N,N), the matrix.
%
  for j = 1 : n
    for i = 1 : n

      if ( i == n )

        if ( j == 1 )
          a(i,j) = 1.0 / x(1);
        else
          a(i,j) = - x(n+2-j) / x(1);
        end

      elseif ( i == j - 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
