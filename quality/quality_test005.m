function test005 ( n, z, triangle_num, triangle_node )

%*****************************************************************************80
%
%% TEST005 tests ALPHA_MEASURE.
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
  fprintf ( 1, 'TEST005\n' );
  fprintf ( 1, '  ALPHA_MEASURE computes the ALPHA measure of quality.\n' );

  fprintf ( 1, '  The minimum angle measure    ALPHA = %14f\n', ...
    alpha_measure ( n, z, triangle_order, triangle_num, triangle_node ) );

  return
end
