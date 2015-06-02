function autonomous = p00_autonomous ( test )

%*****************************************************************************80
%
%% P00_AUTONOMOUS returns TRUE if a given problem is autonomous.
%
%  Discussion:
%
%    A system of ordinary differential equations is said to be autonomous
%    if the right hand side is independent of time.
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
%    Output, integer AUTONOMOUS, is 1 if the test problem is autonomous.
%
  if ( test == 1 )
    autonomous = p01_autonomous ( );
  elseif ( test == 2 )
    autonomous = p02_autonomous ( );
  elseif ( test == 3 )
    autonomous = p03_autonomous ( );
  elseif ( test == 4 )
    autonomous = p04_autonomous ( );
  elseif ( test == 5 )
    autonomous = p05_autonomous ( );
  elseif ( test == 6 )
    autonomous = p06_autonomous ( );
  elseif ( test == 7 )
    autonomous = p07_autonomous ( );
  elseif ( test == 8 )
    autonomous = p08_autonomous ( );
  elseif ( test == 9 )
    autonomous = p09_autonomous ( );
  elseif ( test == 10 )
    autonomous = p10_autonomous ( );
  elseif ( test == 11 )
    autonomous = p11_autonomous ( );
  elseif ( test == 12 )
    autonomous = p12_autonomous ( );
  elseif ( test == 13 )
    autonomous = p13_autonomous ( );
  elseif ( test == 14 )
    autonomous = p14_autonomous ( );
  elseif ( test == 15 )
    autonomous = p15_autonomous ( );
  elseif ( test == 16 )
    autonomous = p16_autonomous ( );
  elseif ( test == 17 )
    autonomous = p17_autonomous ( );
  elseif ( test == 18 )
    autonomous = p18_autonomous ( );
  elseif ( test == 19 )
    autonomous = p19_autonomous ( );
  elseif ( test == 20 )
    autonomous = p20_autonomous ( );
  elseif ( test == 21 )
    autonomous = p21_autonomous ( );
  elseif ( test == 22 )
    autonomous = p22_autonomous ( );
  elseif ( test == 23 )
    autonomous = p23_autonomous ( );
  elseif ( test == 24 )
    autonomous = p24_autonomous ( );
  elseif ( test == 25 )
    autonomous = p25_autonomous ( );
  elseif ( test == 26 )
    autonomous = p26_autonomous ( );
  elseif ( test == 27 )
    autonomous = p27_autonomous ( );
  elseif ( test == 28 )
    autonomous = p28_autonomous ( );
  elseif ( test == 29 )
    autonomous = p29_autonomous ( );
  elseif ( test == 30 )
    autonomous = p30_autonomous ( );
  elseif ( test == 31 )
    autonomous = p31_autonomous ( );
  elseif ( test == 32 )
    autonomous = p32_autonomous ( );
  elseif ( test == 33 )
    autonomous = p33_autonomous ( );
  elseif ( test == 34 )
    autonomous = p34_autonomous ( );
  elseif ( test == 35 )
    autonomous = p35_autonomous ( );
  elseif ( test == 36 )
    autonomous = p36_autonomous ( );
  elseif ( test == 37 )
    autonomous = p37_autonomous ( );
  elseif ( test == 38 )
    autonomous = p38_autonomous ( );
  elseif ( test == 39 )
    autonomous = p39_autonomous ( );
  elseif ( test == 40 )
    autonomous = p40_autonomous ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_AUTONOMOUS - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_AUTONOMOUS - Fatal error!' );
  end

  return
end
