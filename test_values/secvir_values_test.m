function secvir_values_test ( )

%*****************************************************************************80
%
%% SECVIR_VALUES_TEST demonstrates the use of SECVIR_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SECVIR_VALUES_TEST:\n' );
  fprintf ( 1, '  SECVIR_VALUES stores values of\n' );
  fprintf ( 1, '  the second virial coefficient of water\n' );
  fprintf ( 1, '  as a function of temperature.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T            VIR(T)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, tc, vir ] = secvir_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', tc, vir );

  end

  return
end
