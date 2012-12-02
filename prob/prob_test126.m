function prob_test126 ( )

%*****************************************************************************80
%
%% TEST126 tests POISSON_CDF, POISSON_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST126:\n' );
  fprintf ( 1, '  POISSON_CDF evaluates the cumulative distribution\n' );
  fprintf ( 1, '    function for the discrete Poisson probability\n' );
  fprintf ( 1, '    density function.\n' );
  fprintf ( 1, '  POISSON_CDF_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A is the expected mean number of successes per unit time;\n' );
  fprintf ( 1, '  X is the number of successes;\n' );
  fprintf ( 1, '  POISSON_CDF is the probability of having up to X\n' );
  fprintf ( 1, '  successes in unit time.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   A          X   Exact F     POISSON_CDF(A,X)\n' );
  fprintf ( 1, '\n' );
  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = poisson_cdf_values ( n_data );

    if ( n_data == 0 );
      break
    end

    fx2 = poisson_cdf ( x, a );

    fprintf ( 1, '  %8f  %8d  %14f  %14f\n', a, x, fx, fx2 );

  end

  return
end
