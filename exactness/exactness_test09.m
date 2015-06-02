function exactness_test09 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST09 tests Gauss-Chebyshev2 rules for the Chebyshev2 integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXACTNESS_TEST09\n' );
  fprintf ( 1, '  Test Gauss-Chebyshev2 rules for the Chebyshev2 integral.\n' );
  fprintf ( 1, '  Density function rho(x) = sqrt(1-x^2).\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '  Exactness: 2*N-1.\n' );

  for n = 1 : 5

    [ x, w ] = chebyshev2_set ( n );
    p_max = 2 * n;
    chebyshev2_exactness ( n, x, w, p_max );

  end

  return
end
