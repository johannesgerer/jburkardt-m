function vp = p_polynomial_prime ( m, n, x )

%*****************************************************************************80
%
%% P_POLYNOMIAL_PRIME evaluates the derivative of Legendre polynomials P(n,x).
%
%  Discussion:
%
%    P(0,X) = 1
%    P(1,X) = X
%    P(N,X) = ( (2*N-1)*X*P(N-1,X)-(N-1)*P(N-2,X) ) / N
%
%    P'(0,X) = 0
%    P'(1,X) = 1
%    P'(N,X) = ( (2*N-1)*(P(N-1,X)+X*P'(N-1,X)-(N-1)*P'(N-2,X) ) / N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 March 2012
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
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to evaluate.
%    Note that polynomials 0 through N will be evaluated.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real VP(M,N+1), the values of the derivatives of the
%    Legendre polynomials of order 0 through N at the point X.
%
  if ( n < 0 )
    vp = [];
    return
  end

  v = zeros ( m, n + 1 );
  vp = zeros ( m, n + 1 );

  v(1:m,1) = 1.0;
  vp(1:m,1) = 0.0;

  if ( n < 1 )
    return
  end

  v(1:m,2) = x(1:m,1);
  vp(1:m,2) = 1.0;
 
  for i = 2 : n
 
    v(1:m,i+1) = ( ( 2 * i - 1 ) * x(1:m,1) .* v(1:m,i)     ...
                 - (     i - 1 ) *             v(1:m,i-1) ) ...
                 / (     i     );
 
    vp(1:m,i+1) = ( ( 2 * i - 1 ) * ( v(1:m,i) + x(1:m,1) .* vp(1:m,i) )   ...
                  - (     i - 1 ) *                          vp(1:m,i-1) ) ...
                  / (     i     );
 
  end
 
  return
end
