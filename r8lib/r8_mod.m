function value = r8_mod ( x, y )

%*****************************************************************************80
%
%% R8_MOD returns the remainder of R8 division.
%
%  Formula:
%
%    If
%      REM = R8_MOD ( X, Y )
%      RMULT = ( X - REM ) / Y
%    then
%      X = Y * RMULT + REM
%    where REM has the same sign as X, and abs ( REM ) < Y.
%
%  Example:
%
%        X         Y     R8_MOD  R8_MOD Factorization
%
%      107        50       7      107 =  2 *  50 + 7
%      107       -50       7      107 = -2 * -50 + 7
%     -107        50      -7     -107 = -2 *  50 - 7
%     -107       -50      -7     -107 =  2 * -50 - 7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number to be divided.
%
%    Input, real Y, the number that divides X.
%
%    Output, real VALUE, the remainder when X is divided by Y.
%
  if ( y == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_MOD - Fatal error!\n' );
    fprintf ( 1, '  R8_MOD ( X, Y ) called with Y = 0.\n' );
    error ( 'R8_MOD - Fatal error!' );
  end

  value = x - floor ( x / y ) * y;

  if ( x < 0.0 && 0.0 < value )
    value = value - abs ( y );
  elseif ( 0.0 < x && value < 0.0 )
    value = value + abs ( y );
  end

  return
end
