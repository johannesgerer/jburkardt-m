function quadrule_test27 ( )

%*****************************************************************************80
%
%% TEST27 tests LEGENDRE_SET_LOG and SUM_SUB.
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
  test_num = 9;

  norder_test = [ 1, 2, 3, 4, 5, 6, 7, 8, 16 ];

  a = 0.0;
  b = 1.0;

  nsub = 1;

  xlo = 0.0;
  xhi = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST27\n' );
  fprintf ( 1, '  LEGENDRE_SET_LOG sets up Gauss-Legendre quadrature\n' );
  fprintf ( 1, '    over [0,1] with weight function -LOG(X);\n' );
  fprintf ( 1, '  SUM_SUB carries it out.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is [%f, %f]\n', a, b );
  fprintf ( 1, '  Number of subintervals is %d\n', nsub );
  fprintf ( 1, '  Quadrature order will vary.\n' );
  fprintf ( 1, '  Integrand will vary.\n' );

  nfunc = func_set ( 'COUNT', 'DUMMY' );

  for ilo = 1 : 5 : nfunc

    ihi = min ( ilo + 4, nfunc );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    ' );
    for i = ilo : ihi
      fprintf ( '%14s', fname(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for test = 1 : test_num

      norder = norder_test(test);

      fprintf ( 1, '  %2d', norder );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = legendre_set_log ( norder );

        result(i) = sum_sub ( @func, a, b, nsub, norder,  xlo, xhi, xtab, ...
          weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
