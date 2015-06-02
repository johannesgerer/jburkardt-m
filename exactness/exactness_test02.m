function exactness_test02 ( )

%*****************************************************************************80
%
%% EXACTNESS_TEST02 tests Fejer Type 2 rules for Legendre integrals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXACTNESS_TEST02\n' );
  fprintf ( 1, '  Test Fejer Type 2 rules on Legendre integrals.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -1 <= x <= +1.\n' );
  fprintf ( 1, '  Exactness: N   for N odd,\n' );
  fprintf ( 1, '             N-1 for N even.\n' );

  for n = 1 : 5

    [ x, w ] = fejer2_set ( n );
    if ( mod ( n, 2 ) == 1 )
      p_max = n + 1;
    else
      p_max = n;
    end
    legendre_exactness ( n, x, w, p_max );

  end

  return
end
