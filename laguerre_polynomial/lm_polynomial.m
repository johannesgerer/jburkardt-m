function v = lm_polynomial ( mm, n, m, x )

%*****************************************************************************80
%
%% LM_POLYNOMIAL evaluates Laguerre polynomials Lm(n,m,x).
%
%  First terms:
%
%    M = 0
%
%    Lm(0,0,X) =   1
%    Lm(1,0,X) =  -X   +  1
%    Lm(2,0,X) =   X^2 -  4 X   +  2
%    Lm(3,0,X) =  -X^3 +  9 X^2 -  18 X   +    6
%    Lm(4,0,X) =   X^4 - 16 X^3 +  72 X^2 -   96 X +     24
%    Lm(5,0,X) =  -X^5 + 25 X^4 - 200 X^3 +  600 X^2 -  600 x   +  120
%    Lm(6,0,X) =   X^6 - 36 X^5 + 450 X^4 - 2400 X^3 + 5400 X^2 - 4320 X + 720
%
%    M = 1
%
%    Lm(0,1,X) =    0
%    Lm(1,1,X) =   -1,
%    Lm(2,1,X) =    2 X - 4,
%    Lm(3,1,X) =   -3 X^2 + 18 X - 18,
%    Lm(4,1,X) =    4 X^3 - 48 X^2 + 144 X - 96
%
%    M = 2
%
%    Lm(0,2,X) =    0
%    Lm(1,2,X) =    0,
%    Lm(2,2,X) =    2,
%    Lm(3,2,X) =   -6 X + 18,
%    Lm(4,2,X) =   12 X^2 - 96 X + 144
%
%    M = 3
%
%    Lm(0,3,X) =    0
%    Lm(1,3,X) =    0,
%    Lm(2,3,X) =    0,
%    Lm(3,3,X) =   -6,
%    Lm(4,3,X) =   24 X - 96
%
%    M = 4
%
%    Lm(0,4,X) =    0
%    Lm(1,4,X) =    0
%    Lm(2,4,X) =    0
%    Lm(3,4,X) =    0
%    Lm(4,4,X) =   24
%
%  Recursion:
%
%    Lm(0,M,X)   = 1 
%    Lm(1,M,X)   = (M+1-X)
%
%    if 2 <= N:
%
%      Lm(N,M,X)   = ( (M+2*N-1-X) * Lm(N-1,M,X) 
%                   +   (1-M-N)    * Lm(N-2,M,X) ) / N
%
%  Special values:
%
%    For M = 0, the associated Laguerre polynomials Lm(N,M,X) are equal 
%    to the Laguerre polynomials L(N,X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%  Parameters:
%
%    Input, integer MM, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to compute.
%    Note that polynomials 0 through N will be computed.
%
%    Input, integer M, the parameter.  M must be nonnegative.
%
%    Input, real X(MM), the evaluation points.
%
%    Output, real V(MM,N+1), the associated Laguerre polynomials 
%    of degrees 0 through N evaluated at the evaluation points.
%
  if ( m < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LM_POLYNOMIAL - Fatal error!\n' );
    fprintf ( 1, '  Input value of M = %d\n', m );
    fprintf ( 1, '  but M must be nonnegative.\n' );
    error ( 'LM_POLYNOMIAL - Fatal error!' );
  end

  if ( n < 0 )
    v = [];
    return
  end

  v = zeros ( mm, n + 1 );

  v(1:mm,1) = 1.0;

  if ( n == 0 )
    return
  end

  v(1:mm,2) = m + 1 - x(1:mm);

  for i = 2 : n
    v(1:mm,i+1) = ...
      ( ( (   m + 2 * i - 1 ) - x(1:mm) ) .* v(1:mm,i)     ...
        + ( - m     - i + 1 )              * v(1:mm,i-1) ) ...
        /             i;
  end

  return
end
