function quadrule_test09 ( )

%*****************************************************************************80
%
%% QUADRULE_TEST09 tests HERMITE_SET.
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
  order_max = 20;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_TEST09\n' );
  fprintf ( 1, '  HERMITE_SET sets up Gauss-Hermite quadrature;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is ( -oo, +oo ).\n' );
  fprintf ( 1, '  The weight function is exp ( - x * x ).\n' );
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

        [ xtab, weight ] = hermite_set ( norder );

        result = 0.0;
        for j = 1 : norder
          result = result + weight(j) * func ( xtab(j) );
        end

        fprintf ( 1, '  %12f', result );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
