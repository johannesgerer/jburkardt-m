function quadrule_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests HERMITE_EK_COMPUTE and SUMMER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2011
%
%  Author:
%
%    John Burkardt
%
  order_max = 20;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  HERMITE_EK_COMPUTE computes a Gauss-Hermite rule;\n' );
  fprintf ( 1, '  SUMMER carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is ( -oo, +oo ).\n' );

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

        [ xtab, weight ] = hermite_ek_compute ( norder );

        result(i) = summer ( @func, norder, xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
