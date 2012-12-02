function quadrule_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests LEGENDRE_SET_COS and SUM_SUB.
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

  a = -0.5 * pi;
  b = +0.5 * pi;

  nsub = 1;

  xlo = -0.5 * pi;
  xhi = +0.5 * pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  LEGENDRE_SET_COS sets up Gauss-Legendre quadrature\n' );
  fprintf ( 1, '    over [-PI/2,PI/2] with weight function COS(X);\n' );
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

    for iexp = 0 : 4

      norder = 2^iexp;

      fprintf ( 1, '  %2d', norder );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = legendre_set_cos ( norder );

        result(i) = sum_sub ( @func, a, b, nsub, norder, xlo, xhi, ...
          xtab, weight );

        fprintf ( 1, '  %12f', result(i) );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
