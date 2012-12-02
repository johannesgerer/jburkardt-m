function quadrule_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests LAGUERRE_EK_COMPUTE and LAGUERRE_SUM.
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
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  LAGUERRE_EK_COMPUTE computes a Gauss-Laguerre rule;\n' );
  fprintf ( 1, '  LAGUERRE_SUM carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature order will vary.\n' );
  fprintf ( 1, '  Integrand will vary.\n' );
  fprintf ( 1, '  The weight function is EXP ( - X ).\n' );
  fprintf ( 1, '\n' );

  a = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is [ %f, +oo ).\n', a );
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

        [ xtab, weight ] = laguerre_ek_compute ( norder );

        result(i) = laguerre_sum ( @func, a, norder, xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
