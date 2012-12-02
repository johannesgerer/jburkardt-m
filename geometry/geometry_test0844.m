function geometry_test0844 ()

%*****************************************************************************80
%
%% TEST0844 tests POLYLINE_POINTS_ND.
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
  dim_num = 2;
  nk = 4;
  nt = 13;

  pk = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 2.0 ]';
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0844\n' );
  fprintf ( 1, '  POLYLINE_POINTS_ND computes points on a polyline.\n' );
  fprintf ( 1, '\n' );

  r8mat_transpose_print ( dim_num, nk, pk, '  The defining points:' );

  pt = polyline_points_nd ( dim_num, nk, pk, nt );
 
  r8mat_transpose_print ( dim_num, nt, pt, '  The computed points:' );

  return
end
