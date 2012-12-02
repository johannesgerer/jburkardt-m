function combo_test03 ( )

%*****************************************************************************80
%
%% COMBO_TEST03 tests BELL_NUMBERS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2011
%
%  Author:
%
%    John Burkardt
%
  m = 10;
  offset = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST03\n' );
  fprintf ( 1, '  BELL_NUMBERS computes Bell numbers.\n' );
  fprintf ( 1, '\n' );

  b = bell_numbers ( m );

  for i = 0 : m
    fprintf ( 1, '  %8d  %8d\n', i, b(i+offset) );
  end

  n_data = 0;

  while ( 1 )

    [ n_data, n, bn ] = bell_values ( n_data );

    if ( n_data == 0 )
      break
    end

    b = bell_numbers ( n );

    fprintf ( 1, '  %8d  %12d  %12d\n', n, bn, b(n+1) );

  end

  return
end
