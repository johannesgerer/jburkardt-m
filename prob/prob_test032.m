function prob_test032 ( )

%*****************************************************************************80
%
%% TEST032 tests CHI_SQUARE_CDF, CHI_SQUARE_CDF_VALUES.
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
  fprintf ( 1, 'TEST032:\n' );
  fprintf ( 1, '  CHI_SQUARE_CDF evaluates the cumulative\n' );
  fprintf ( 1, '    distribution function for the chi-square central\n' );
  fprintf ( 1, '    probability density function.\n' );
  fprintf ( 1, '  CHI_SQUARE_CDF_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A    X       Exact F     CHI_SQUARE_CDF(A,X)\n' );
  fprintf ( 1, '\n' );
  
  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = chi_square_cdf_values ( n_data );

    if ( n_data == 0 );
      break
    end

    fx2 = chi_square_cdf ( x, a );

    fprintf ( 1, '  %4d  %8f  %14f  %14f\n', a, x, fx, fx2 );

  end

  return
end
