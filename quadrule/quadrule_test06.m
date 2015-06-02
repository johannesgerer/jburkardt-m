function quadrule_test06 ( )

%*****************************************************************************80
%
%% QUADRULE_TEST06 tests CHEBYSHEV2_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 October 2009
%
%  Author:
%
%    John Burkardt
%
  order_max = 4;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  a = - 1.0;
  b =   1.0;
  nsub = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_TEST06\n' );
  fprintf ( 1, '  CHEBYSHEV2_COMPUTE sets up Gauss-Chebyshev type 2 quadrature;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integration interval is [%f, %f]\n', a, b );
  fprintf ( 1, '  Number of subintervals is %d\n', nsub );
  fprintf ( 1, '  Quadrature order will vary.\n' );
  fprintf ( 1, '  Integrand will vary.\n' );
  fprintf ( 1, '  The weight function is sqrt ( 1 - X**2 )\n' );
  fprintf ( 1, '\n' );

  for ilo = 1 : 5 : nfunc

    ihi = min ( ilo + 4, nfunc );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    ' );
    for i = ilo : ihi
      fprintf ( '%14s', fname(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for order = 1 : order_max

      fprintf ( 1, '  %2d', order );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = chebyshev2_compute ( order );

        result = 0.0;
        for j = 1 : order
          result = result + weight(j) * func ( xtab(j) );
        end

        fprintf ( 1, '  %12f', result );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
