function neqn = p00_neqn ( test )

%*****************************************************************************80
%
%% P00_NEQN returns the number of equations for any test problem.
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
%    Output, integer NEQN, the dimension of the test problem.
%
  if ( test == 1 )
    neqn = p01_neqn ( );
  elseif ( test == 2 )
    neqn = p02_neqn ( );
  elseif ( test == 3 )
    neqn = p03_neqn ( );
  elseif ( test == 4 )
    neqn = p04_neqn ( );
  elseif ( test == 5 )
    neqn = p05_neqn ( );
  elseif ( test == 6 )
    neqn = p06_neqn ( );
  elseif ( test == 7 )
    neqn = p07_neqn ( );
  elseif ( test == 8 )
    neqn = p08_neqn ( );
  elseif ( test == 9 )
    neqn = p09_neqn ( );
  elseif ( test == 10 )
    neqn = p10_neqn ( );
  elseif ( test == 11 )
    neqn = p11_neqn ( );
  elseif ( test == 12 )
    neqn = p12_neqn ( );
  elseif ( test == 13 )
    neqn = p13_neqn ( );
  elseif ( test == 14 )
    neqn = p14_neqn ( );
  elseif ( test == 15 )
    neqn = p15_neqn ( );
  elseif ( test == 16 )
    neqn = p16_neqn ( );
  elseif ( test == 17 )
    neqn = p17_neqn ( );
  elseif ( test == 18 )
    neqn = p18_neqn ( );
  elseif ( test == 19 )
    neqn = p19_neqn ( );
  elseif ( test == 20 )
    neqn = p20_neqn ( );
  elseif ( test == 21 )
    neqn = p21_neqn ( );
  elseif ( test == 22 )
    neqn = p22_neqn ( );
  elseif ( test == 23 )
    neqn = p23_neqn ( );
  elseif ( test == 24 )
    neqn = p24_neqn ( );
  elseif ( test == 25 )
    neqn = p25_neqn ( );
  elseif ( test == 26 )
    neqn = p26_neqn ( );
  elseif ( test == 27 )
    neqn = p27_neqn ( );
  elseif ( test == 28 )
    neqn = p28_neqn ( );
  elseif ( test == 29 )
    neqn = p29_neqn ( );
  elseif ( test == 30 )
    neqn = p30_neqn ( );
  elseif ( test == 31 )
    neqn = p31_neqn ( );
  elseif ( test == 32 )
    neqn = p32_neqn ( );
  elseif ( test == 33 )
    neqn = p33_neqn ( );
  elseif ( test == 34 )
    neqn = p34_neqn ( );
  elseif ( test == 35 )
    neqn = p35_neqn ( );
  elseif ( test == 36 )
    neqn = p36_neqn ( );
  elseif ( test == 37 )
    neqn = p37_neqn ( );
  elseif ( test == 38 )
    neqn = p38_neqn ( );
  elseif ( test == 39 )
    neqn = p39_neqn ( );
  elseif ( test == 40 )
    neqn = p40_neqn ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_NEQN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_NEQN - Fatal error!' );
  end

  return
end

