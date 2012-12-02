function test_values_test146 ( )

%*****************************************************************************80
%
%% TEST146 demonstrates the use of THERCON_VALUES.
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
  fprintf ( 1, 'TEST146:\n' );
  fprintf ( 1, '  THERCON_VALUES stores values of\n' );
  fprintf ( 1, '  the thermal conductivity of water\n' );
  fprintf ( 1, '  as a function of temperature and pressure.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T            P            LAMBDA(T,P)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, tc, p, lambda ] = thercon_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', tc, p, lambda );

  end

  return
end
