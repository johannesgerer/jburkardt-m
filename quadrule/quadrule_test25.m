function quadrule_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests LEGENDRE_SET_SQRTX2_01.
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

  a = 0.0;
  b = 1.0;

  nsub = 1;

  xlo = 0.0;
  xhi = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  LEGENDRE_SET_SQRTX2_01 sets up Gauss-Legendre\n' );
  fprintf ( 1, '  quadrature over [0,1] with weight function 1/SQRT(X);\n' );
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

    for iexp = 0 : 3

      norder = 2^iexp;

      fprintf ( 1, '  %2d', norder );

      for i = ilo : ihi

        func_set ( 'SET', i );

        [ xtab, weight ] = legendre_set_sqrtx2_01 ( norder );

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
