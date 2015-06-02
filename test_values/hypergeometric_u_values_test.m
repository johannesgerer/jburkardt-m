function hypergeometric_u_values_test ( )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_U_VALUES_TEST demonstrates the use of HYPERGEOMETRIC_U_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERGEOMETRIC_U_VALUES_TEST:\n' );
  fprintf ( 1, '  HYPERGEOMETRIC_U_VALUES stores values of \n' );
  fprintf ( 1, '  the hypergeometric U function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A      B     X     HyperU(A,B,C,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = hypergeometric_u_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8f  %8f  %8f  %24.16g\n', a, b, x, fx );

  end

  return
end
