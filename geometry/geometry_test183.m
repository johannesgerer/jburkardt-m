function geometry_test183 ( )

%*****************************************************************************80
%
%% TEST183 tests SPHERE_EXP_POINT_NEAR_3D, SPHERE_IMP_POINT_NEAR_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  ntest = 4;

  r = 3.0;

  center(1:dim_num) = [ 1.0, 2.0, 3.0 ];
%
%  Define 4 points on the sphere, for the explicit tests.
%
  p1(1:dim_num) = [ center(1) + r, center(2),     center(3) ];
  p2(1:dim_num) = [ center(1),     center(2) + r, center(3) ];
  p3(1:dim_num) = [ center(1),     center(2),     center(3) + r ];
  p4(1:dim_num) = [ center(1) - r, center(2),     center(3) ];
%
%  Set the test points.
%
  ptest(1:dim_num,1:ntest) = [ ...
    center(1),           center(2),           center(3); ...
    center(1) + 2.0 * r, center(2),           center(3); ...
    center(1),           center(2) + r,       center(3); ...
    center(1) + 0.5 * r, center(2) + 0.5 * r, center(3) + 0.5 * r ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST183\n' );
  fprintf ( 1, '  SPHERE_EXP_POINT_NEAR_3D determines if a\n' );
  fprintf ( 1, '    point is within an explicit sphere;\n' );
  fprintf ( 1, '  SPHERE_IMP_POINT_NEAR_3D determines if a\n' );
  fprintf ( 1, '    point is within an implicit sphere;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sphere radius %f\n', r );

  r8vec_print ( dim_num, center, '  Sphere center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_EXP_POINT_NEAR_3D:\n' );
  fprintf ( 1, '    P, PN\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1:dim_num) = ptest(1:dim_num,i);

    pn = sphere_exp_point_near_3d ( p1, p2, p3, p4, p );

    fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', p(1:dim_num), pn(1:dim_num) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SPHERE_IMP_POINT_NEAR_3D:\n' );
  fprintf ( 1, '    P, PN\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1:dim_num) = ptest(1:dim_num,i);

    pn = sphere_imp_point_near_3d ( r, center, p );

    fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', p(1:dim_num), pn(1:dim_num) );

  end

  return
end
