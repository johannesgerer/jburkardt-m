function boundary_segment_num = p00_boundary_segment_num ( test )

%*****************************************************************************80
%
%% P00_BOUNDARY_SEGMENT_NUM counts the boundary segments in a problem.
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
%    Output, integer BOUNDARY_SEGMENT_NUM, the number of boundary segments.
%
  if ( test == 1 )
    boundary_segment_num = p01_boundary_segment_num ( );
  elseif ( test == 2 )
    boundary_segment_num = p02_boundary_segment_num ( );
  elseif ( test == 3 )
    boundary_segment_num = p03_boundary_segment_num ( );
  elseif ( test == 4 )
    boundary_segment_num = p04_boundary_segment_num ( );
  elseif ( test == 5 )
    boundary_segment_num = p05_boundary_segment_num ( );
  elseif ( test == 6 )
    boundary_segment_num = p06_boundary_segment_num ( );
  elseif ( test == 7 )
    boundary_segment_num = p07_boundary_segment_num ( );
  elseif ( test == 8 )
    boundary_segment_num = p08_boundary_segment_num ( );
  elseif ( test == 9 )
    boundary_segment_num = p09_boundary_segment_num ( );
  elseif ( test == 10 )
    boundary_segment_num = p10_boundary_segment_num ( );
  elseif ( test == 11 )
    boundary_segment_num = p11_boundary_segment_num ( );
  elseif ( test == 12 )
    boundary_segment_num = p12_boundary_segment_num ( );
  elseif ( test == 13 )
    boundary_segment_num = p13_boundary_segment_num ( );
  elseif ( test == 14 )
    boundary_segment_num = p14_boundary_segment_num ( );
  elseif ( test == 15 )
    boundary_segment_num = p15_boundary_segment_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_BOUNDARY_SEGMENT_NUM - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    error ( 'P00_BOUNDARY_SEGMENT_NUM - Fatal error!' );
  end

  return
end
