function quadrule_test095 ( )

%*****************************************************************************80
%
%% QUADRULE_TEST095 tests HERMITE_GK16_SET and SUMMER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2010
%
%  Author:
%
%    John Burkardt
%
  l_max = 8;

  n_list = [ 1, 3, 7, 9, 17, 19, 31, 33, 35 ]';
  p_list = [ 1, 5, 7, 15, 17, 29, 31, 33, 51 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUADRULE_TEST095\n' );
  fprintf ( 1, '  HERMITE_GK16_SET sets up a nested rule\n' );
  fprintf ( 1, '  for the Hermite integration problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is ( -oo, +oo ).\n' );
  fprintf ( 1, '  The weight function is exp ( - x * x )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE_INTEGRAL determines the exact value of\n' );
  fprintf ( 1, '  the integal when f(x) = x^m.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M         N       Estimate       Exact            Error\n' );

  for l = 0 : l_max

    fprintf ( 1, '\n' );

    n = n_list(l+1);
    p = p_list(l+1);

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

  end

  return
end
