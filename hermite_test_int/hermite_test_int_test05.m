function hermite_test_int_test05 ( )

%*****************************************************************************80
%
%% HERMITE_TEST_INT_TEST05 tests P00_GAUSS_HERMITE against the polynomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST_INT_TEST05\n' );
  fprintf ( 1, '  P00_GAUSS_HERMITE applies a Gauss-Hermite rule to\n' );
  fprintf ( 1, '  estimate the integral x^m exp(-x*x) over (-oo,+oo).\n' );

  problem = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '         M     Order      Estimate        Exact           Error\n' );
  for m = 0 : 6

    p06_param ( 'S', 'M', m );

    exact = p00_exact ( problem );

    fprintf ( 1, '\n' );

    for order = 1 : 3 + floor ( m / 2 )

      estimate = p00_gauss_hermite ( problem, order );

      error = abs ( exact - estimate );

      fprintf ( 1, '  %8d  %8d  %14f  %14f  %14f\n', ...
        m, order, estimate, exact, error );

    end

  end

  return
end
