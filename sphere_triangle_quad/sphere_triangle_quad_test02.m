function sphere_triangle_quad_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests SPHERE01_TRIANGLE_QUAD_00.
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
  n_mc1 = 1000;
  n_mc2 = 10000;
  n_mc3 = 100000;

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  Approximate an integral on a random spherical triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUAD_MC1 uses a Monte Carlo method with %d points.\n', n_mc1 );
  fprintf ( 1, '  QUAD_MC2 uses a Monte Carlo method with %d points.\n', n_mc2 );
  fprintf ( 1, '  QUAD_MC3 uses a Monte Carlo method with %d points.\n', n_mc3 );
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
  fprintf ( 1, '  QUAD_MC1      QUAD_MC2      QUAD_MC3\n' );

  for j = 1 : 17

    e(1:3) = e_test(1:3,j);

    e = polyterm_exponent ( 'SET', e );

    polyterm_exponent ( 'PRINT', e );

    [ result_mc1, seed ] = sphere01_triangle_quad_00 ( n_mc1, v1, v2, v3, ...
      @polyterm_value_3d, seed );
    [ result_mc2, seed ] = sphere01_triangle_quad_00 ( n_mc2, v1, v2, v3, ...
      @polyterm_value_3d, seed );
    [ result_mc3, seed ] = sphere01_triangle_quad_00 ( n_mc3, v1, v2, v3, ...
      @polyterm_value_3d, seed );

    fprintf ( 1, '  %14.6g  %14.6g  %14.6g\n', ...
      result_mc1, result_mc2, result_mc3 );

  end

  return
end
