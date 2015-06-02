function cp_values_test ( )

%*****************************************************************************80
%
%% CP_VALUES_TEST demonstrates the use of CP_VALUES.
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
  fprintf ( 1, 'CP_VALUES_TEST:\n' );
  fprintf ( 1, '  CP_VALUES stores values of\n' );
  fprintf ( 1, '  the specific heat CP\n' );
  fprintf ( 1, '  as a function of temperature and pressure.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T            P            CP(T,P)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, tc, p, cp ] = cp_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', tc, p, cp );

  end

  return
end
