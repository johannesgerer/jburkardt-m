function value = atanh2 ( x )

%*****************************************************************************80
%
%% ATANH2 returns the inverse hyperbolic tangent of a number.
%
%  Definition:
%
%    Y = ATANH2(X) implies that
%    X = TANH(Y) = ( EXP(Y) - EXP(-Y) ) / ( EXP(Y) + EXP(-Y) )
%
%  Discussion:
%
%    Since a library function ATANH may be available on some systems,
%    this routine is named ATANH2 to avoid name conflicts.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose inverse hyperbolic tangent is desired.
%    The absolute value of X should be less than or equal to 1.
%
%    Output, real VALUE, the inverse hyperbolic tangent of X.
%
  if ( 1.0 <= abs ( x ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ATANH2 - Fatal error!\n' );
    fprintf ( 1, '  ABS(X) must be < 1.\n' );
    fprintf ( 1, '  Your input is X = %f\n', x );
    error ( 'ATANH2 - Fatal error!' );
  end

  value = 0.5 * log ( ( 1.0 + x ) / ( 1.0 - x ) );

  return
end
