function cn_leg_test ( n, expon )

%*****************************************************************************80
%
%% CN_LEG_TEST tests the rules for CN with Legendre weight on a monomial.
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

  exact = cn_leg_monomial_integral ( n, expon );

  p = 1;

  if ( d <= p )
    [ o, x, w ] = cn_leg_01_1 ( n );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  CN_LEG_01_1:    %6d  %14.6g  %14.6e\n', o, quad, err );
  end

  p = 2;

  if ( d <= p )

    [ o, x, w ] = cn_leg_02_xiu ( n );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  CN_LEG_02_XIU:  %6d  %14.6g  %14.6e\n', o, quad, err );

    gamma0 = 1.0;
    delta0 = 0.0;
    c1 = 1.0 / 3.0;
    volume_1d = 2.0;
    [ o, x, w ] = gw_02_xiu ( n, gamma0, delta0, c1, volume_1d );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  GW_02_XIU:      %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  p = 3;

  if ( d <= p )

    [ o, x, w ] = cn_leg_03_1 ( n );
    v = monomial_value ( n, o, x, expon );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  CN_LEG_03_1:    %6d  %14.6g  %14.6e\n', o, quad, err );

    [ o, x, w ] = cn_leg_03_xiu ( n );
    v = monomial_value ( n, o, x, expon );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  CN_LEG_03_XIU:  %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  p = 5;

  if ( d <= p )

    if ( 4 <= n && n <= 6 )
      option = 1;
      [ o, x, w ] = cn_leg_05_1 ( n, option );
      v = monomial_value ( n, o, x, expon );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  CN_LEG_05_1(1): %6d  %14.6g  %14.6e\n', o, quad, err );
    end

    if ( 4 <= n && n <= 5 )
      option = 2;
      [ o, x, w ] = cn_leg_05_1 ( n, option );
      v = monomial_value ( n, o, x, expon );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  CN_LEG_05_1(2): %6d  %14.6g  %14.6e\n', o, quad, err );
    end

    if ( 2 <= n )
      [ o, x, w ] = cn_leg_05_2 ( n );
      v = monomial_value ( n, o, x, expon );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  CN_LEG_05_2:    %6d  %14.6g  %14.6e\n', o, quad, err );
    end

  end

  fprintf ( 1, '  EXACT:                  %14.6g\n', exact );

  return
end
