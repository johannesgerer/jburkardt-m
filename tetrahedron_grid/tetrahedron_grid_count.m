function ng = tetrahedron_grid_count ( n )

%*****************************************************************************80
%
%% TETRAHEDRON_GRID_COUNT counts the grid points inside a tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Output, integer NG, the number of grid points.
%
  ng = ( ( n + 1 ) * ( n + 2 ) * ( n + 3 ) ) / 6;

  return
end
