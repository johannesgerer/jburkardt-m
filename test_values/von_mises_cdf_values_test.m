function von_mises_cdf_values_test ( )

%*****************************************************************************80
%
%% VON_MISES_CDF_VALUES_TEST demonstrates the use of VON_MISES_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VON_MISES_CDF_VALUES_TEST:\n' );
  fprintf ( 1, '  VON_MISES_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the von Mises CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A          B        X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = von_mises_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', a, b, x, fx );

  end

  return
end
