function fx = p00_fun ( problem, n, x )

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
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  if ( problem == 1 )
    fx = p01_fun ( n, x );
  elseif ( problem == 2 )
    fx = p02_fun ( n, x );
  elseif ( problem == 3 )
    fx = p03_fun ( n, x );
  elseif ( problem == 4 )
    fx = p04_fun ( n, x );
  elseif ( problem == 5 )
    fx = p05_fun ( n, x );
  elseif ( problem == 6 )
    fx = p06_fun ( n, x );
  elseif ( problem == 7 )
    fx = p07_fun ( n, x );
  elseif ( problem == 8 )
    fx = p08_fun ( n, x );
  elseif ( problem == 9 )
    fx = p09_fun ( n, x );
  elseif ( problem == 10 )
    fx = p10_fun ( n, x );
  elseif ( problem == 11 )
    fx = p11_fun ( n, x );
  elseif ( problem == 12 )
    fx = p12_fun ( n, x );
  elseif ( problem == 13 )
    fx = p13_fun ( n, x );
  elseif ( problem == 14 )
    fx = p14_fun ( n, x );
  elseif ( problem == 15 )
    fx = p15_fun ( n, x );
  elseif ( problem == 16 )
    fx = p16_fun ( n, x );
  elseif ( problem == 17 )
    fx = p17_fun ( n, x );
  elseif ( problem == 18 )
    fx = p18_fun ( n, x );
  elseif ( problem == 19 )
    fx = p19_fun ( n, x );
  elseif ( problem == 20 )
    fx = p20_fun ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_FUN - Fatal error!' );
  end

  return
end
