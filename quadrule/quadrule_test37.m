function quadrule_test37 ( )

%*****************************************************************************80
%
%% TEST37 tests NCC_SET and SUM_SUB.
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
  order_max = 21;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  a = 0.0;
  b = 1.0;

  nsub = 1;

  xlo = -1.0;
  xhi = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST37\n' );
  fprintf ( 1, '  NCC_SET sets up a closed Newton Cotes rule;\n' );
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

    for norder = 1 : order_max

      fprintf ( 1, '  %2d', norder );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = ncc_set ( norder );

        result(i) = sum_sub ( @func, a, b, nsub, norder, xlo, xhi, ...
          xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
