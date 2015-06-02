function bern = bernstein_poly_01 ( n, x )

%*****************************************************************************80
%
%% BERNSTEIN_POLY_01 evaluates the Bernstein polynomials defined on [0,1].
%
%  Discussion:
%
%    The Bernstein polynomials are assumed to be based on [0,1].
%
%  Formula:
%
%    B(N,I)(X) = [N!/(I!*(N-I)!)] * (1-X)**(N-I) * X**I
%
%  First values:
%
%    B(0,0)(X) = 1
%
%    B(1,0)(X) =      1-X
%    B(1,1)(X) =                X
%
%    B(2,0)(X) =     (1-X)**2
%    B(2,1)(X) = 2 * (1-X)    * X
%    B(2,2)(X) =                X**2
%
%    B(3,0)(X) =     (1-X)**3
%    B(3,1)(X) = 3 * (1-X)**2 * X
%    B(3,2)(X) = 3 * (1-X)    * X**2
%    B(3,3)(X) =                X**3
%
%    B(4,0)(X) =     (1-X)**4
%    B(4,1)(X) = 4 * (1-X)**3 * X
%    B(4,2)(X) = 6 * (1-X)**2 * X**2
%    B(4,3)(X) = 4 * (1-X)    * X**3
%    B(4,4)(X) =                X**4
%
%  Special values:
%
%    B(N,I)(X) has a unique maximum value at X = I/N.
%
%    B(N,I)(X) has an I-fold zero at 0 and and N-I fold zero at 1.
%
%    B(N,I)(1/2) = C(N,K) / 2**N
%
%    For a fixed X and N, the polynomials add up to 1:
%
%      Sum ( 0 <= I <= N ) B(N,I)(X) = 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the degree of the Bernstein polynomials to be
%    used.  For any N, there is a set of N+1 Bernstein polynomials,
%    each of degree N, which form a basis for polynomials on [0,1].
%
%    Input, real X, the evaluation point.
%
%    Output, real BERN(1:N+1), the values of the N+1 Bernstein polynomials at X.
%
  if ( n == 0 )
 
    bern(1) = 1.0;
 
  elseif ( 0 < n )
 
    bern(1) = 1.0 - x;
    bern(2) = x;
 
    for i = 2 : n
      bern(i+1) = x * bern(i);
      for j = i-1 : -1 : 1
        bern(j+1) = x * bern(j) + ( 1.0 - x ) * bern(j+1);
      end
      bern(1) = ( 1.0 - x ) * bern(1);
    end
 
  end
 
  return
end
