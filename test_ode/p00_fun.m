function yp = p00_fun ( test, neqn, t, y )

%*****************************************************************************80
%
%% P00_FUN evaluates the right hand side of any test problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Input, integer NEQN, the number of equations.
%
%    Input, real T, the value of the independent variable.
%
%    Input, real Y(NEQN,1), the value of the dependent variables.
%
%    Output, real YP(NEQN,1), the value of the derivative of the
%    dependent variables, as specified by the ODE.
%
  yp = zeros ( neqn, 1 );
 
  if ( test == 1 )
    yp = p01_fun ( neqn, t, y );
  elseif ( test == 2 )
    yp = p02_fun ( neqn, t, y );
  elseif ( test == 3 )
    yp = p03_fun ( neqn, t, y );
  elseif ( test == 4 )
    yp = p04_fun ( neqn, t, y );
  elseif ( test == 5 )
    yp = p05_fun ( neqn, t, y );
  elseif ( test == 6 )
    yp = p06_fun ( neqn, t, y );
  elseif ( test == 7 )
    yp = p07_fun ( neqn, t, y );
  elseif ( test == 8 )
    yp = p08_fun ( neqn, t, y );
  elseif ( test == 9 )
    yp = p09_fun ( neqn, t, y );
  elseif ( test == 10 )
    yp = p10_fun ( neqn, t, y );
  elseif ( test == 11 )
    yp = p11_fun ( neqn, t, y );
  elseif ( test == 12 )
    yp = p12_fun ( neqn, t, y );
  elseif ( test == 13 )
    yp = p13_fun ( neqn, t, y );
  elseif ( test == 14 )
    yp = p14_fun ( neqn, t, y );
  elseif ( test == 15 )
    yp = p15_fun ( neqn, t, y );
  elseif ( test == 16 )
    yp = p16_fun ( neqn, t, y );
  elseif ( test == 17 )
    yp = p17_fun ( neqn, t, y );
  elseif ( test == 18 )
    yp = p18_fun ( neqn, t, y );
  elseif ( test == 19 )
    yp = p19_fun ( neqn, t, y );
  elseif ( test == 20 )
    yp = p20_fun ( neqn, t, y );
  elseif ( test == 21 )
    yp = p21_fun ( neqn, t, y );
  elseif ( test == 22 )
    yp = p22_fun ( neqn, t, y );
  elseif ( test == 23 )
    yp = p23_fun ( neqn, t, y );
  elseif ( test == 24 )
    yp = p24_fun ( neqn, t, y );
  elseif ( test == 25 )
    yp = p25_fun ( neqn, t, y );
  elseif ( test == 26 )
    yp = p26_fun ( neqn, t, y );
  elseif ( test == 27 )
    yp = p27_fun ( neqn, t, y );
  elseif ( test == 28 )
    yp = p28_fun ( neqn, t, y );
  elseif ( test == 29 )
    yp = p29_fun ( neqn, t, y );
  elseif ( test == 30 )
    yp = p30_fun ( neqn, t, y );
  elseif ( test == 31 )
    yp = p31_fun ( neqn, t, y );
  elseif ( test == 32 )
    yp = p32_fun ( neqn, t, y );
  elseif ( test == 33 )
    yp = p33_fun ( neqn, t, y );
  elseif ( test == 34 )
    yp = p34_fun ( neqn, t, y );
  elseif ( test == 35 )
    yp = p35_fun ( neqn, t, y );
  elseif ( test == 36 )
    yp = p36_fun ( neqn, t, y );
  elseif ( test == 37 )
    yp = p37_fun ( neqn, t, y );
  elseif ( test == 38 )
    yp = p38_fun ( neqn, t, y );
  elseif ( test == 39 )
    yp = p39_fun ( neqn, t, y );
  elseif ( test == 40 )
    yp = p40_fun ( neqn, t, y );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_FUN - Fatal error!' );
  end

  return
end
