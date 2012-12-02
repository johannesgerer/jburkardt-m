function test_values_test0755 ( )

%*****************************************************************************80
%
%% TEST0755 demonstrates the use of FROBENIUS_NUMBER_ORDER2_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0755:\n' );
  fprintf ( 1, '  FROBENIUS_NUMBER_ORDER2_VALUES returns values of\n' );
  fprintf ( 1, '  the Frobenius number of order 2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         C1        C2          F(C1,C2)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, c1, c2, f ] = frobenius_number_order2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8d  %8d  %8d\n', c1, c2, f );

  end

  return
end
