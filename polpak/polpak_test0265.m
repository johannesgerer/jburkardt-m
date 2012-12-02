function polpak_test0265 ( )

%*****************************************************************************80
%
%% TEST0265 tests EULER_NUMBER2, EULER_NUMBER_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0265\n' );
  fprintf ( 1, '  EULER_NUMBER2 computes Euler numbers.\n' );
  fprintf ( 1, '  EULER_NUMBER_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N  exact   EULER_NUMBER2\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c1 ] = euler_number_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = euler_number2 ( n );

    fprintf ( 1, '  %2d  %10d  %12f\n', n, c1, c2 );

  end

  return
end
