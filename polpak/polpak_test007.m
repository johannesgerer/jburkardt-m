function polpak_test007 ( )

%*****************************************************************************80
%
%% TEST007 tests BELL and BELL_VALUES.
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
  fprintf ( 1, 'TEST007\n' );
  fprintf ( 1, '  BELL computes Bell numbers.\n' );
  fprintf ( 1, '  BELL_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N  exact C(I)  computed C(I)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = bell_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2(1:n+1) = bell ( n );

    fprintf ( 1, '  %2d  %8d  %8d\n', n, c, c2(n+1) );

  end

  return
end
