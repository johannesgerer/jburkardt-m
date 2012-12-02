function fixed = p00_fixed_points ( test, m, fixed_num );

%*****************************************************************************80
%
%% P00_FIXED_POINTS returns the fixed points in a problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the index of the test problem
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer FIXED_NUM, the number of fixed points.
%
%    Output, real FIXED(M,FIXED_NUM), the 
%    coordinates of the fixed points.
%
  if ( test == 1 )
    fixed = p01_fixed_points ( m, fixed_num );
  elseif ( test == 2 )
    fixed = p02_fixed_points ( m, fixed_num );
  elseif ( test == 3 )
    fixed = p03_fixed_points ( m, fixed_num );
  elseif ( test == 4 )
    fixed = p04_fixed_points ( m, fixed_num );
  elseif ( test == 5 )
    fixed = p05_fixed_points ( m, fixed_num );
  elseif ( test == 6 )
    fixed = p06_fixed_points ( m, fixed_num );
  elseif ( test == 7 )
    fixed = p07_fixed_points ( m, fixed_num );
  elseif ( test == 8 )
    fixed = p08_fixed_points ( m, fixed_num );
  elseif ( test == 9 )
    fixed = p09_fixed_points ( m, fixed_num );
  elseif ( test == 10 )
    fixed = p10_fixed_points ( m, fixed_num );
  elseif ( test == 11 )
    fixed = p11_fixed_points ( m, fixed_num );
  elseif ( test == 12 )
    fixed = p12_fixed_points ( m, fixed_num );
  elseif ( test == 13 )
    fixed = p13_fixed_points ( m, fixed_num );
  elseif ( test == 14 )
    fixed = p14_fixed_points ( m, fixed_num );
  elseif ( test == 15 )
    fixed = p15_fixed_points ( m, fixed_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FIXED_POINTS - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_FIXED_POINTS - Fatal error!' );
  end

  return
end
