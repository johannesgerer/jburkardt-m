function stroud_test30 ( )

%*****************************************************************************80
%
%% TEST30 tests SPHERE_UNIT_**_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_3D_INDEX;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST30\n' );
  fprintf ( 1, '  For integrals on the unit sphere in 3D:\n' );
  fprintf ( 1, '  SPHERE_UNIT_07_3D uses a formula of degree 7.\n' );
  fprintf ( 1, '  SPHERE_UNIT_11_3D uses a formula of degree 11.\n' );
  fprintf ( 1, '  SPHERE_UNIT_14_3D uses a formula of degree 14.\n' );
  fprintf ( 1, '  SPHERE_UNIT_15_3D uses a formula of degree 15.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Unit sphere area = %f\n', sphere_unit_area_nd ( 3 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '    F(X)    S3S07        S3S11         S3S14         S3S15\n' );
  fprintf ( 1, '\n' );
 
  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    result1 = sphere_unit_07_3d ( 'function_3d' ); 
    result2 = sphere_unit_11_3d ( 'function_3d' );
    result3 = sphere_unit_14_3d ( 'function_3d' );
    result4 = sphere_unit_15_3d ( 'function_3d' );

    fname = function_3d_name ( i );

    fprintf ( 1, '  %s  %12f  %12f  %12f  %12f\n', ...
      fname, result1, result2, result3, result4 );

  end

  return
end
