function value = function_3d_name ( ifunc )

%*****************************************************************************80
%
%% FUNCTION_3D_NAME returns the name of the current 3D function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 April 2008
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
    value = '      Y';
  elseif ( ifunc == 4 )
    value = '      Z';

  elseif ( ifunc == 5 )
    value = '    X*X';
  elseif ( ifunc == 6 )
    value = '    X*Y';
  elseif ( ifunc == 7 )
    value = '    X*Z';
  elseif ( ifunc == 8 )
    value = '    Y*Y';
  elseif ( ifunc == 9 )
    value = '    Y*Z';
  elseif ( ifunc == 10 )
    value = '    Z*Z';

  elseif ( ifunc == 11 )
    value = '    X^3';
  elseif ( ifunc == 12 )
    value = '  X*Y*Z';
  elseif ( ifunc == 13 )
    value = '  Z*Z*Z';

  elseif ( ifunc == 14 )
    value = '    X^4';
  elseif ( ifunc == 15 )
    value = 'X^2 Z^2';
  elseif ( ifunc == 16 )
    value = '    Z^4';

  elseif ( ifunc == 17 )
    value = '    X^5';
  elseif ( ifunc == 18 )
    value = '    X^6';
  elseif ( ifunc == 19 )
    value = '      R';
  elseif ( ifunc == 20 )
    value = ' SIN(X)';
  elseif ( ifunc == 21 )
    value = ' EXP(X)';
  elseif ( ifunc == 22 )
    value = '1/(1+R)';
  elseif ( ifunc == 23 )
    value = 'SQRT(R)';
  else
    value = '???????';
  end

  return
end
