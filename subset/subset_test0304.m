function subset_test0304 ( )

%*****************************************************************************80
%
%% TEST0304 tests FROBENIUS_NUMBER_ORDER2 and FROBENIUS_NUMBER_ORDER2_VALUES.
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
  fprintf ( 1, 'TEST0304\n' );
  fprintf ( 1, ...
    '  FROBENIUS_NUMBER_ORDER2 computes Frobenius numbers of order 2.\n' );
  fprintf ( 1,'  FROBENIUS_NUMBER_ORDER2_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        C1        C1   exact F  comput F\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, c1, c2, f1 ] = frobenius_number_order2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    f2 = frobenius_number_order2 ( c1, c2 );

    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', c1, c2, f1, f2 );

  end

  return
end
