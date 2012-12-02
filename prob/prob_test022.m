function prob_test022 ( )

%*****************************************************************************80
%
%% TEST022 tests BINOMIAL_COEF, BINOMIAL_COEF_LOG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST022\n' );
  fprintf ( 1, '  BINOMIAL_COEF evaluates binomial coefficients.\n' );
  fprintf ( 1, '  BINOMIAL_COEF_LOG evaluates the logarithm.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    N     K       C(N,K)\n' );
  fprintf ( 1, '\n' );

  for n = 0 : 4
    for k = 0 : n
      cnk1 = binomial_coef ( n, k );
      cnk2_log = binomial_coef_log ( n, k );
      cnk2 = exp ( cnk2_log );
      fprintf ( 1, '  %6d  %6d  %6d  %14f\n', n, k, cnk1, cnk2 );
    end
  end

  return
end
