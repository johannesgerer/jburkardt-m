function bivariate_normal_cdf_values_test ( )

%*****************************************************************************80
%
%% BIVARIATE_NORMAL_CDF_VALUES_TEST tests BIVARIATE_NORMAL_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BIVARIATE_NORMAL_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  BIVARIATE_NORMAL_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the bivariate normal CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            Y            R            F(R)(X,Y)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

     [ n_data, x, y, r, fxy ] = bivariate_normal_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', x, y, r, fxy );

  end

  return
end
