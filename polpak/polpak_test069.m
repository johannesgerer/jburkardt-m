function polpak_test069 ( )

%*****************************************************************************80
%
%% TEST069 tests SIGMA, SIGMA_VALUES.
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
  fprintf ( 1, 'TEST069\n' );
  fprintf ( 1, '  SIGMA computes the SIGMA function.\n' );
  fprintf ( 1, '  SIGMA_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n'  );
  fprintf ( 1, '  N   Exact   SIGMA(N)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = sigma_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = sigma ( n );

    fprintf ( 1, '  %4d  %8d  %8d\n', n, c, c2 );

  end

  return
end
