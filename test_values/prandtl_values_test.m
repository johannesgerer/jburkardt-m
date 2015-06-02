function prandtl_values_test ( )

%*****************************************************************************80
%
%% PRANDTL_VALUES_TEST demonstrates the use of PRANDTL_VALUES.
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
  fprintf ( 1, 'PRANDTL_VALUES_TEST:\n' );
  fprintf ( 1, '  PRANDTL_VALUES stores values of\n' );
  fprintf ( 1, '  the Prandtl number of water\n' );
  fprintf ( 1, '  as a function of temperature and pressure.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T            P            Pr(T,P)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, tc, p, pr ] = prandtl_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', tc, p, pr );

  end

  return
end
