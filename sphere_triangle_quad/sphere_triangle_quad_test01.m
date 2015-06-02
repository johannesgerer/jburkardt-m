function sphere_triangle_test01 ( )

%*****************************************************************************80
%
%% SPHERE_TRIANGLE_TEST01 tests SPHERE01_TRIANGLE_QUAD_01, 02, 03.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2014
%
%  Author:
%
%    John Burkardt
%
  e_test = [ ...
    0, 0, 0; ...
    1, 0, 0; ...
    0, 1, 0; ...
    0, 0, 1; ...
    2, 0, 0; ...
    0, 2, 2; ...
    2, 2, 2; ...
    0, 2, 4; ...
    0, 0, 6; ...
    1, 2, 4; ...
    2, 4, 2; ...
    6, 2, 0; ...
    0, 0, 8; ...
    6, 0, 4; ...
    4, 6, 2; ...
    2, 4, 8; ...
   16, 0, 0 ]';

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Approximate an integral on a random spherical triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUAD_01 uses centroids of spherical triangles.\n' );
  fprintf ( 1, '  QUAD_02 uses vertices of spherical triangles.\n' );
  fprintf ( 1, '  QUAD_03 uses midsides of spherical triangles.\n' );
%
%  Choose three points at random to define a spherical triangle.
%
  [ v1, seed ] = sphere01_sample ( 1, seed );
  [ v2, seed ] = sphere01_sample ( 1, seed );
  [ v3, seed ] = sphere01_sample ( 1, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vertices of random spherical triangle:\n' );
  fprintf ( 1, '\n' );
  r8vec_transpose_print ( 3, v1, '  V1:' );
  r8vec_transpose_print ( 3, v2, '  V2:' );
  r8vec_transpose_print ( 3, v3, '  V3:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUAD_01      QUAD_02      QUAD_03\n' );

  for j = 1 : 17

    e(1:3) = e_test(1:3,j);

    e = polyterm_exponent ( 'SET', e );

    polyterm_exponent ( 'PRINT', e );

    result_01 = sphere01_triangle_quad_01 ( v1, v2, v3, @polyterm_value_3d );

    result_02 = sphere01_triangle_quad_02 ( v1, v2, v3, @polyterm_value_3d );

    result_03 = sphere01_triangle_quad_03 ( v1, v2, v3, @polyterm_value_3d );

    fprintf ( 1, '  %14.6g  %14.6g  %14.6g\n', result_01, result_02, result_03 );

  end

  return
end
