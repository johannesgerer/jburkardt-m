function quadrule_test35 ( )

%*****************************************************************************80
%
%% TEST35 tests LOBATTO_SET and SUM_SUB.
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

  a = -1.0;
  b =  1.0;

  nsub = 1;
  xlo = -1.0;
  xhi = +1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST35\n' );
  fprintf ( 1, '  LOBATTO_SET sets up Lobatto quadrature;\n' );
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

    for norder = 2 : order_max

      fprintf ( 1, '  %2d', norder );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = lobatto_set ( norder );

        result(i) = sum_sub ( @func, a, b, nsub, norder, xlo, xhi, ...
          xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
