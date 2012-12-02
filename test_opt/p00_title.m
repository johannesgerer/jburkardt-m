function title = p00_title ( problem )

%*****************************************************************************80
%
%% P00_TITLE returns a title for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the number of the problem.
%
%    Output, string TITLE, a title for the problem.
%
  if ( problem == 1 )
    title = p01_title ( );
  elseif ( problem == 2 )
    title = p02_title ( );
  elseif ( problem == 3 )
    title = p03_title ( );
  elseif ( problem == 4 )
    title = p04_title ( );
  elseif ( problem == 5 )
    title = p05_title ( );
  elseif ( problem == 6 )
    title = p06_title ( );
  elseif ( problem == 7 )
    title = p07_title ( );
  elseif ( problem == 8 )
    title = p08_title ( );
  elseif ( problem == 9 )
    title = p09_title ( );
  elseif ( problem == 10 )
    title = p10_title ( );
  elseif ( problem == 11 )
    title = p11_title ( );
  elseif ( problem == 12 )
    title = p12_title ( );
  elseif ( problem == 13 )
    title = p13_title ( );
  elseif ( problem == 14 )
    title = p14_title ( );
  elseif ( problem == 15 )
    title = p15_title ( );
  elseif ( problem == 16 )
    title = p16_title ( );
  elseif ( problem == 17 )
    title = p17_title ( );
  elseif ( problem == 18 )
    title = p18_title ( );
  elseif ( problem == 19 )
    title = p19_title ( );
  elseif ( problem == 20 )
    title = p20_title ( );
  elseif ( problem == 21 )
    title = p21_title ( );
  elseif ( problem == 22 )
    title = p22_title ( );
  elseif ( problem == 23 )
    title = p23_title ( );
  elseif ( problem == 24 )
    title = p24_title ( );
  elseif ( problem == 25 )
    title = p25_title ( );
  elseif ( problem == 26 )
    title = p26_title ( );
  elseif ( problem == 27 )
    title = p27_title ( );
  elseif ( problem == 28 )
    title = p28_title ( );
  elseif ( problem == 29 )
    title = p29_title ( );
  elseif ( problem == 30 )
    title = p30_title ( );
  elseif ( problem == 31 )
    title = p31_title ( );
  elseif ( problem == 32 )
    title = p32_title ( );
  elseif ( problem == 33 )
    title = p33_title ( );
  elseif ( problem == 34 )
    title = p34_title ( );
  elseif ( problem == 35 )
    title = p35_title ( );
  elseif ( problem == 36 )
    title = p36_title ( );
  elseif ( problem == 37 )
    title = p37_title ( );
  elseif ( problem == 38 )
    title = p38_title ( );
  elseif ( problem == 39 )
    title = p39_title ( );
  elseif ( problem == 40 )
    title = p40_title ( );
  elseif ( problem == 41 )
    title = p41_title ( );
  elseif ( problem == 42 )
    title = p42_title ( );
  elseif ( problem == 43 )
    title = p43_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM = %d', problem );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
