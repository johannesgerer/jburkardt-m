function test_values_test157 ( )

%*****************************************************************************80
%
%% TEST157 demonstrates the use of VISCOSITY_VALUES.
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
  fprintf ( 1, 'TEST157:\n' );
  fprintf ( 1, '  VISCOSITY_VALUES stores values of \n' );
  fprintf ( 1, '  the viscosity of water \n' );
  fprintf ( 1, '  as a function of temperature and pressure.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T            P            ETA(T,P)\n' );
  fprintf ( 1, '\n' ); 

  n_data = 0;

  while ( 1 )

    [ n_data, tc, p, eta ] = viscosity_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', tc, p, eta );

  end

  return
end
