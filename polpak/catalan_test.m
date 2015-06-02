function catalan_test ( )

%*****************************************************************************80
%
%% CATALAN_TEST tests CATALAN.
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
  fprintf ( 1, 'CATALAN_TEST\n' );
  fprintf ( 1, '  CATALAN computes Catalan numbers.\n' );
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
