function hole_num = p00_hole_num ( test )

%*****************************************************************************80
%
%% P00_HOLE_NUM counts the holes in a problem.
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
%    Output, integer HOLE_NUM, the number of boundary segments.
%
  if ( test == 1 )
    hole_num = p01_hole_num ( );
  elseif ( test == 2 )
    hole_num = p02_hole_num ( );
  elseif ( test == 3 )
    hole_num = p03_hole_num ( );
  elseif ( test == 4 )
    hole_num = p04_hole_num ( );
  elseif ( test == 5 )
    hole_num = p05_hole_num ( );
  elseif ( test == 6 )
    hole_num = p06_hole_num ( );
  elseif ( test == 7 )
    hole_num = p07_hole_num ( );
  elseif ( test == 8 )
    hole_num = p08_hole_num ( );
  elseif ( test == 9 )
    hole_num = p09_hole_num ( );
  elseif ( test == 10 )
    hole_num = p10_hole_num ( );
  elseif ( test == 11 )
    hole_num = p11_hole_num ( );
  elseif ( test == 12 )
    hole_num = p12_hole_num ( );
  elseif ( test == 13 )
    hole_num = p13_hole_num ( );
  elseif ( test == 14 )
    hole_num = p14_hole_num ( );
  elseif ( test == 15 )
    hole_num = p15_hole_num ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_HOLE_NUM - Fatal error!\n' );
    fprintf ( 1, '  Input value of TEST is out of range.\n' );
    fprintf ( 1, '  TEST = %d\n', test );
    error ( 'P00_HOLE_NUM - Fatal error!' )
  end

  return
end
