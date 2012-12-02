function name = p00_name ( problem )

%*****************************************************************************80
%
%% P00_NAME returns the name of the problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the number of the desired test problem.
%
%    Output, string NAME, the name of the problem.
%
  if ( problem == 1 )
    name = p01_name ( );
  elseif ( problem == 2 )
    name = p02_name ( );
  elseif ( problem == 3 )
    name = p03_name ( );
  elseif ( problem == 4 )
    name = p04_name ( );
  elseif ( problem == 5 )
    name = p05_name ( );
  elseif ( problem == 6 )
    name = p06_name ( );
  elseif ( problem == 7 )
    name = p07_name ( );
  elseif ( problem == 8 )
    name = p08_name ( );
  elseif ( problem == 9 )
    name = p09_name ( );
  elseif ( problem == 10 )
    name = p10_name ( );
  elseif ( problem == 11 )
    name = p11_name ( );
  elseif ( problem == 12 )
    name = p12_name ( );
  elseif ( problem == 13 )
    name = p13_name ( );
  elseif ( problem == 14 )
    name = p14_name ( );
  elseif ( problem == 15 )
    name = p15_name ( );
  elseif ( problem == 16 )
    name = p16_name ( );
  elseif ( problem == 17 )
    name = p17_name ( );
  elseif ( problem == 18 )
    name = p18_name ( );
  elseif ( problem == 19 )
    name = p19_name ( );
  elseif ( problem == 20 )
    name = p20_name ( );
  elseif ( problem == 21 )
    name = p21_name ( );
  elseif ( problem == 22 )
    name = p22_name ( );
  elseif ( problem == 23 )
    name = p23_name ( );
  elseif ( problem == 24 )
    name = p24_name ( );
  elseif ( problem == 25 )
    name = p25_name ( );
  elseif ( problem == 26 )
    name = p26_name ( );
  elseif ( problem == 27 )
    name = p27_name ( );
  elseif ( problem == 28 )
    name = p28_name ( );
  elseif ( problem == 29 )
    name = p29_name ( );
  elseif ( problem == 30 )
    name = p30_name ( );
  elseif ( problem == 31 )
    name = p31_name ( );
  elseif ( problem == 32 )
    name = p32_name ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_NAME - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_NAME - Fatal error!' );
  end

  return
end

