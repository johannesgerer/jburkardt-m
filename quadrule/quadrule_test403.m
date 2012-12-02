function quadrule_test403 ( )

%*****************************************************************************80
%
%% TEST403 tests PATTERSON_SET and SUM_SUB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 April 2007
%
%  Author:
%
%    John Burkardt
%
  level_max = 7;

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  a = 0.0;
  b = 1.0;

  nsub = 1;
  xlo = -1.0;
  xhi = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST403\n' );
  fprintf ( 1, '  PATTERSON_SET sets up a Patterson rule;\n' );
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
    fprintf ( 1, '     ' );
    for i = ilo : ihi
      fprintf ( '%14s', fname(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for level = 1 : level_max

      order = 2^level - 1;

      fprintf ( 1, '  %3d', order );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = patterson_set ( order );

        result(i) = sum_sub ( @func, a, b, nsub, order, xlo, xhi, xtab, ...
          weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
