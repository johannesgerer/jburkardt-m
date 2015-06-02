function quadrule_test096 ( )

%*****************************************************************************80
%
%% QUADRULE_TEST096 tests HERMITE_GK**_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_TEST096\n' );
  fprintf ( 1, '  HERMITE_GK**_SET sets up a nested rule\n' );
  fprintf ( 1, '  for the Hermite integration problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is ( -oo, +oo ).\n' );
  fprintf ( 1, '  The weight function is exp ( - x * x )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE_INTEGRAL determines the exact value of\n' );
  fprintf ( 1, '  the integal when f(x) = x^m.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we just test the highest order rule.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE_GK16_SET:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M         N       Estimate       Exact            Error\n' );
  fprintf ( 1, '\n' );

  n = 35;
  p = 51;

  [ x, w ] = hermite_gk16_set ( n );

  for m = 0 : 2 : min ( p + 2, 20 )

    exact = hermite_integral ( m );

    if ( m == 0 )
      f = ones ( n, 1 );
    else
      f = zeros ( n, 1 );
      f = x.^m;
    end

    estimate = w(1:n)' * f(1:n);

    error = abs ( exact - estimate );

    fprintf ( 1, '  %8d  %8d  %14.6e  %14.6e  %14.6e\n', ...
      m, n, estimate, exact, error );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE_GK18_SET:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M         N       Estimate       Exact            Error\n' );
  fprintf ( 1, '\n' );

  n = 37;
  p = 55;

  [ x, w ] = hermite_gk18_set ( n );

  for m = 0 : 2 : min ( p + 2, 20 )

    exact = hermite_integral ( m );

    if ( m == 0 )
      f = ones ( n, 1 );
    else
      f = zeros ( n, 1 );
      f = x.^m;
    end

    estimate = w(1:n)' * f(1:n);

    error = abs ( exact - estimate );

    fprintf ( 1, '  %8d  %8d  %14.6e  %14.6e  %14.6e\n', ...
      m, n, estimate, exact, error );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE_GK22_SET:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M         N       Estimate       Exact            Error\n' );
  fprintf ( 1, '\n' );

  n = 41;
  p = 63;

  [ x, w ] = hermite_gk22_set ( n );

  for m = 0 : 2 : min ( p + 2, 20 )

    exact = hermite_integral ( m );

    if ( m == 0 )
      f = ones ( n, 1 );
    else
      f = zeros ( n, 1 );
      f = x.^m;
    end

    estimate = w(1:n)' * f(1:n);

    error = abs ( exact - estimate );

    fprintf ( 1, '  %8d  %8d  %14.6e  %14.6e  %14.6e\n', ...
      m, n, estimate, exact, error );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE_GK24_SET:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M         N       Estimate       Exact            Error\n' );
  fprintf ( 1, '\n' );

  n = 43;
  p = 67;

  [ x, w ] = hermite_gk24_set ( n );

  for m = 0 : 2 : min ( p + 2, 20 )

    exact = hermite_integral ( m );

    if ( m == 0 )
      f = ones ( n, 1 );
    else
      f = zeros ( n, 1 );
      f = x.^m;
    end

    estimate = w(1:n)' * f(1:n);

    error = abs ( exact - estimate );

    fprintf ( 1, '  %8d  %8d  %14.6e  %14.6e  %14.6e\n', ...
      m, n, estimate, exact, error );

  end

  return
end
