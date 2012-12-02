function bern = bpab ( n, a, b, x )

%*****************************************************************************80
%
%% BPAB evaluates the Bernstein basis polynomials for [A,B] at a point.
%
%  Formula:
%
%    BERN(N,I,X) = [N!/(I!*(N-I)!)] * (B-X)**(N-I) * (X-A)**I / (B-A)**N
%
%  First values:
%
%    B(0,0,X) =   1
%
%    B(1,0,X) = (      B-X                ) / (B-A)
%    B(1,1,X) = (                 X-A     ) / (B-A)
%
%    B(2,0,X) = (     (B-X)**2            ) / (B-A)**2
%    B(2,1,X) = ( 2 * (B-X)    * (X-A)    ) / (B-A)**2
%    B(2,2,X) = (                (X-A)**2 ) / (B-A)**2
%
%    B(3,0,X) = (     (B-X)**3            ) / (B-A)**3
%    B(3,1,X) = ( 3 * (B-X)**2 * (X-A)    ) / (B-A)**3
%    B(3,2,X) = ( 3 * (B-X)    * (X-A)**2 ) / (B-A)**3
%    B(3,3,X) = (                (X-A)**3 ) / (B-A)**3
%
%    B(4,0,X) = (     (B-X)**4            ) / (B-A)**4
%    B(4,1,X) = ( 4 * (B-X)**3 * (X-A)    ) / (B-A)**4
%    B(4,2,X) = ( 6 * (B-X)**2 * (X-A)**2 ) / (B-A)**4
%    B(4,3,X) = ( 4 * (B-X)    * (X-A)**3 ) / (B-A)**4
%    B(4,4,X) = (                (X-A)**4 ) / (B-A)**4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Kahaner, Moler, and Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989.
%
%  Parameters:
%
%    Input, integer N, the degree of the Bernstein basis polynomials.
%    For any N greater than or equal to 0, there is a set of N+1
%    Bernstein basis polynomials, each of degree N, which form a basis
%    for polynomials on [A,B].
%
%    Input, real A, B, the endpoints of the interval on which the
%    polynomials are to be based.  A and B should not be equal.
%
%    Input, real X, the point at which the polynomials are to be
%    evaluated.  X need not lie in the interval [A,B].
%
%    Output, real BERN(1:N+1), the values of the Bernstein basis
%    polynomials of orders 0 through N at X.
%
  if ( b == a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BPAB - Fatal error!\n' );
    fprintf ( 1, '  A = B = %f\n', a );
    error ( 'BPAB - Fatal error!' );
  end

  bern = zeros ( n + 1, 1 );

  if ( n == 0 )

    bern(1) = 1.0E+00;

  elseif ( 0 < n )

    bern(1) = ( b - x ) / ( b - a );
    bern(2) = ( x - a ) / ( b - a );

    for i = 2 : n
      bern(i+1) = ( x - a ) * bern(i) / ( b - a );
      for j = i-1 : -1 : 1
        bern(j+1) = ( ( b - x ) * bern(j+1) + ( x - a ) * bern(j) ) / ( b - a );
      end
      bern(1) = ( b - x ) * bern(1) / ( b - a );
    end

  end

  return
end

