function epn_glg_test ( n, expon, alpha )

%*****************************************************************************80
%
%% EPN_GLG_TEST tests the rules for EPN with GLG weight on a monomial.
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
  fprintf ( 1, '  ALPHA = %f\n', alpha );
  fprintf ( 1, '  EXPON = ' );
  for d = 1 : n
    fprintf ( 1, '  %2d', expon(d) );
  end
  fprintf ( 1, '\n' );
  d = sum ( expon(1:n) );
  fprintf ( 1, '  Degree = %d\n', d );
  fprintf ( 1, '\n' );

  exact = epn_glg_monomial_integral ( n, expon, alpha );

  p = 0;

  if ( d <= p )
    [ o, x, w ] = epn_glg_00_1 ( n, alpha );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  EPN_GLG_00_1:   %6d  %14.6g  %14.6e\n', o, quad, err );
  end

  p = 1;

  if ( d <= p )
    [ o, x, w ] = epn_glg_01_1 ( n, alpha );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  EPN_GLG_01_1:   %6d  %14.6g  %14.6e\n', o, quad, err );
  end

  p = 2;

  if ( d <= p )

    [ o, x, w ] = epn_glg_02_xiu ( n, alpha );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  EPN_GLG_02_XIU: %6d  %14.6g  %14.6e\n', o, quad, err );

    gamma0 = - 1.0;
    delta0 = alpha + 1.0;
    c1 = - alpha - 1.0;
    volume_1d = gamma ( 1.0 + alpha );
    [ o, x, w ] = gw_02_xiu ( n, gamma0, delta0, c1, volume_1d );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  GW_02_XIU:      %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  fprintf ( 1, '  EXACT:                  %14.6g\n', exact );

  return
end
