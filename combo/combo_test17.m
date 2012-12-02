function combo_test17 ( )

%*****************************************************************************80
%
%% COMBO_TEST17 tests MOUNTAIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST17\n' );
  fprintf ( 1, '  MOUNTAIN computes mountain numbers.\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '   Y    MXY\n' );
  fprintf ( 1, ' \n' );

  for y = 0 : n
    fprintf ( 1, '  %2d   ', y );
    for x = 0 : 2 * n
      mxy = mountain ( n, x, y );
      fprintf ( 1, '%4d', mxy );
    end
    fprintf ( 1, '\n' );
  end

  return
end
