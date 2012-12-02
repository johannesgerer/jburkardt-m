function p00_title ( problem )

%*****************************************************************************80
%
%% P00_TITLE prints a title for any problem.
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
  if ( problem == 1 )
    p01_title ( );
  elseif ( problem == 2 )
    p02_title ( );
  elseif ( problem == 3 )
    p03_title ( );
  elseif ( problem == 4 )
    p04_title ( );
  elseif ( problem == 5 )
    p05_title ( );
  elseif ( problem == 6 )
    p06_title ( );
  elseif ( problem == 7 )
    p07_title ( );
  elseif ( problem == 8 )
    p08_title ( );
  elseif ( problem == 9 )
    p09_title ( );
  elseif ( problem == 10 )
    p10_title ( );
  elseif ( problem == 11 )
    p11_title ( );
  elseif ( problem == 12 )
    p12_title ( );
  elseif ( problem == 13 )
    p13_title ( );
  elseif ( problem == 14 )
    p14_title ( );
  elseif ( problem == 15 )
    p15_title ( );
  elseif ( problem == 16 )
    p16_title ( );
  elseif ( problem == 17 )
    p17_title ( );
  elseif ( problem == 18 )
    p18_title ( );
  elseif ( problem == 19 )
    p19_title ( );
  elseif ( problem == 20 )
    p20_title ( );
  elseif ( problem == 21 )
    p21_title ( );
  elseif ( problem == 22 )
    p22_title ( );
  elseif ( problem == 23 )
    p23_title ( );
  elseif ( problem == 24 )
    p24_title ( );
  elseif ( problem == 25 )
    p25_title ( );
  elseif ( problem == 26 )
    p26_title ( );
  elseif ( problem == 27 )
    p27_title ( );
  elseif ( problem == 28 )
    p28_title ( );
  elseif ( problem == 29 )
    p29_title ( );
  elseif ( problem == 30 )
    p30_title ( );
  elseif ( problem == 31 )
    p31_title ( );
  elseif ( problem == 32 )
    p32_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
