function element_num = sphere_grid_t3_element_num ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_T3_ELEMENT_NUM counts the elements in a T3 sphere grid.
%
%  Example:
%
%    Input:
%
%      NELEMX = 6, NELEMY = 4
%
%    Output:
%
%      ELEMENT_NUM = 2 * NELEMX * ( NELEMY - 1 ) = 36
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
%    Input, integer NELEMX, NELEMY, the number of elements along the
%    X and Y directions. 
%
%    Output, integer ELEMENT_NUM, the number of elements in the grid.
%
  element_num = 2 * nelemx * ( nelemy - 1 );

  return
end
