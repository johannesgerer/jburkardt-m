function bell_test ( )

%*****************************************************************************80
%
%% BELL_TEST tests BELL.
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
  fprintf ( 1, 'BELL_TEST\n' );
  fprintf ( 1, '  BELL computes Bell numbers.\n' );
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
