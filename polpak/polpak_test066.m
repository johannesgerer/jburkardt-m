function polpak_test066 ( )

%*****************************************************************************80
%
%% TEST066 tests PHI, PHI_VALUES.
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
  fprintf ( 1, 'TEST066\n' );
  fprintf ( 1, '  PHI computes the PHI function.\n' );
  fprintf ( 1, '  PHI_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n'  );
  fprintf ( 1, '  N   Exact   PHI(N)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = phi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = phi ( n );

    fprintf ( 1, '  %4d  %8d  %8d\n', n, c, c2 );

  end
 
  return
end
