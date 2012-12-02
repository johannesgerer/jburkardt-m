function f = p00_fun ( problem, n, p )

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
%    09 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the evaluation points.
%
%    Output, real F(N), the function values.
%
  if ( problem == 1 )
    f = p01_fun ( n, p );
  elseif ( problem == 2 )
    f = p02_fun ( n, p );
  elseif ( problem == 3 )
    f = p03_fun ( n, p );
  elseif ( problem == 4 )
    f = p04_fun ( n, p );
  elseif ( problem == 5 )
    f = p05_fun ( n, p );
  elseif ( problem == 6 )
    f = p06_fun ( n, p );
  elseif ( problem == 7 )
    f = p07_fun ( n, p );
  elseif ( problem == 8 )
    f = p08_fun ( n, p );
  elseif ( problem == 9 )
    f = p09_fun ( n, p );
  elseif ( problem == 10 )
    f = p10_fun ( n, p );
  elseif ( problem == 11 )
    f = p11_fun ( n, p );
  elseif ( problem == 12 )
    f = p12_fun ( n, p );
  elseif ( problem == 13 )
    f = p13_fun ( n, p );
  elseif ( problem == 14 )
    f = p14_fun ( n, p );
  elseif ( problem == 15 )
    f = p15_fun ( n, p );
  elseif ( problem == 16 )
    f = p16_fun ( n, p );
  elseif ( problem == 17 )
    f = p17_fun ( n, p );
  elseif ( problem == 18 )
    f = p18_fun ( n, p );
  elseif ( problem == 19 )
    f = p19_fun ( n, p );
  elseif ( problem == 20 )
    f = p20_fun ( n, p );
  elseif ( problem == 21 )
    f = p21_fun ( n, p );
  elseif ( problem == 22 )
    f = p22_fun ( n, p );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_FUN - Fatal error!' );
  end

  return
end
