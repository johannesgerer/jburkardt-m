function sphere_quad_test02 ( )

%*****************************************************************************80
%
%% SPHERE_QUAD_TEST02 tests SPHERE01_QUAD_ICOS1C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_QUAD_TEST02\n' );
  fprintf ( 1, '  Approximate the integral of a function on the unit sphere.\n' );
  fprintf ( 1, '  SPHERE01_QUAD_ICOS1C uses centroids of spherical triangles.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FACTOR         N        QUAD          EXACT         ERROR\n' );

  for i = 1 : 17

    if ( i == 1 )
      e(1:3) = [ 0, 0, 0 ];
    elseif ( i == 2 )
      e(1:3) = [ 1, 0, 0 ];
    elseif ( i == 3 )
      e(1:3) = [ 0, 1, 0 ];
    elseif ( i == 4 )
      e(1:3) = [ 0, 0, 1 ];
    elseif ( i == 5 )
      e(1:3) = [ 2, 0, 0 ];
    elseif ( i == 6 )
      e(1:3) = [ 0, 2, 2 ];
    elseif ( i == 7 )
      e(1:3) = [ 2, 2, 2 ];
    elseif ( i == 8 )
      e(1:3) = [ 0, 2, 4 ];
    elseif ( i == 9 )
      e(1:3) = [ 0, 0, 6 ];
    elseif ( i == 10 )
      e(1:3) = [ 1, 2, 4 ];
    elseif ( i == 11 )
      e(1:3) = [ 2, 4, 2 ];
    elseif ( i == 12 )
      e(1:3) = [ 6, 2, 0 ];
    elseif ( i == 13 )
      e(1:3) = [ 0, 0, 8 ];
    elseif ( i == 14 )
      e(1:3) = [ 6, 0, 4 ];
    elseif ( i == 15 )
      e(1:3) = [ 4, 6, 2 ];
    elseif ( i == 16 )
      e(1:3) = [ 2, 4, 8 ];
    elseif ( i == 17 )
      e(1:3) = [ 16, 0, 0 ];
    end

    polyterm_exponent ( 'SET', e );

    polyterm_exponent ( 'PRINT', e );

    factor = 1;

    for factor_log = 0 : 5

      [ result, n ] = sphere01_quad_icos1c ( factor, @polyterm_value_3d );

      exact = sphere01_monomial_integral ( e );

      error = abs ( exact - result );

      fprintf ( 1, '  %4d  %8d  %14f  %14f  %14f\n', ...
        factor, n, result, exact, error );

      factor = factor * 2;

    end

  end

  return
end
