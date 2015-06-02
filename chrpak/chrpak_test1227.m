function chrpak_test1227 ( )

%*****************************************************************************80
%
%% CHRPAK_TEST1227 tests S_SCRABBLE_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHRPAK_TEST1227\n' );
  fprintf ( 1, '  S_SCRABBLE_POINTS returns the value of a string\n' );
  fprintf ( 1, '  as a Scrabble word.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I  ----S-------   Value\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 12
    s = i4_to_month_name ( i );
    value = s_scrabble_points ( s );
    fprintf ( 1, '  %2d  %9s    %4d\n', i, s, value );
  end

  return
end