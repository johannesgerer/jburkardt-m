function quadrule_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests BDFC_SET and BDF_SUM.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  BDFC_SET sets Backward Difference Corrector quadrature;\n' );
  fprintf ( 1, '  BDF_SUM carries it out.\n' );
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

        [ xtab, weight ] = bdfc_set ( norder );

        result(i) = bdf_sum ( @func, norder, xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
