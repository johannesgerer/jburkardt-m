function epn_lag_test ( n, expon )

%*****************************************************************************80
%
%% EPN_LAG_TEST tests the rules for EPN with Laguerre weight on a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  EXPON = ' );
  for d = 1 : n
    fprintf ( 1, '  %2d', expon(d) );
  end
  fprintf ( 1, '\n' );
  d = sum ( expon(1:n) );
  fprintf ( 1, '  Degree = %d\n', d );
  fprintf ( 1, '\n' );

  exact = epn_lag_monomial_integral ( n, expon );

  p = 0;

  if ( d <= p )
    [ o, x, w ] = epn_lag_00_1 ( n );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  EPN_LAG_00_1:   %6d  %14.6g  %14.6e\n', o, quad, err );
  end

  p = 1;

  if ( d <= p )
    [ o, x, w ] = epn_lag_01_1 ( n );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  EPN_LAG_01_1:   %6d  %14.6g  %14.6e\n', o, quad, err );
  end

  p = 2;

  if ( d <= p )

    [ o, x, w ] = epn_lag_02_xiu ( n );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  EPN_LAG_02_XIU: %6d  %14.6g  %14.6e\n', o, quad, err );

    gamma0 = - 1.0;
    delta0 = 1.0;
    c1 = - 1.0;
    volume_1d =  1.0;
    [ o, x, w ] = gw_02_xiu ( n, gamma0, delta0, c1, volume_1d );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  GW_02_XIU:      %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  fprintf ( 1, '  EXACT:                  %14.6g\n', exact );

  return
end
