function test_values_test109 ( )

%*****************************************************************************80
%
%% TEST109 demonstrates the use of MOEBIUS_VALUES.
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
  fprintf ( 1, 'TEST109:\n' );
  fprintf ( 1, '  MOEBIUS_VALUES returns values of \n' );
  fprintf ( 1, '  the Moebius function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         MU(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = moebius_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n', n, fn );

  end

  return
end
