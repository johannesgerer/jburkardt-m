function hole_point = p09_hole_point ( hole_index, m )

%*****************************************************************************80
%
%% P09_HOLE_POINT returns a point inside a given hole in problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer HOLE_INDEX, the index of the hole.
%
%    Input, integer M, the spatial dimension.
%
%    Output, real HOLE_POINT(M), a point in the hole
%
  center2 = [ 0.25, 0.75 ];
  center3 = [ 0.60, 0.40 ];

  if ( hole_index == 1 )
    hole_point(1:2) = center2(1:2);
  elseif ( hole_index == 2 )
    hole_point(1:2) = center3(1:2);
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P09_HOLE_POINT - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of HOLE_INDEX = %d\n', hole_index );
    fprintf ( 1, '  Legal values are 1 or 2.\n' );
    error ( 'P09_HOLE_POINT - Fatal error!' );
  end

  return
end
