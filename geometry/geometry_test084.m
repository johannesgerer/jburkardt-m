function geometry_test084 ()

%*****************************************************************************80
%
%% TEST084 tests POLYLINE_INDEX_POINT_ND, POLYLINE_ARCLENGTH_ND.
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
  dim_num = 2;

  p = [ ...
    0.0, 0.0; ...
    1.0, 1.0; ...
    2.0, 0.0; ...
    0.0, 0.0 ]';

  t = 2.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST084\n' );
  fprintf ( 1, '  POLYLINE_INDEX_POINT_ND finds a point on a \n' );
  fprintf ( 1, '    polyline with given arclength.\n' );
  fprintf ( 1, '  POLYLINE_ARCLENGTH_ND computes the arclength \n' );
  fprintf ( 1, '    of the polyline, and its nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The line we examine is defined by these points:\n' );
%
%  The call to POLYLINE_ARCLENGTH_ND is just to help us believe the final result.
%
  s = polyline_arclength_nd ( dim_num, n, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           P              Arclength(X,Y)\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    for i = 1 : dim_num 
      fprintf ( 1, '  %12f', p(i,j) );
    end
    fprintf ( 1, '  %12f\n', s(j) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We search for the point with coordinate %f\n', t );
 
  pt = polyline_index_point_nd ( dim_num, n, p, t );

  r8vec_print ( dim_num, pt, '  The computed point:' );

  return
end
