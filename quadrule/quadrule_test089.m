function quadrule_test089 ( )

%*****************************************************************************80
%
%% QUADRULE_TEST089 tests HERMITE_PROBABILIST_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 June 2013
%
%  Author:
%
%    John Burkardt
%
  order_max = 10;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_TEST089\n' );
  fprintf ( 1, ...
    '  HERMITE_PROBABILIST_SET sets Hermite probabilist quadrature;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is ( -oo, +oo ).\n' );
  fprintf ( 1, ...
    '  The weight function is exp ( - x * x / 2 ) / sqrt ( 2 * pi ).\n' );
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

        [ xtab, weight ] = hermite_probabilist_set ( norder );

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
