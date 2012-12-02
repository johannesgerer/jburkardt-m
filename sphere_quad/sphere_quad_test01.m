function sphere_quad_test01 ( )

%*****************************************************************************80
%
%% SPHERE_QUAD_TEST01 tests SPHERE01_QUAD_LL*.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 September 2010
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_QUAD_TEST01\n' );
  fprintf ( 1, '  Approximate the integral of a function on the unit sphere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SPHERE01_QUAD_MC uses a Monte Carlo method.\n' );
  fprintf ( 1, '  SPHERE01_QUAD_LLC uses centroids of spherical triangles.\n' );
  fprintf ( 1, '  SPHERE01_QUAD_LLV uses vertices of spherical triangles.\n' );
  fprintf ( 1, '  SPHERE01_QUAD_LLM uses midsides of spherical triangles.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1,'  H              QUAD_MC       QUAD_LLC      QUAD_LLV      QUAD_LLM         EXACT\n' );

  for i = 0 : 17

    if ( i == 0 )
      e(1:3) = [ 0, 0, 0 ];
    elseif ( i == 1 )
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

    if ( i == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'Point counts per method:\n' );
    else
      polyterm_exponent ( 'PRINT', e )
    end

    for h_test = 1 : 3

      if ( h_test == 1 )
        h = 1.0;
      elseif (  h_test == 2 )
        h = 0.1;
      elseif (  h_test == 3 )
        h = 0.01;
      end

      n_mc = sphere01_quad_mc_size ( h );

      result_mc = sphere01_quad_mc ( @polyterm_value_3d, h, seed, n_mc );

      result_llc = sphere01_quad_llc ( @polyterm_value_3d, h, n_llc );

      result_llv = sphere01_quad_llv ( @polyterm_value_3d, h, n_llv );

      result_llm = sphere01_quad_llm ( @polyterm_value_3d, h, n_llm );

      exact = sphere01_monomial_integral ( e );

      if ( i == 0 )
        fprintf ( 1, '%14f%14d%14d%14d%14d\n', h, n_mc, n_llc, n_llv, n_llm );
      else
        fprintf ( 1, '%14f%14f%14f%14f%14f%14f\n', ...
          h, result_mc, result_llc, result_llv, result_llm, exact );
      end

    end

  end

  return
end
