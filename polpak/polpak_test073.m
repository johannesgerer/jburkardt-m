function polpak_test073 ( )

%*****************************************************************************80
%
%% TEST073 tests TETRAHEDRON_NUM.
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
  fprintf ( 1, 'TEST073\n' );
  fprintf ( 1, '  TETRAHEDRON_NUM computes the tetrahedron numbers.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    fprintf ( 1, '  %2d  %6d\n', n, tetrahedron_num ( n ) );
  end

  return
end
