function cn_jac_test ( n, alpha, beta, expon )

%*****************************************************************************80
%
%% CN_JAC_TEST tests the rules for CN with Jacobi weight on a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  ALPHA = %f\n', alpha  );
  fprintf ( 1, '  BETA =  %f\n', beta );
  fprintf ( 1, '  EXPON = ' );
  for d = 1 : n
    fprintf ( 1, '  %2d', expon(d) );
  end
  fprintf ( 1, '\n' );
  d = sum ( expon(1:n) );
  fprintf ( 1, '  Degree = %d\n', d );
  fprintf ( 1, '\n' );

  exact = cn_jac_monomial_integral ( n, alpha, beta, expon );

  p = 0;

  if ( d <= p )

    [ o, x, w ] = cn_jac_00_1 ( n, alpha, beta );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  CN_JAC_00_1:    %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  p = 1;

  if ( d <= p )

    [ o, x, w ] = cn_jac_01_1 ( n, alpha, beta );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  CN_JAC_01_1:    %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  p = 2;

  if ( d <= p )

    [ o, x, w ] = cn_jac_02_xiu ( n, alpha, beta );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  CN_JAC_02_XIU:  %6d  %14.6g  %14.6e\n', o, quad, err );

    gamma0 = ( alpha + beta + 2.0 ) / 2.0;
    delta0 = ( alpha - beta ) / 2.0;
    c1 = 2.0 * ( alpha + 1.0 ) * ( beta + 1.0 ) / ( alpha + beta + 3.0 ) ...
      / ( alpha + beta + 2.0 );
    volume_1d = 2.0 ^ ( alpha + beta + 1.0 ) * gamma ( alpha + 1.0 ) ...
      * gamma ( beta + 1.0 ) / ( alpha + beta + 1.0 ) / gamma ( alpha + beta + 1.0 );
    [ o, x, w ] = gw_02_xiu ( n, gamma0, delta0, c1, volume_1d );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  GW_02_XIU:      %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  fprintf ( 1, '  EXACT:                  %14.6g\n', exact );

  return
end
