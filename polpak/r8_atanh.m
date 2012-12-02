function value = r8_atanh ( x )

%*****************************************************************************80
%
%% R8_ATANH returns the inverse hyperbolic tangent of a number.
%
%  Discussion:
%
%    Y = R8_ATANH ( X )
%
%    implies that
%
%    X = TANH(Y) = ( EXP(Y) - EXP(-Y) ) / ( EXP(Y) + EXP(-Y) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose inverse hyperbolic
%    tangent is desired.  The absolute value of X should be less than
%    or equal to 1.
%
%    Output, real R8_ATANH, the inverse hyperbolic tangent of X.
%
  if ( 1.0 <= abs ( x ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_ATANH - Fatal error!\n' );
    fprintf ( 1, '  ABS(X) must be < 1.\n' );
    fprintf ( 1, '  Your input is X = %f\n', x );
    error ( 'R8_ATANH - Fatal error!' );
  end

  value = 0.5 * log ( ( 1.0 + x ) / ( 1.0 - x ) );

  return
end
