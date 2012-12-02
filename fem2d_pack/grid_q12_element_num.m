function element_num = grid_q12_element_num ( nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_Q12_ELEMENT_NUM counts the elements in a grid of 12 node quadrilaterals.
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
%    20 June 2005
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
  element_num = nelemx * nelemy;

  return
end
