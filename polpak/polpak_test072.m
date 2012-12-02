function polpak_test072 ( )

%*****************************************************************************80
%
%% TEST072 tests TAU, TAU_VALUES.
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
  fprintf ( 1, 'TEST072\n' );
  fprintf ( 1, '  TAU computes the Tau function.\n' );
  fprintf ( 1, '  TAU_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n'  );
  fprintf ( 1, '  N  exact C(I)  computed C(I)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = tau_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = tau ( n );

    fprintf ( 1, '  %4d  %8d  %8d\n', n, c, c2 );

  end

  return
end
