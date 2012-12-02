function test_values_test155 ( )

%*****************************************************************************80
%
%% TEST155 demonstrates the use of TSAT_VALUES.
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
  fprintf ( 1, 'TEST155:\n' );
  fprintf ( 1, '  TSAT_VALUES stores values of\n' );
  fprintf ( 1, '  the saturation temperature\n' );
  fprintf ( 1, '  as a function of pressure.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      P           Tsat(P)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, p, tc ] = tsat_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', p, tc );

  end

  return
end
