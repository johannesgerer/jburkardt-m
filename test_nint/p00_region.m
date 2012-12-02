function region = p00_region ( problem )

%*****************************************************************************80
%
%% P00_REGION returns the name of the integration region for any problem.
%
%  Discussion:
%
%    I thought I was going to use this idea a lot, but most of my test
%    regions are boxes.
%
%    BALL
%      the interior of a 2D circle,
%      the interior of a 3D sphere,
%      the interior of an ND sphere.
%
%    BOX
%      a 1D finite line segment,
%      a 2D finite rectangle,
%      a 3D box,
%      an ND box.
%
%    SIMPLEX 
%      a 2D triangle,
%      a 3D tetrahedron,
%      an ND simplex.
%      The "unit simplex" in ND is the set of nonnegative points X 
%      such that sum ( X(1:N) ) <= 1.
%
%    SPACE
%      a 1D infinite line,
%      a 2D infinite place,
%      a 3D space,
%      an ND space.
%
%    SPHERE
%      the circumference of a 2D circle,
%      the surface of a 3D sphere,
%      the surface of an ND sphere.
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
%    Output, string REGION, the name of the integration region.
%
  if ( problem == 1 )
    region = p01_region ( );
  elseif ( problem == 2 )
    region = p02_region ( );
  elseif ( problem == 3 )
    region = p03_region ( );
  elseif ( problem == 4 )
    region = p04_region ( );
  elseif ( problem == 5 )
    region = p05_region ( );
  elseif ( problem == 6 )
    region = p06_region ( );
  elseif ( problem == 7 )
    region = p07_region ( );
  elseif ( problem == 8 )
    region = p08_region ( );
  elseif ( problem == 9 )
    region = p09_region ( );
  elseif ( problem == 10 )
    region = p10_region ( );
  elseif ( problem == 11 )
    region = p11_region ( );
  elseif ( problem == 12 )
    region = p12_region ( );
  elseif ( problem == 13 )
    region = p13_region ( );
  elseif ( problem == 14 )
    region = p14_region ( );
  elseif ( problem == 15 )
    region = p15_region ( );
  elseif ( problem == 16 )
    region = p16_region ( );
  elseif ( problem == 17 )
    region = p17_region ( );
  elseif ( problem == 18 )
    region = p18_region ( );
  elseif ( problem == 19 )
    region = p19_region ( );
  elseif ( problem == 20 )
    region = p20_region ( );
  elseif ( problem == 21 )
    region = p21_region ( );
  elseif ( problem == 22 )
    region = p22_region ( );
  elseif ( problem == 23 )
    region = p23_region ( );
  elseif ( problem == 24 )
    region = p24_region ( );
  elseif ( problem == 25 )
    region = p25_region ( );
  elseif ( problem == 26 )
    region = p26_region ( );
  elseif ( problem == 27 )
    region = p27_region ( );
  elseif ( problem == 28 )
    region = p28_region ( );
  elseif ( problem == 29 )
    region = p29_region ( );
  elseif ( problem == 30 )
    region = p30_region ( );
  elseif ( problem == 31 )
    region = p31_region ( );
  elseif ( problem == 32 )
    region = p32_region ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_REGION - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_REGION - Fatal error!' );
  end

  return
end
