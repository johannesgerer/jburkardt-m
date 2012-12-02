function v = lf_function ( m, n, alpha, x )

%*****************************************************************************80
%
%% LF_FUNCTION evaluates the Laguerre function Lf(n,alpha,x).
%
%  Recursion:
%
%    Lf(0,ALPHA,X) = 1
%    Lf(1,ALPHA,X) = 1+ALPHA-X
%
%    Lf(N,ALPHA,X) = (2*N-1+ALPHA-X)/N * Lf(N-1,ALPHA,X) 
%                      - (N-1+ALPHA)/N * Lf(N-2,ALPHA,X)
%
%  Restrictions:
%
%    -1 < ALPHA
%
%  Special values:
%
%    Lf(N,0,X) = L(N,X).
%    Lf(N,M,X) = LM(N,M,X) for M integral.
%
%  Norm:
%
%    Integral ( 0 <= X < +oo ) exp ( - X ) * Lf(N,ALPHA,X)^2 dX
%    = Gamma ( N + ALPHA + 1 ) / N!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 March 2012
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
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order function to compute.
%
%    Input, real ALPHA, the parameter.  -1 < ALPHA is required.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real V(M,N+1), the functions of 
%    degrees 0 through N at the evaluation points.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LF_FUNCTION - Fatal error!\n' );
    fprintf ( 1, '  The input value of ALPHA is %g\n', alpha );
    fprintf ( 1, '  but ALPHA must be greater than -1.\n' );
    error ( 'LF_FUNCTION - Fatal error!' );
  end
 
  if ( n < 0 )
    v = [];
    return
  end

  v = zeros ( m, n + 1 );

  v(1:m,1) = 1.0;

  if ( n == 0 )
    return
  end

  v(1:m,2) = 1.0 + alpha - x(1:m,1);

  for i = 2 : n
    v(1:m,i+1) = ( ( 2 * i - 1 + alpha - x(1:m,1) ) .* v(1:m,i)     ...
                +  (   - i + 1 - alpha            )  * v(1:m,i-1) ) ...
                  /      i;
  end

  return
end
