function test_values_test073 ( )

%*****************************************************************************80
%
%% TEST073 demonstrates the use of F_NONCENTRAL_CDF_VALUES.
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
  fprintf ( 1, 'TEST073:\n' );
  fprintf ( 1, '  F_NONCENTRAL_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the F cumulative density function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A     B      LAMBDA    X            F_CDF(A,B)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, lambda, x, fx ] = f_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fprintf ( 1, '%6d  %4d  %8f  %12f  %24.16e\n', a, b, lambda, x, fx );

  end

  return
end
