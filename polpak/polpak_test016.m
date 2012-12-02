function polpak_test016 ( )

%*****************************************************************************80
%
%% TEST016 tests CATALAN, CATALAN_VALUES.
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
  fprintf ( 1, 'TEST016\n' );
  fprintf ( 1, '  CATALAN computes Catalan numbers.\n' );
  fprintf ( 1, '  CATALAN_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N  exact C(I)  computed C(I)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = catalan_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = catalan ( n );

    fprintf ( 1, '  %2d  %6d  %6d\n', n, c, c2(n+1) );

  end

%
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST016\n' );
  fprintf ( 1, '  CATALAN computes Catalan numbers.\n' );
  fprintf ( 1, '  CATALAN_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N  exact C(I)  computed C(I)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = catalan_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = catalan ( n );

    fprintf ( 1, '  %2d  %6d  %6d\n', n, c, c2(n+1) );

  end

  return
end
