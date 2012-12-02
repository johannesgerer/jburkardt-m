function quadrule_test36 ( )

%*****************************************************************************80
%
%% TEST36 tests MOULTON_SET and SUMMER.
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
  order_max = 10;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST36\n' );
  fprintf ( 1, '  MOULTON_SET sets up Adams-Moulton quadrature;\n' );
  fprintf ( 1, '  SUMMER carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integration interval is [0,1].\n' );
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

        [ xtab, weight ] = moulton_set ( norder );

        result(i) = summer ( @func, norder, xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
