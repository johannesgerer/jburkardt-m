function value = function_3d ( x, y, z )

%*****************************************************************************80
%
%% FUNCTION_3D evaluates a function F(X,Y,Z) of 3 variables.
%
%  Discussion:
%
%    The user specifies the actual form of the function by
%    declaring the variable
%
%      global FUNC_3D_INDEX
%
%    and setting it to a value between 1 and 23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, Z, the value of the variables.
%
%    Output, real VALUE, the value of the function.
%
  global FUNC_3D_INDEX;

  if ( FUNC_3D_INDEX == 1 )
    value = 1.0;
  elseif ( FUNC_3D_INDEX == 2 )
    value = x;
  elseif ( FUNC_3D_INDEX == 3 )
    value = y;
  elseif ( FUNC_3D_INDEX == 4 )
    value = z;
  elseif ( FUNC_3D_INDEX == 5 )
    value = x * x;
  elseif ( FUNC_3D_INDEX == 6 )
    value = x * y;
  elseif ( FUNC_3D_INDEX == 7 )
    value = x * z;
  elseif ( FUNC_3D_INDEX == 8 )
    value = y * y;
  elseif ( FUNC_3D_INDEX == 9 )
    value = y * z;
  elseif ( FUNC_3D_INDEX == 10 )
    value = z * z;
  elseif ( FUNC_3D_INDEX == 11 )
    value = x * x * x;
  elseif ( FUNC_3D_INDEX == 12 )
    value = x * y * z;
  elseif ( FUNC_3D_INDEX == 13 )
    value = z * z * z;
  elseif ( FUNC_3D_INDEX == 14 )
    value = x * x * x * x;
  elseif ( FUNC_3D_INDEX == 15 )
    value = x * x * z * z;
  elseif ( FUNC_3D_INDEX == 16 )
    value = z * z * z * z;
  elseif ( FUNC_3D_INDEX == 17 )
    value = x * x * x * x * x;
  elseif ( FUNC_3D_INDEX == 18 )
    value = x * x * x * x * x * x;
  elseif ( FUNC_3D_INDEX == 19 )
    value = sqrt ( x * x + y * y + z * z );
  elseif ( FUNC_3D_INDEX == 20 )
    value = sin ( x );
  elseif ( FUNC_3D_INDEX == 21 )
    value = exp ( x );
  elseif ( FUNC_3D_INDEX == 22 )
    value = 1.0 / ( 1.0 + sqrt ( x * x + y * y + z * z ) );
  elseif ( FUNC_3D_INDEX == 23 )
    value = sqrt ( sqrt ( x * x + y * y + z * z ) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FUNCTION_3D - Fatal error!\n' );
    fprintf ( 1, '  The global variable FUNC_3D_INDEX was not set,\n' );
    fprintf ( 1, '  or has an illegal value.\n' );
    fprintf ( 1, '  FUNC_3D_INDEX should be between 1 and 12.\n' );
    fprintf ( 1, '  Its current value is %d\n', FUNC_3D_INDEX );
    error ( 'FUNCTION_3D - Fatal error!' );
  end

  return
end
