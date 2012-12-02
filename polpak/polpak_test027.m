function polpak_test027 ( )

%*****************************************************************************80
%
%%  TEST027 tests EULERIAN.
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
  n = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST027\n' );
  fprintf ( 1, '  EULERIAN evaluates Eulerian numbers.\n' );
  fprintf ( 1, '\n' );
 
  e = eulerian ( n );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %4d', e(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
