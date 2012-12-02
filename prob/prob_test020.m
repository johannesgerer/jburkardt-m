function prob_test020 ( )

%*****************************************************************************80
%
%% TEST020 tests BINOMIAL_CDF BINOMIAL_CDF_VALUES.
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
  fprintf ( 1, 'TEST020:\n' );
  fprintf ( 1, '  BINOMIAL_CDF evaluates the cumulative distribution\n' );
  fprintf ( 1, '    function for the discrete binomial probability\n' );
  fprintf ( 1, '    density function.\n' );
  fprintf ( 1, '  BINOMIAL_CDF_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A is the number of trials;\n' );
  fprintf ( 1, '  B is the probability of success on one trial;\n' );
  fprintf ( 1, '  X is the number of successes;\n' );
  fprintf ( 1, '  BINOMIAL_CDF is the probability of having up to X\n' );
  fprintf ( 1, '  successes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A     B         X   Exact F     BINOMIAL_CDF(A,B,X)\n' );
  fprintf ( 1, '\n' );
  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = binomial_cdf_values ( n_data );

    if ( n_data == 0 );
      break
    end

    fx2 = binomial_cdf ( x, a, b );

    fprintf ( 1, '  %8f  %8f  %8f  %14f  %14f\n', a, b, x, fx, fx2 );

  end

  return
end
