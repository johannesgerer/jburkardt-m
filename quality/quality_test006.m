function test006 ( n, z, triangle_num, triangle_node )

%*****************************************************************************80
%
%% TEST006 tests AREA_MEASURE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2008
%
%  Author:
%
%    John Burkardt
%
  triangle_order = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST006\n' );
  fprintf ( 1, '  AREA_MEASURE computes the AREA measure of quality.\n' );

  fprintf ( 1, '  The area ratio measure        AREA = %14f\n', ...
    area_measure ( n, z, triangle_order, triangle_num, triangle_node ) );

  return
end
