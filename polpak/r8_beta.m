function value = r8_beta ( x, y )

%*****************************************************************************80
%
%% R8_BETA returns the value of the Beta function.
%
%  Discussion:
%
%    The formula is
%
%      BETA(X,Y) = ( GAMMA(X) * GAMMA(Y) ) / GAMMA(X+Y)
%
%    Both X and Y must be greater than 0.
%
%  Properties:
%
%    BETA(X,Y) = BETA(Y,X).
%    BETA(X,Y) = Integral ( 0 <= T <= 1 ) T^(X-1) (1-T)^(Y-1) dT.
%    BETA(X,Y) = GAMMA(X) * GAMMA(Y) / GAMMA(X+Y)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the two parameters that define the Beta function.
%    X and Y must be greater than 0.
%
%    Output, real VALUE, the value of the Beta function.
%
  if ( x <= 0.0 || y <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BETA - Fatal error!\n' );
    fprintf ( 1, '  Both X and Y must be greater than 0.\n' );
    error ( 'R8_BETA - Fatal error!' );
  end

  value = exp ( gammaln ( x ) + gammaln ( y ) - gammaln ( x + y ) );

  return
end
