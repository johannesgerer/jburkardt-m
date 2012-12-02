function value = function_1d ( x )

%*****************************************************************************80
%
%% FUNCTION_1D evaluates the current 1D function.
%
%  Discussion:
%
%    The user specifies the actual form of the function by
%    calling FUNCTION_1D_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the value of the variable.
%
%    Output, real VALUE, the value of the function.
%
  global ifunc;

  ifunc = function_1d_set ( 'GET', 0 );

  if ( ifunc == 1 )
    value = 1.0;
  elseif ( ifunc == 2 )
    value = x;
  elseif ( ifunc == 3 )
    value = x^2;
  elseif ( ifunc == 4 )
    value = x^3;
  elseif ( ifunc == 5 )
    value = x^4;
  elseif ( ifunc == 6 )
    value = x^5;
  elseif ( ifunc == 7 )
    value = x^6;
  elseif ( ifunc == 8 )
    value = abs ( x );
  elseif ( ifunc == 9 )
    value = sin ( x );
  elseif ( ifunc == 10 )
    value = exp ( x );
  elseif ( ifunc == 11 )
    value = 1.0 / ( 1.0 + sqrt ( x^2 ) );
  elseif ( ifunc == 12 )
    value = sqrt ( sqrt ( x^2 ) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FUNCTION_1D - Fatal error!\n' );
    fprintf ( 1, '  The funciton index ifunc was not set,\n' );
    fprintf ( 1, '  or has an illegal value.\n' );
    fprintf ( 1, '  This value should be between 1 and 12.\n' );
    fprintf ( 1, '  Its current value is %d\n', ifunc );
    error ( 'FUNCTION_1D - Fatal error!' );
  end

  return
end
