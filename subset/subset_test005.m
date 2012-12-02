function subset_test005 ( )

%*****************************************************************************80
%
%% TEST005 tests CATALAN, CATALAN_VALUES.
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
  fprintf ( 1, 'TEST005\n' );
  fprintf ( 1, '  CATALAN computes Catalan numbers.\n' );
  fprintf ( 1, '  CATALAN_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N  exact C(I)  computed C(I)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = catalan_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    c2 = catalan ( n );

    fprintf ( 1, '  %4d  %6d  %6d\n', n, c, c2(n+1) );

  end

  return
end
