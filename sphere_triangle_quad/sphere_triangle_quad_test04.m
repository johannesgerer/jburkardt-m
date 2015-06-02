function sphere_triangle_quad_test04 ( )

%*****************************************************************************80
%
%% SPHERE_TRIANGLE_TEST04 tests SPHERE01_TRIANGLE_QUAD_ICOS1M.
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
  fprintf ( 1, 'SPHERE_TRIANGLE_QUAD_TEST04\n' );
  fprintf ( 1, '  SPHERE01_TRIANGLE_QUAD_ICOS1M approximates the\n' );
  fprintf ( 1, '  integral of a function over a spherical triangle on\n' );
  fprintf ( 1, '  the surface of the unit sphere using a midpoint rule.\n' );
  fprintf ( 1, '\n' ); 
  fprintf ( 1, '  We do not have an exact result, so we compare each\n' );
  fprintf ( 1, '  estimate to the final one.\n' );
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
  fprintf ( 1, '  FACTOR   N   RESULT\n' );

  for j = 1 : 17

    e(1:3) = e_test(1:3,j);

    e = polyterm_exponent ( 'SET', e );

    polyterm_exponent ( 'PRINT', e );

%   factor = 2 ^ 11;
    factor = 2 ^ 7;
    [ best, node_num ] = sphere01_triangle_quad_icos1m ( v1, v2, v3, factor, ...
      @polyterm_value_3d );

    factor = 1;
    for factor_log = 0 : 5

      [ result, node_num ] = sphere01_triangle_quad_icos1m ( v1, v2, v3, ...
        factor, @polyterm_value_3d );

      error = abs ( result - best );

      fprintf ( 1, '  %4d  %8d  %16.8g  %10.2e\n', ...
        factor, node_num, result, error );

      factor = factor * 2;

    end

  end

  return
end
