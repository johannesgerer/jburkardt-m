function subset_test010 ( )

%*****************************************************************************80
%
%% TEST010 tests CHANGE_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  coin_num = 6;
  coin_value = [ 1, 5, 10, 25, 50, 100 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST010\n' );
  fprintf ( 1, '  CHANGE_NEXT displays the next possible way to make\n' );
  fprintf ( 1, '  change for a given total\n' );

  total = 50;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The total for which change is to be made: %d\n', total );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The available coins are:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : coin_num
    fprintf ( 1, '  %6d\n', coin_value(i) );
  end

  i = 0;
  change_num = 0;
  change = [];
  done = 1;

  fprintf ( 1, '\n' );

  while ( 1 )

    [ change_num, change, done ] = change_next ( total, coin_num, coin_value, ...
      change_num, change, done );

    if ( done | 9 < i )
      break
    end

    i = i + 1;
    fprintf ( 1, '  %3d:', i )
    for j = 1 : change_num
      fprintf ( 1, '  %3d', coin_value(change(j)) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
