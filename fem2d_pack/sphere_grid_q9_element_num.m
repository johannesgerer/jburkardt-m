function element_num = sphere_grid_q9_element_num ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_Q9_ELEMENT_NUM counts the elements in a Q9 sphere grid.
%
%  Example:
%
%    Input:
%
%      NELEMX = 3, NELEMY = 2
%
%    Output:
%
%      ELEMENT_NUM = NELEMX * NELEMY = 6
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
  element_num = nelemx * nelemy;

  return
end
