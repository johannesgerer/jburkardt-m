function geometry_test0801 ()

%*****************************************************************************80
%
%% TEST0801 tests POLYGON_EXPAND_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  v = [ ...
    1.0, 1.0; ...
    5.0, 1.0; ...
    2.0, 4.0; ...
    1.0, 3.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0801\n' );
  fprintf ( 1, '  For a polygon in 2D:\n' );
  fprintf ( 1, '  POLYGON_EXPAND_2D "expands" it by an amount H.\n' );

  h = 0.5;

  r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The expansion amount H = %f\n', h );

  w = polygon_expand_2d ( n, v, h );

  r8mat_transpose_print ( 2, n, w, '  The expanded polygon:' );

  return
end
