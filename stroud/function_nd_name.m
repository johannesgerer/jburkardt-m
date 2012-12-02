function value = function_nd_name ( ifunc )

%*****************************************************************************80
%
%% FUNCTION_ND_NAME returns the name of the current ND function.
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
%    Input, integer IFUNC, the index of the function.
%
%    Output, character FNAME(7), the name of the function.
%
  if ( ifunc == 1 )
    value = '      1';
  elseif ( ifunc == 2 )
    value = '      X';
  elseif ( ifunc == 3 )
    value = '    X^2';
  elseif ( ifunc == 4 )
    value = '    X^3';
  elseif ( ifunc == 5 )
    value = '    X^4';
  elseif ( ifunc == 6 )
    value = '    X^5';
  elseif ( ifunc == 7 )
    value = '    X^6';
  elseif ( ifunc == 8 )
    value = '      R';
  elseif ( ifunc == 9 )
    value = ' SIN(X)';
  elseif ( ifunc == 10 )
    value = ' EXP(X)';
  elseif ( ifunc == 11 )
    value = '1/(1+R)';
  elseif ( ifunc == 12 )
    value = 'SQRT(R)';
  else
    value = '???????';
  end

  return
end
