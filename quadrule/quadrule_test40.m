function quadrule_test40 ( )

%*****************************************************************************80
%
%% TEST40 tests NCO_COMPUTE and SUM_SUB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 October 2005
%
%  Author:
%
%    John Burkardt
%
  order_max = 9;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  a = 0.0;
  b = 1.0;

  nsub = 1;
  xlo = -1.0;
  xhi = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST40\n' );
  fprintf ( 1, '  NCO_COMPUTE sets up an open Newton-Cotes rule;\n' );
  fprintf ( 1, '  SUM_SUB carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integration interval is [%f, %f]\n', a, b );
  fprintf ( 1, '  Number of subintervals is %d\n', nsub );
  fprintf ( 1, '  Quadrature order will vary.\n' );
  fprintf ( 1, '  Integrand will vary.\n' );
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

    for n = 1 : order_max

      if ( n == 8 )
        continue
      end

      fprintf ( 1, '  %2d', n );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ x, w ] = nco_compute ( n );

        result(i) = sum_sub ( @func, a, b, nsub, n, xlo, xhi, x, w );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
