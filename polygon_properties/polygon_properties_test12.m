function polygon_properties_test12 ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST12 tests POLYGON_SAMPLE.
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
  addpath ( '../polygon_triangulate' );

  n = 20;
  nv = 6;
  v = [ ...
    0.0, 0.0; ...
    2.0, 0.0; ...
    2.0, 1.0; ...
    1.0, 1.0; ...
    1.0, 2.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST12\n' );
  fprintf ( 1, '  POLYGON_SAMPLE samples a polygon.\n' );

  seed = 123456789;

  [ x, seed ] = polygon_sample ( nv, v, n, seed );

  r8mat_transpose_print ( 2, n, x, '  Sample points:' );

  rmpath ( '../polygon_triangulate' );

  return
end

