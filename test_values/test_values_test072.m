function test_values_test072 ( )

%*****************************************************************************80
%
%% TEST072 demonstrates the use of F_CDF_VALUES.
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
  fprintf ( 1, 'TEST072:\n' );
  fprintf ( 1, '  F_CDF_VALUES stores values of\n' );
  fprintf ( 1, '  the F cumulative density function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A            B            X            F_CDF(A,B)(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = f_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %24.16f\n', a, b, x, fx );

  end

  return
end
