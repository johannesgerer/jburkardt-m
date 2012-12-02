function polpak_test0635 ( )

%*****************************************************************************80
%
%% TEST0635 tests MOTZKIN.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0635\n' );
  fprintf ( 1, '  MOTZKIN computes the Motzkin numbers A(0:N).\n' );
  fprintf ( 1, '  A(N) counts the paths from (0,0) to (N,0).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I   A(I)\n' );
  fprintf ( 1, '\n' );

  a = motzkin ( n );

  for i = 0 : n
    fprintf ( 1, '  %2d  %10d\n', i, a(i+1) );
  end

  return
end
