function element_num = grid_element_num ( code, nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_ELEMENT_NUM returns the number of elements in a grid.
%
%  Discussion:
%
%    The number of elements generated will be NELEMX * NELEMY for
%    quadrilaterals, or 2 * NELEMX * NELEMY for triangles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string CODE, identifies the element desired.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL', 'T3', 
%    'T4', 'T6' and 'T10'.
%
%    Input, integer NELEMX, NELEMY, the number of quadrilaterals along the
%    X and Y directions.  
%
%    Output, integer ELEMENT_NUM, the number of elements in the grid.
%
  if ( s_eqi ( code, 'Q4' ) )
    element_num = grid_q4_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q8' ) )
    element_num = grid_q8_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q9' ) )
    element_num = grid_q9_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q12' ) )
    element_num = grid_q12_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q16' ) )
    element_num = grid_q16_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'QL' ) )
    element_num = grid_ql_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T3' ) )
    element_num = grid_t3_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T4' ) )
    element_num = grid_t4_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T6' ) )
    element_num = grid_t6_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T10' ) )
    element_num = grid_t10_element_num ( nelemx, nelemy );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_ELEMENT_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE = "%s".', code );
    element_num = -1;
    error ( 'GRID_ELEMENT_NUM - Fatal error!' )
  end

  return
end
