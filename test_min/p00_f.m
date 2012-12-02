function f = p00_f ( problem, x )

%*****************************************************************************80
%
%% P00_F evaluates the function for any problem.
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
%    Input, real X, the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  if ( problem == 1 )
    f = p01_f ( x );
  elseif ( problem == 2 )
    f = p02_f ( x );
  elseif ( problem == 3 )
    f = p03_f ( x );
  elseif ( problem == 4 )
    f = p04_f ( x );
  elseif ( problem == 5 )
    f = p05_f ( x );
  elseif ( problem == 6 )
    f = p06_f ( x );
  elseif ( problem == 7 )
    f = p07_f ( x );
  elseif ( problem == 8 )
    f = p08_f ( x );
  elseif ( problem == 9 )
    f = p09_f ( x );
  elseif ( problem == 10 )
    f = p10_f ( x );
  elseif ( problem == 11 )
    f = p11_f ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number PROBLEM = %d\n', problem );
    error ( 'P00_F - Fatal error!' );
  end

  return
end
