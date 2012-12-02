function triangulation_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests POINTS_HULL_2D.
%
%  Diagram:
%
%    !....3.......
%    !............
%    !..9.........
%    !.....5......
%    !...........6
%    !.4.2...10...
%    !.....8......
%    !.........12.
%    !..7.........
%    !......1.....
%    !............
%    !............
%    !-----------
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
  node_num = 12;
  dim_num = 2;

  node_xy = [ ...
       7.0,  3.0; ...
       4.0,  7.0; ...
       5.0, 13.0; ...
       2.0,  7.0; ...
       6.0,  9.0; ...
      12.0,  8.0; ...
       3.0,  4.0; ...
       6.0,  6.0; ...
       3.0, 10.0; ...
       8.0,  7.0; ...
       5.0, 13.0; ...
      10.0,  6.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  POINTS_HULL_2D computes the convex hull\n' );
  fprintf ( 1, '    of a set of nodes.\n' );

  r8mat_transpose_print ( dim_num, node_num, node_xy, '  The nodes:' );

  [ nval, ival ] = points_hull_2d ( node_num, node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The convex hull is formed by connecting:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : nval
    fprintf ( 1, '  %3d  %3d', j, ival(j) );
    for i = 1 : dim_num 
      fprintf ( 1, '  %14f', node_xy(i,ival(j)) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The correct sequence of nodes is:\n' );
  fprintf ( 1, '  4, 9, 3, 6, 12, 1, 7, (4).\n' );

  return
end
