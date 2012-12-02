function quadrule_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests CHEBYSHEV3_COMPUTE and SUMMER.
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
  order_max = 6;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  a = - 1.0;
  b =   1.0;
  nsub = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  CHEBYSHEV3_COMPUTE sets up Gauss-Chebyshev type 3 quadrature,\n' );
  fprintf ( 1, '  SUMMER carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integration interval is [%f, %f]\n', a, b );
  fprintf ( 1, '  Number of subintervals is %d\n', nsub );
  fprintf ( 1, '  Quadrature order will vary.\n' );
  fprintf ( 1, '  Integrand will vary.\n' );
  fprintf ( 1, '  The weight function is 1 / sqrt ( 1 - X**2 )\n' );
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

    for order = 2 : order_max

      fprintf ( 1, '  %2d', order );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = chebyshev3_compute ( order );

        result(i) = summer ( @func, order, xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
