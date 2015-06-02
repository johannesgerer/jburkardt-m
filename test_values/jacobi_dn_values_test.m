function jacobi_dn_values_test ( )

%*****************************************************************************80
%
%% JACOBI_DN_VALUES_TEST demonstrates the use of JACOBI_DN_VALUES.
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
  fprintf ( 1, 'JACOBI_DN_VALUES_TEST:\n' );
  fprintf ( 1, '  JACOBI_DN_VALUES returns values of\n' );
  fprintf ( 1, '  the Jacobi elliptic DN function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        A           X               DN(A,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = jacobi_dn_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n',  a, x, fx );

  end

  return
end
