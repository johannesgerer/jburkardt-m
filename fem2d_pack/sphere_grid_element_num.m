function element_num = sphere_grid_element_num ( code, nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_ELEMENT_NUM returns the number of elements in a sphere grid.
%
%  Discussion:
%
%    The number of elements generated will be NELEMX * NELEMY for
%    quadrilaterals, or 2 * NELEMX * ( NELEMY - 1 ) for triangles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string CODE, identifies the element desired.
%    Legal values include 'Q4', 'Q9', 'Q16', 'T3', 'T6'.
%
%    Input, integer NELEMX, NELEMY, the number of quadrilaterals along the
%    X and Y directions.  
%
%    Output, integer ELEMENT_NUM, the number of elements in the grid.
%
  if ( s_eqi ( code, 'Q4' ) )
    element_num = sphere_grid_q4_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q9' ) )
    element_num = sphere_grid_q9_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q16' ) )
    element_num = sphere_grid_q16_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T3' ) )
    element_num = sphere_grid_t3_element_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T6' ) )
    element_num = sphere_grid_t6_element_num ( nelemx, nelemy );
  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_GRID_ELEMENT_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE = "%s"\n', code );
    element_num = -1;
    error ( 'SPHERE_GRID_ELEMENT_NUM - Fatal error!' );

  end

  return
end
