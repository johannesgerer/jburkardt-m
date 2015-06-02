function frobenius_number_data_values_test ( )

%*****************************************************************************80
%
%% FROBENIUS_NUMBER_DATA_VALUES_TEST tests FROBENIUS_NUMBER_DATA_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FROBENIUS_NUMBER_DATA_VALUES_TEST:\n' );
  fprintf ( 1, '  FROBENIUS_NUMBER_DATA_VALUES returns the corresponding\n' );
  fprintf ( 1, '  coin denominations.\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, order ] = frobenius_number_order_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ c, f ] = frobenius_number_data_values ( n_data, order );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order = %d\n', order );
    for i = 1 : order
      fprintf ( 1, '  %8d', c(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Frobenius number = %d\n', f );

  end

  return
end
