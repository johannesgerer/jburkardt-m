function f1 = p00_f1 ( problem, x )

%*****************************************************************************80
%
%% P00_F1 evaluates the first derivative for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, real X, the value of the variable.
%
%    Output, real F1, the first derivative of the
%    objective function.
%
  if ( problem == 1 )
    f1 = p01_f1 ( x );
  elseif ( problem == 2 )
    f1 = p02_f1 ( x );
  elseif ( problem == 3 )
    f1 = p03_f1 ( x );
  elseif ( problem == 4 )
    f1 = p04_f1 ( x );
  elseif ( problem == 5 )
    f1 = p05_f1 ( x );
  elseif ( problem == 6 )
    f1 = p06_f1 ( x );
  elseif ( problem == 7 )
    f1 = p07_f1 ( x );
  elseif ( problem == 8 )
    f1 = p08_f1 ( x );
  elseif ( problem == 9 )
    f1 = p09_f1 ( x );
  elseif ( problem == 10 )
    f1 = p10_f1 ( x );
  elseif ( problem == 11 )
    f1 = p11_f1 ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F1 - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number PROBLEM = %d\n', problem );
    error ( 'P02_F1 - Fatal error!' );
  end

  return
end
