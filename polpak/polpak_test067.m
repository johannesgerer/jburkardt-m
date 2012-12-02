function polpak_test067 ( )

%*****************************************************************************80
%
%% TEST067 tests PYRAMID_NUM.
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
  fprintf ( 1, 'TEST067\n' );
  fprintf ( 1, '  PYRAMID_NUM computes the pyramidal numbers.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    fprintf ( 1, '  %2d  %6d\n', n, pyramid_num ( n ) );
  end

  return
end
