function test_values_test094 ( )

%*****************************************************************************80
%
%% TEST094 demonstrates the use of JACOBI_SN_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST094:\n' );
  fprintf ( 1, '  JACOBI_SN_VALUES returns values of\n' );
  fprintf ( 1, '  the Jacobi elliptic SN function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        A           X               SN(A,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = jacobi_sn_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n',  a, x, fx );

  end

  return
end
