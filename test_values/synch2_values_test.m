function synch2_values_test ( )

%*****************************************************************************80
%
%% SYNCH2_VALUES_TEST demonstrates the use of SYNCH2_VALUES.
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
  fprintf ( 1, 'SYNCH2_VALUES_TEST:\n' );
  fprintf ( 1, '  SYNCH2_VALUES stores values of\n' );
  fprintf ( 1, '  the synchrotron function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X               FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = synch2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
