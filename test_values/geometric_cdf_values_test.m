function geometric_cdf_values_test ( )

%*****************************************************************************80
%
%% GEOMETRIC_CDF_VALUES_TEST demonstrates the use of GEOMETRIC_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMETRIC_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  GEOMETRIC_CDF_VALUES stores values of \n' );
  fprintf ( 1, '  the Geometric Probability Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X      P       CDF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, p, cdf ] = geometric_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %8f  %24.16f\n', x, p, cdf );

  end

  return
end
