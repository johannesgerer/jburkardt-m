function exactness_test085 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST085 tests Gauss-Chebyshev3 rules for the Chebyshev1 integral.
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
  fprintf ( 1, 'EXACTNESS_TEST085\n' );
  fprintf ( 1, '  Test Gauss-Chebyshev3 rules for the Chebyshev1 integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1/sqrt(1-x^2).\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '  Exactness: 2*N-3.\n' );

  for n = 1 : 5

    [ x, w ] = chebyshev3_set ( n );
    if ( n == 1 )
      p_max = 2 * n;
    else
      p_max = 2 * n - 2;
    end
    chebyshev1_exactness ( n, x, w, p_max );

  end

  return
end
