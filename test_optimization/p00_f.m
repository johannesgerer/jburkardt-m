function f = p00_f ( problem, m, n, x )

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
%    07 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marcin Molga, Czeslaw Smutnicki,
%    Test functions for optimization needs.
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(M,N), the argument of the objective function.
%
%    Output, real F(N), the objective function evaluated at
%    each argument.
%
  if ( problem == 1 )
    f = p01_f ( m, n, x );
  elseif ( problem == 2 )
    f = p02_f ( m, n, x );
  elseif ( problem == 3 )
    f = p03_f ( m, n, x );
  elseif ( problem == 4 )
    f = p04_f ( m, n, x );
  elseif ( problem == 5 )
    f = p05_f ( m, n, x );
  elseif ( problem == 6 )
    f = p06_f ( m, n, x );
  elseif ( problem == 7 )
    f = p07_f ( m, n, x );
  elseif ( problem == 8 )
    f = p08_f ( m, n, x );
  elseif ( problem == 9 )
    f = p09_f ( m, n, x );
  elseif ( problem == 10 )
    f = p10_f ( m, n, x );
  elseif ( problem == 11 )
    f = p11_f ( m, n, x );
  elseif ( problem == 12 )
    f = p12_f ( m, n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM =  %d\n', problem );
    error ( 'P00_F - Fatal error!' );
  end

  return
end
