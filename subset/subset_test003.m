function subset_test003 ( )

%*****************************************************************************80
%
%% TEST003 tests BELL, BELL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST003\n' );
  fprintf ( 1, '  BELL computes Bell numbers.\n' );
  fprintf ( 1, '  BELL_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N  exact C(I)  computed C(I)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = bell_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    c2 = bell ( n );

    fprintf ( 1, '  %4d  %8d  %8d\n', n, c, c2(n+1) );

  end

  return
end
