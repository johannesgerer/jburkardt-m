function geometry_test1835 ( )

%*****************************************************************************80
%
%% TEST1835 tests SPHERE_EXP2IMP_3D, SPHERE_IMP2EXP_3D.
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

  r = 3.0;

  center(1:dim_num) = [ 1.0, 2.0, 3.0 ];
%
%  Define 4 points on the sphere, for the explicit tests.
%
  p1(1:dim_num) = [ center(1) + r, center(2),     center(3) ];
  p2(1:dim_num) = [ center(1),     center(2) + r, center(3) ];
  p3(1:dim_num) = [ center(1),     center(2),     center(3) + r ];
  p4(1:dim_num) = [ center(1) - r, center(2),     center(3) ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1835\n' );
  fprintf ( 1, '  SPHERE_EXP2IMP_3D: explicit sphere => implicit form;\n' );
  fprintf ( 1, '  SPHERE_IMP2EXP_3D: implicit sphere => explicit form.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial form of explicit sphere:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p4(1:dim_num) );

  [ r, center ] = sphere_exp2imp_3d ( p1, p2, p3, p4 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed form of implicit sphere:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Imputed radius = %f\n', r );

  r8vec_print ( dim_num, center, '  Imputed center' );

  [ p1, p2, p3, p4 ] = sphere_imp2exp_3d ( r, center );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed form of explicit sphere:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p4(1:dim_num) );

  return
end
