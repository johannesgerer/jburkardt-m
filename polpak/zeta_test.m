function zeta_test ( )

%*****************************************************************************80
%
%% ZETA_TEST tests ZETA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 October 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZETA_TEST\n' );
  fprintf ( 1, '  ZETA evaluates the Riemann Zeta function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N                 Zeta                  Zeta\n' );
  fprintf ( 1, '                        exact              computed\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, z1 ] = zeta_values ( n_data );

    if ( n_data == 0 )
      break
    end

    z2 = zeta ( n );

    fprintf ( 1, '  %6d  %20e  %20e\n', n, z1, z2 );

  end

  return
end
