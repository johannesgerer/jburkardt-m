function hermite_cubic_test14 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST14 tests HERMITE_CUBIC_SPLINE_QUAD_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST14:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_SPLINE_QUAD_RULE returns a quadrature rule\n' );
  fprintf ( 1, '  for Hermite cubic splines.\n' );

  for k = 1 : 2

    fprintf ( 1, '\n' );
    if ( k == 1 )
      fprintf ( 1, '  Case 1: Random spacing\n' );

      seed = 123456789;
      [ r, seed ] = r8vec_uniform_01 ( n, seed );

      x(1) = r(1);
      for i = 2 : n
        x(i) = x(i-1) + r(i);
      end
    elseif ( k == 2 )
      fprintf ( 1, '  Case 2: Uniform spacing\n' );
      fprintf ( 1, '  F(2:N-1) have equal weight.\n' );
      fprintf ( 1, '  D(2:N-1) have zero weight.\n' );
      x = linspace ( 1.0, 2.0, 11 );
    end

    w = hermite_cubic_spline_quad_rule ( n, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '   I   J        X         W                Q\n' );
    fprintf ( 1, '\n' );

    for i = 1 : 2

      for j = 1 : n

        fn(1,1:n) = 0.0;
        dn(1,1:n) = 0.0;

        if ( i == 1 )
          fn(j) = 1.0;
        else
          dn(j) = 1.0;
        end

        q = hermite_cubic_spline_integral ( n, x, fn, dn );

        fprintf ( 1, '  %2d  %2d  %10f  %14f  %14f\n', i, j, x(j), w(i,j), q );

      end

    end

  end

  return
end
