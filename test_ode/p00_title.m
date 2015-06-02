function title = p00_title ( test )

%*****************************************************************************80
%
%% P00_TITLE returns the title of any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Output, string TITLE, the title of the test problem.
%
  if ( test == 1 )
    title = p01_title ( );
  elseif ( test == 2 )
    title = p02_title ( );
  elseif ( test == 3 )
    title = p03_title ( );
  elseif ( test == 4 )
    title = p04_title ( );
  elseif ( test == 5 )
    title = p05_title ( );
  elseif ( test == 6 )
    title = p06_title ( );
  elseif ( test == 7 )
    title = p07_title ( );
  elseif ( test == 8 )
    title = p08_title ( );
  elseif ( test == 9 )
    title = p09_title ( );
  elseif ( test == 10 )
    title = p10_title ( );
  elseif ( test == 11 )
    title = p11_title ( );
  elseif ( test == 12 )
    title = p12_title ( );
  elseif ( test == 13 )
    title = p13_title ( );
  elseif ( test == 14 )
    title = p14_title ( );
  elseif ( test == 15 )
    title = p15_title ( );
  elseif ( test == 16 )
    title = p16_title ( );
  elseif ( test == 17 )
    title = p17_title ( );
  elseif ( test == 18 )
    title = p18_title ( );
  elseif ( test == 19 )
    title = p19_title ( );
  elseif ( test == 20 )
    title = p20_title ( );
  elseif ( test == 21 )
    title = p21_title ( );
  elseif ( test == 22 )
    title = p22_title ( );
  elseif ( test == 23 )
    title = p23_title ( );
  elseif ( test == 24 )
    title = p24_title ( );
  elseif ( test == 25 )
    title = p25_title ( );
  elseif ( test == 26 )
    title = p26_title ( );
  elseif ( test == 27 )
    title = p27_title ( );
  elseif ( test == 28 )
    title = p28_title ( );
  elseif ( test == 29 )
    title = p29_title ( );
  elseif ( test == 30 )
    title = p30_title ( );
  elseif ( test == 31 )
    title = p31_title ( );
  elseif ( test == 32 )
    title = p32_title ( );
  elseif ( test == 33 )
    title = p33_title ( );
  elseif ( test == 34 )
    title = p34_title ( );
  elseif ( test == 35 )
    title = p35_title ( );
  elseif ( test == 36 )
    title = p36_title ( );
  elseif ( test == 37 )
    title = p37_title ( );
  elseif ( test == 38 )
    title = p38_title ( );
  elseif ( test == 39 )
    title = p39_title ( );
  elseif ( test == 40 )
    title = p40_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_TITLE - Fatal error!' );
  end

  return
end
