function element_num = grid_t4_element_num ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_T4_ELEMENT_NUM counts the elements in a grid of 4 node triangles.
%
%  Example:
%
%    Input:
%
%      NELEMX = 3, NELEMY = 2
%
%    Output:
%
%      ELEMENT_NUM = 2 * NELEMX * NELEMY = 12
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
%    Input, integer NELEMX, NELEMY, the number of elements along the
%    X and Y directions.  The number of elements generated will be
%    NELEMX * NELEMY.
%
%    Output, integer ELEMENT_NUM, the number of elements in the grid.
%
  element_num = 2 * nelemx * nelemy;

  return
end
