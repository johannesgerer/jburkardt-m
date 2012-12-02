function geometry_test058 ( )

%*****************************************************************************80
%
%% TEST058 tests PLANE_IMP_POINT_DIST_3D, PLANE_IMP_POINT_DIST_SIGNED_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  ntest = 4;
%
%  This is the plane Z = 10.
%
  a =    0.0;
  b =    0.0;
  c =    1.0;
  d = - 10.0;

  ptest(1:dim_num,1:ntest) = [ ...
    -12.0, 14.0,  0.0; ...
      7.0,  8.0,  9.0; ...
      1.0,  2.0, 10.0; ...
      0.0,  0.0, 12.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST058\n' );
  fprintf ( 1, '  PLANE_IMP_POINT_DIST_3D computes the distance\n' );
  fprintf ( 1, '    between an implicit plane and a point in 3D;\n' );
  fprintf ( 1, '  PLANE_IMP_POINT_DIST_SIGNED 3D computes the\n' );
  fprintf ( 1, '    signed distance between an implicit plane\n' );
  fprintf ( 1, '    and a point in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For all tests, we use the implicit plane with\n' );
  fprintf ( 1, '  (A,B,C,D) = %f  %f  %f  %f\n', a, b, c, d );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (X,Y,Z)  DISTANCE   SIGNED_DISTANCE\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1:dim_num) = ptest(1:dim_num,i);

    dist = plane_imp_point_dist_3d ( a, b, c, d, p );

    dist_signed = plane_imp_point_dist_signed_3d ( a, b, c, d, p );

    fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f\n', p(1:dim_num), dist, dist_signed );

  end

  return
end
