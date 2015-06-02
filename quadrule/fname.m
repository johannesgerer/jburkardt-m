function value = fname ( ifunc )

%*****************************************************************************80
%
%% FNAME returns the name of the function that will be evaluated in FUNC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IFUNC, the index of the function.
%
%    Output, string FNAME, the name of the function.
%
  if ( ifunc == 1 )
    value = '         1';
  elseif ( ifunc == 2 )
    value = '         X';
  elseif ( ifunc == 3 )
    value = '       X^2';
  elseif ( ifunc == 4 )
    value = '       X^3';
  elseif ( ifunc == 5 )
    value = '       X^4';
  elseif ( ifunc == 6 )
    value = '       X^5';
  elseif ( ifunc == 7 )
    value = '       X^6';
  elseif ( ifunc == 8 )
    value = '       X^7';
  elseif ( ifunc == 9 )
    value = '    SIN(X)';
  elseif ( ifunc == 10 )
    value = '    EXP(X)';
  elseif ( ifunc == 11 )
    value = ' SQRT(|X|)';
  else
    value = '??????????';
  end

  return
end
