function sound_values_test ( )

%*****************************************************************************80
%
%% SOUND_VALUES_TEST demonstrates the use of SOUND_VALUES.
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
  fprintf ( 1, 'SOUND_VALUES_TEST:\n' );
  fprintf ( 1, '  SOUND_VALUES stores values of \n' );
  fprintf ( 1, '  the speed of sound in water \n' );
  fprintf ( 1, '  as a function of temperature and pressure.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      T            P            C(T,P)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, tc, p, c ] = sound_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', tc, p, c );

  end

  return
end
