function a = sylvester ( n, nx, x, ny, y )

%*****************************************************************************80
%
%% SYLVESTER returns the Sylvester matrix with parameters X and Y.
%
%  Formula:
%
%    For rows 1 through NY,
%
%      A(I,J) = X(NX+I-J)
%
%    For rows NY+1 through NY+NX:
%
%      A(I,J) = Y(I-J)
%
%  Example:
%
%    N = 5,
%    NX = 3, X = ( 1, 2, 3, 4 ),
%    NY = 2, Y = ( 5, 6, 7 )
%
%    4 3 2 1 0
%    0 4 3 2 1
%    7 6 5 0 0
%    0 7 6 5 0
%    0 0 7 6 5
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    Given two polynomials, P1(X) and P2(X) of orders N1 and N2 respectively,
%    if P1 has the the roots X1 through XN1, and leading coefficient
%    A, then the resultant R(P1,P2) is
%
%      R1(P1,P2) = A**N2 * P2(X1) * P2(X2) * ... * P2(XN1).
%
%    The resultant is zero if and only if P1 and P2 have a common root.
%
%
%    The determinant of the Sylvester matrix is the resultant of the
%    polynomials whose coefficient vectors are X and Y.  Thus, the
%    polynomials have a common zero if and only if the resultant is zero.
%    This fact allows the resultant to be calculated without determining
%    the roots of the polynomial.
%
%
%    The coefficient vector C(0:N) represents the polynomial
%
%      C(N) * X**N + C(N-1) * X**(N-1) + ... + C(1) * X + C(0).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jacqueline Burm, Paul Fishback,
%    Period-3 Orbits Via Sylvester's Theorem and Resultants,
%    Mathematics Magazine,
%    Volume 74, Number 1, February 2001, pages 47-51.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer NX, the dimension of X.
%
%    Input, real X(1:NX+1), the first polynomial coefficient vector.
%
%    Input, integer NY, the dimension of Y.
%
%    Input, real Y(1:NY+1), the second polynomial coefficient vector.
%
%    Output, real A(N,N), the matrix.
%
  if ( nx + ny ~= n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SYLVESTER - Fatal error!\n' );
    fprintf ( 1, '  NX + NY = N is required.\n' );
    fprintf ( 1, '  NX = %d\n', nx );
    fprintf ( 1, '  NY = %d\n', ny );
    fprintf ( 1, '  N =  %d\n', n );
    error ( 'SYLVESTER - Fatal error!' );
  end

  a(1:n,1:n) = 0.0;

  for i = 1 : nx + ny

    if ( i <= ny )

      for j = i : i + nx
        a(i,j) = x(nx+i-j+1);
      end

    else

      for j = i - ny : i
        a(i,j) = y(i-j+1);
      end

    end

  end

  return
end
