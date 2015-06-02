function f = p00_fun ( problem, option, n, x )

%*****************************************************************************80
%
%% P00_FUN evaluates the integrand for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Input, integer OPTION:
%    0, integrand is f(x).
%    1, integrand is exp(-x*x) * f(x);
%    2, integrand is exp(-x*x/2) * f(x);
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real F(N), the function values.
%
  if ( problem == 1 )
    f = p01_fun ( option, n, x );
  elseif ( problem == 2 )
    f = p02_fun ( option, n, x );
  elseif ( problem == 3 )
    f = p03_fun ( option, n, x );
  elseif ( problem == 4 )
    f = p04_fun ( option, n, x );
  elseif ( problem == 5 )
    f = p05_fun ( option, n, x );
  elseif ( problem == 6 )
    f = p06_fun ( option, n, x );
  elseif ( problem == 7 )
    f = p07_fun ( option, n, x );
  elseif ( problem == 8 )
    f = p08_fun ( option, n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_FUN - Fatal error!' );
  end

  return
end
