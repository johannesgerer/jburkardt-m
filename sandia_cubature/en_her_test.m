function en_her_test ( n, expon )

%*****************************************************************************80
%
%% EN_HER_TEST tests the Stroud EN_HER rules on a monomial.
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
  fprintf ( 1, '  N = %d\n', n )
  fprintf ( 1, '  EXPON = ' );
  for d = 1 : n
    fprintf ( 1, '  %2d', expon(d) );
  end
  fprintf ( 1, '\n' );
  d = sum ( expon );
  fprintf ( 1, '  Degree = %d\n', d );
  fprintf ( 1, '\n' );

  exact = en_her_monomial_integral ( n, expon );

  p = 1;

  if ( d <= p )

    [ o, x, w ] = en_her_01_1 ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_01_1:    %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  p = 2;

  if ( d <= p )

    [ o, x, w ] = en_her_02_xiu ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_02_XIU:  %6d  %14.6g  %14.6e\n', o, quad, err );

    gamma0 = 2.0;
    delta0 = 0.0;
    c1 = 1.0;
    volume_1d = sqrt ( pi );
    [ o, x, w ] = gw_02_xiu ( n, gamma0, delta0, c1, volume_1d );
    v = monomial_value ( n, o, x, expon );
    quad = w' * v';
    err = abs ( quad - exact );
    fprintf ( 1, '  GW_02_XIU:      %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  p = 3;

  if ( d <= p )

    [ o, x, w ] = en_her_03_1 ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_03_1:    %6d  %14.6g  %14.6e\n', o, quad, err );

    [ o, x, w ] = en_her_03_2 ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_03_2:    %6d  %14.6g  %14.6e\n', o, quad, err );
  
    [ o, x, w ] = en_her_03_xiu ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_03_XIU:  %6d  %14.6g  %14.6e\n', o, quad, err );

  end

  p = 5;

  if ( d <= p )

    if ( 2 <= n && n <= 7 )
      option = 1;
      [ o, x, w ] = en_her_05_1 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_05_1(1): %6d  %14.6g  %14.6e\n', o, quad, err );

      if ( n == 3 || n == 5 || n == 6 )
        option = 2;
        [ o, x, w ] = en_her_05_1 ( n, option );
        quad = w' * ( monomial_value ( n, o, x, expon ) )';
        err = abs ( quad - exact );
        fprintf ( 1, '  EN_HER_05_1(2): %6d  %14.6g  %14.6e\n', o, quad, err );
      end

    end

    [ o, x, w ] = en_her_05_2 ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_05_2:    %6d  %14.6g  %14.6e\n', o, quad, err );

    if ( 3 <= n )
      [ o, x, w ] = en_her_05_3 ( n );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_05_3:    %6d  %14.6g  %14.6e\n', o, quad, err );
    end

    [ o, x, w ] = en_her_05_4 ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_05_4:    %6d  %14.6g  %14.6e\n', o, quad, err );

    [ o, x, w ] = en_her_05_5 ( n );
    quad = w' * ( monomial_value ( n, o, x, expon ) )';
    err = abs ( quad - exact );
    fprintf ( 1, '  EN_HER_05_5:    %6d  %14.6g  %14.6e\n', o, quad, err );

    if ( 5 <= n )
      [ o, x, w ] = en_her_05_6 ( n );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_05_6:    %6d  %14.6g  %14.6e\n', o, quad, err );
    end

  end

  p = 7;

  if ( d <= p )

    if ( n == 3 || n == 4 || n == 6 || n == 7 )
      option = 1;
      [ o, x, w ] = en_her_07_1 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_07_1(1): %6d  %14.6g  %14.6e\n', o, quad, err );
    end

    if ( n == 3 || n == 4 )
      option = 2;
      [ o, x, w ] = en_her_07_1 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_07_1(2): %6d  %14.6g  %14.6e\n', o, quad, err );
    end

    if ( 3 <= n )
     [ o, x, w ] = en_her_07_2 ( n );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_07_2:    %6d  %14.6g  %14.6e\n', o, quad, err );
    end

    if ( 3 <= n && n <= 6 )
      option = 1;
      [ o, x, w ] = en_her_07_3 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_07_3(1): %6d  %14.6g  %14.6e\n', o, quad, err );

      option = 2;
      [ o, x, w ] = en_her_07_3 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_07_3(2): %6d  %14.6g  %14.6e\n', o, quad, err );
    end

  end

  p = 9;

  if ( d <= p )

    if ( 3 <= n && n <= 6 )
      option = 1;
      [ o, x, w ] = en_her_09_1 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_09_1(1): %6d  %14.6g  %14.6e\n', o, quad, err );

      option = 2;
      [ o, x, w ] = en_her_09_1 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_09_1(2): %6d  %14.6g  %14.6e\n', o, quad, err );
    end

  end

  p = 11;

  if ( d <= p )

    if ( 3 <= n && n <= 5 )
      option = 1;
      [ o, x, w ] = en_her_11_1 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_11_1(1): %6d  %14.6g  %14.6e\n', o, quad, err );

      option = 2;
      [ o, x, w ] = en_her_11_1 ( n, option );
      quad = w' * ( monomial_value ( n, o, x, expon ) )';
      err = abs ( quad - exact );
      fprintf ( 1, '  EN_HER_11_1(2): %6d  %14.6g  %14.6e\n', o, quad, err );
    end

  end

  fprintf ( 1, '  EXACT:                  %14.6g\n', exact );

  return
end
