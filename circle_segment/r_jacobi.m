function ab = r_jacobi ( n, a, b )

%*****************************************************************************80
%
%% R_JACOBI computes recurrence coefficients for monic Jacobi polynomials.
%
%  Discussion:
%
%    This function generates the first N recurrence coefficients for monic 
%    Jacobi polynomials with parameters A and B. 
%
%    These polynomials are orthogonal on [-1,1] relative to the weight
%
%      w(x) = (1.0-x)^A * (1.0+x)^B. 
%
%    The N alpha-coefficients are stored in the first column of AB, 
%    the N beta-coefficients in the second column. 
%
%    The call 
%
%      ab = R_jacobi ( n, a ) 
%
%    is the same as 
%
%      ab = r_jacobi ( n, a, a )
%
%    and the call
%
%      ab = r_jacobi ( n )
%
%    is the same as 
%
%      ab = r_jacobi ( n, 0.0, 0.0 ).
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    Dirk Laurie, Walter Gautschi.
%
%  Reference:
%
%    Walter Gautschi,
%    Orthogonal Polynomials: Computation and Approximation,
%    Oxford, 2004,
%    ISBN: 0-19-850672-4,
%    LC: QA404.5 G3555.
%
%  Parameters:
%
%    Input, integer N, the number of coefficients desired.
%
%    Input, real A, B, the parameters for the Jacobi polynomial.
%    -1.0 < A, -1.0 < B.
%
%    Output, real AB(N), the first N recurrence coefficients.
%
  if ( nargin < 2 )
    a = 0.0; 
  end

  if ( nargin < 3 )
    b = a;
  end

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R_JACOBI - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N.\n' );
    error ( 'R_JACOBI - Fatal error!' )
  end

  if ( a <= -1.0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R_JACOBI - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of A.\n' );
    error ( 'R_JACOBI - Fatal error!' )
  end

  if ( b <= -1.0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R_JACOBI - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of B.\n' );
    error ( 'R_JACOBI - Fatal error!' )
  end

  nu = ( b - a ) / ( a + b + 2 );

  mu = 2.0 ^ ( a + b + 1.0 ) * gamma ( a + 1.0 ) * gamma ( b + 1.0 ) ...
    / gamma ( a + b + 2.0 );

  if ( n == 1 )
    ab = [ nu, mu ]; 
    return
  end 

  nm1 = n - 1; 
  i = 1 : nm1; 
  nab = 2 * i + a + b;
  A1 = ( b^2 - a^2 ) * ones ( 1, nm1 ) ./ ( nab .* ( nab + 2 ) );
  A2 =  [ nu, A1 ];

  i = 2 : nm1;
  nab = nab(i);
  B1 = 4.0 * ( a + 1.0 ) * ( b + 1.0 ) ...
    / ( ( a + b + 2.0 )^2 * ( a + b + 3.0 ) );
  B2 = 4.0 * ( i + a ) .* ( i + b ) .* i .* ( i + a + b ) ...
    ./ ( ( nab.^2 ) .* ( nab + 1 ) .* ( nab - 1 ) );

  ab = [ A2' [ mu; B1; B2' ] ];

  return
end
