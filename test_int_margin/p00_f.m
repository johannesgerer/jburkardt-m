function f = p00_f ( problem, n, x )

%*****************************************************************************80
%
%% P00_F evaluates the objective function for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(N), the arguments.
%
%    Output, real F(N), the function at each argument.
%
  if ( problem == 1 )
    f = p01_f ( n, x );
  elseif ( problem == 2 )
    f = p02_f ( n, x );
  elseif ( problem == 3 )
    f = p03_f ( n, x );
  elseif ( problem == 4 )
    f = p04_f ( n, x );
  elseif ( problem == 5 )
    f = p05_f ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number PROBLEM = %d\n', problem );
    error ( 'P00_F - Fatal error!' );
  end

  return
end
