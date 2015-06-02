function polygon_properties_test07 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST07 tests POLYGON_EXPAND;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 May 2014
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
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST07\n' );
  fprintf ( 1, '  For a polygon:\n' );
  fprintf ( 1, '  POLYGON_EXPAND "expands" it by an amount H.\n' );

  h = 0.5;

  r8mat_transpose_print ( 2, n, v, '  The polygon vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The expansion amount H = %g\n', h );

  w = polygon_expand ( n, v, h );

  r8mat_transpose_print ( 2, n, w, '  The expanded polygon:' );

  return
end
