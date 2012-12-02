function value = func ( x )

%*****************************************************************************80
%
%% FUNC evaluates a function of X, as chosen by the user.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the function.
%
%    Output, real FUNC, the value of the function.
%
  ifunc = func_set ( 'GET', 'DUMMY' );

  if ( ifunc == 1 )
    value = 1.0;
  elseif ( ifunc == 2 )
    value = x;
  elseif ( ifunc == 3 )
    value = x.^2;
  elseif ( ifunc == 4 )
    value = x.^3;
  elseif ( ifunc == 5 )
    value = x.^4;
  elseif ( ifunc == 6 )
    value = x.^5;
  elseif ( ifunc == 7 )
    value = x.^6;
  elseif ( ifunc == 8 )
    value = x.^7;
  elseif ( ifunc == 9 )
    value = sin ( x );
  elseif ( ifunc == 10 )
    value = exp ( x );
  elseif ( ifunc == 11 )
    value = sqrt ( abs ( x ) );
  else
    value = 0.0;
  end

  return
end
