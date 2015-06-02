function exactness_test08 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST08 tests Gauss-Chebyshev1 rules for the Chebyshev1 integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXACTNESS_TEST08\n' );
  fprintf ( 1, '  Test Gauss-Chebyshev1 rules for the Chebyshev1 integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1/sqrt(1-x^2).\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '  Exactness: 2*N-1.\n' );

  for n = 1 : 5

    [ x, w ] = chebyshev1_set ( n );
    p_max = 2 * n;
    chebyshev1_exactness ( n, x, w, p_max );

  end

  return
end
