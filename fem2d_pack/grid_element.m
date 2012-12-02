function element_node = grid_element ( code, element_order, nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_ELEMENT returns the grid associated with any available element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CODE(*), identifies the element desired.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL', 'T3',
%    'T6' and 'T10'.
%
%    Input, integer ELEMENT_ORDER, the order of the element.
%
%    Input, integer NELEMX, NELEMY, the number of quadrilaterals along the
%    X and Y directions.  The number of elements generated will be
%    NELEMX * NELEMY for quadrilaterals, or 2 * NELEMX * NELEMY for
%    triangles.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the nodes 
%    that form each element.
%
  if ( s_eqi ( code, 'Q4' ) )
    element_node = grid_q4_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q8' ) )
    element_node = grid_q8_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q9' ) )
    element_node = grid_q9_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q12' ) )
    element_node = grid_q12_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q16' ) )
    element_node = grid_q16_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'QL' ) )
    element_node = grid_ql_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T3' ) )
    element_node = grid_t3_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T4' ) )
    element_node = grid_t4_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T6' ) )
    element_node = grid_t6_element ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T10' ) )
    element_node = grid_t10_element ( nelemx, nelemy );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_ELEMENT - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE = %s\n', code );
    error ( 'GRID_ELEMENT - Fatal error!' );

  end

  return
end
