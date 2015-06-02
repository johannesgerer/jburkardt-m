function poisson_cdf_values_test ( )

%*****************************************************************************80
%
%% POISSON_CDF_VALUES_TEST demonstrates the use of POISSON_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  POISSON_CDF_VALUES returns values of\n' );
  fprintf ( 1, '  the Poisson Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A     X       POISSON_CDF(A,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = poisson_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8f  %4d  %24.16f\n', a, x, fx );

  end

  return
end
