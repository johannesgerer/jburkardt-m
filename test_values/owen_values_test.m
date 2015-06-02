function owen_values_test ( )

%*****************************************************************************80
%
%% OWEN_VALUES_TEST demonstrates the use of OWEN_VALUES.
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
  fprintf ( 1, 'OWEN_VALUES_TEST:\n' );
  fprintf ( 1, '  OWEN_VALUES stores values of\n' );
  fprintf ( 1, '  the Owen T function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           H             A             T\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, h, a, t ] = owen_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n',  h, a, t );

  end

  return
end
