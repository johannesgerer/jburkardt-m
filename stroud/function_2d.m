function value = function_2d ( x, y )

%*****************************************************************************80
%
%% FUNCTION_2D evaluates the current 2D function.
%
%  Discussion:
%
%    The user specifies the actual form of the function by
%    declaring the variable
%
%      global FUNC_2D_INDEX
%
%    and setting it to a value between 1 and 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the value of the variables.
%
%    Output, real VALUE, the value of the function.
%
  global FUNC_2D_INDEX;
  global FUNC_2D_NAME;

  if ( FUNC_2D_INDEX == 1 )
    value = 1.0E+00;
    FUNC_2D_NAME = '      1';
  elseif ( FUNC_2D_INDEX == 2 )
    value = x;
    FUNC_2D_NAME = '      X';
  elseif ( FUNC_2D_INDEX == 3 )
    value = x^2;
    FUNC_2D_NAME = '    X^2';
  elseif ( FUNC_2D_INDEX == 4 )
    value = x^3;
    FUNC_2D_NAME = '    X^3';
  elseif ( FUNC_2D_INDEX == 5 )
    value = x^4;
    FUNC_2D_NAME = '    X^4';
  elseif ( FUNC_2D_INDEX == 6 )
    value = x^5;
    FUNC_2D_NAME = '    X^5';
  elseif ( FUNC_2D_INDEX == 7 )
    value = x^6;
    FUNC_2D_NAME = '    X^6';
  elseif ( FUNC_2D_INDEX == 8 )
    value = sqrt ( x^2 + y^2 );
    FUNC_2D_NAME = '      R';
  elseif ( FUNC_2D_INDEX == 9 )
    value = sin ( x );
    FUNC_2D_NAME = ' SIN(X)';
  elseif ( FUNC_2D_INDEX == 10 )
    value = exp ( x );
    FUNC_2D_NAME = ' EXP(X)';
  elseif ( FUNC_2D_INDEX == 11 )
    value = 1.0E+00 / ( 1.0E+00 + sqrt ( x^2 + y^2 ) );
    FUNC_2D_NAME = '1/(1+R)';
  elseif ( FUNC_2D_INDEX == 12 )
    value = sqrt ( sqrt ( x^2 + y^2 ) );
    FUNC_2D_NAME = 'SQRT(R)';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FUNCTION_2D - Fatal error!\n' );
    fprintf ( 1, '  The global variable FUNC_2D_INDEX was not set,\n' );
    fprintf ( 1, '  or has an illegal value.\n' );
    fprintf ( 1, '  FUNC_2D_INDEX should be between 1 and 12.\n' );
    fprintf ( 1, '  Its current value is %d\n', FUNC_2D_INDEX );
    error ( 'FUNCTION_2D - Fatal error!' );
  end

  return
end
