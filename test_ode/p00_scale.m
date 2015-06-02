function scale = p00_scale ( test, neqn )

%*****************************************************************************80
%
%% P00_SCALE returns the scale for any test problem.
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
%    Output, real SCALE(NEQN), the scale vector for the dependent variables.
%
  if ( test == 1 )
    scale(1:neqn,1) = p01_scale ( neqn );
  elseif ( test == 2 )
    scale(1:neqn,1) = p02_scale ( neqn );
  elseif ( test == 3 )
    scale(1:neqn,1) = p03_scale ( neqn );
  elseif ( test == 4 )
    scale(1:neqn,1) = p04_scale ( neqn );
  elseif ( test == 5 )
    scale(1:neqn,1) = p05_scale ( neqn );
  elseif ( test == 6 )
    scale(1:neqn,1) = p06_scale ( neqn );
  elseif ( test == 7 )
    scale(1:neqn,1) = p07_scale ( neqn );
  elseif ( test == 8 )
    scale(1:neqn,1) = p08_scale ( neqn );
  elseif ( test == 9 )
    scale(1:neqn,1) = p09_scale ( neqn );
  elseif ( test == 10 )
    scale(1:neqn,1) = p10_scale ( neqn );
  elseif ( test == 11 )
    scale(1:neqn,1) = p11_scale ( neqn );
  elseif ( test == 12 )
    scale(1:neqn,1) = p12_scale ( neqn );
  elseif ( test == 13 )
    scale(1:neqn,1) = p13_scale ( neqn );
  elseif ( test == 14 )
    scale(1:neqn,1) = p14_scale ( neqn );
  elseif ( test == 15 )
    scale(1:neqn,1) = p15_scale ( neqn );
  elseif ( test == 16 )
    scale(1:neqn,1) = p16_scale ( neqn );
  elseif ( test == 17 )
    scale(1:neqn,1) = p17_scale ( neqn );
  elseif ( test == 18 )
    scale(1:neqn,1) = p18_scale ( neqn );
  elseif ( test == 19 )
    scale(1:neqn,1) = p19_scale ( neqn );
  elseif ( test == 20 )
    scale(1:neqn,1) = p20_scale ( neqn );
  elseif ( test == 21 )
    scale(1:neqn,1) = p21_scale ( neqn );
  elseif ( test == 22 )
    scale(1:neqn,1) = p22_scale ( neqn );
  elseif ( test == 23 )
    scale(1:neqn,1) = p23_scale ( neqn );
  elseif ( test == 24 )
    scale(1:neqn,1) = p24_scale ( neqn );
  elseif ( test == 25 )
    scale(1:neqn,1) = p25_scale ( neqn );
  elseif ( test == 26 )
    scale(1:neqn,1) = p26_scale ( neqn );
  elseif ( test == 27 )
    scale(1:neqn,1) = p27_scale ( neqn );
  elseif ( test == 28 )
    scale(1:neqn,1) = p28_scale ( neqn );
  elseif ( test == 29 )
    scale(1:neqn,1) = p29_scale ( neqn );
  elseif ( test == 30 )
    scale(1:neqn,1) = p30_scale ( neqn );
  elseif ( test == 31 )
    scale(1:neqn,1) = p31_scale ( neqn );
  elseif ( test == 32 )
    scale(1:neqn,1) = p32_scale ( neqn );
  elseif ( test == 33 )
    scale(1:neqn,1) = p33_scale ( neqn );
  elseif ( test == 34 )
    scale(1:neqn,1) = p34_scale ( neqn );
  elseif ( test == 35 )
    scale(1:neqn,1) = p35_scale ( neqn );
  elseif ( test == 36 )
    scale(1:neqn,1) = p36_scale ( neqn );
  elseif ( test == 37 )
    scale(1:neqn,1) = p37_scale ( neqn );
  elseif ( test == 38 )
    scale(1:neqn,1) = p38_scale ( neqn );
  elseif ( test == 39 )
    scale(1:neqn,1) = p39_scale ( neqn );
  elseif ( test == 40 )
    scale(1:neqn,1) = p40_scale ( neqn );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_SCALE - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_SCALE - Fatal error!' );
  end

  return
end
