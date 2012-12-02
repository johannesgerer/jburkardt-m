function value = function_nd ( n, x )

%*****************************************************************************80
%
%% FUNCTION_ND evaluates the current ND function.
%
%  Discussion:
%
%    The user specifies the actual form of the function by
%    declaring the variable
%
%      global FUNC_ND_INDEX
%
%    and setting it to a value between 1 and 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the value of the variables.
%
%    Output, real VALUE, the value of the function.
%
  global FUNC_ND_INDEX;

  if ( FUNC_ND_INDEX == 1 )
    value = 1.0;
  elseif ( FUNC_ND_INDEX == 2 )
    value = x(1);
  elseif ( FUNC_ND_INDEX == 3 )
    value = x(1)^2;
  elseif ( FUNC_ND_INDEX == 4 )
    value = x(1)^3;
  elseif ( FUNC_ND_INDEX == 5 )
    value = x(1)^4;
  elseif ( FUNC_ND_INDEX == 6 )
    value = x(1)^5;
  elseif ( FUNC_ND_INDEX == 7 )
    value = x(1)^6;
  elseif ( FUNC_ND_INDEX == 8 )
    value = sqrt ( sum ( x(1:n).^2 ) );
  elseif ( FUNC_ND_INDEX == 9 )
    value = sin ( x(1) );
  elseif ( FUNC_ND_INDEX == 10 )
    value = exp ( x(1) );
  elseif ( FUNC_ND_INDEX == 11 )
    value = 1.0E+00 / ( 1.0 + sqrt ( sum ( x(1:n).^2 ) ) );
  elseif ( FUNC_ND_INDEX == 12 )
    value = sqrt ( sqrt ( sum ( x(1:n).^2 ) ) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FUNCTION_ND - Fatal error!\n' );
    fprintf ( 1, '  The global variable FUNC_ND_INDEX was not set,\n' );
    fprintf ( 1, '  or has an illegal value.\n' );
    fprintf ( 1, '  FUNC_ND_INDEX should be between 1 and 12.\n' );
    fprintf ( 1, '  Its current value is %d\n', FUNC_ND_INDEX );
    error ( 'FUNCTION_ND - Fatal error!' );
  end

  return
end
