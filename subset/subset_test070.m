function subset_test070 ( )

%*****************************************************************************80
%
%% TEST070 tests JOSEPHUS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST070\n' );
  fprintf ( 1, '  JOSEPHUS solves Josephus problems.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    N    M    K	 X\n' );
  fprintf ( 1, '\n' );

  m = 3;
  n = 41;
  k = 41;
  x = josephus ( n, m, k );
  fprintf ( 1, '  %3d  %3d  %3d  %3d\n', n, m, k, x );

  m = -38;
  n = 41;
  k = 41;
  x = josephus ( n, m, k );

  fprintf ( 1, '  %3d  %3d  %3d  %3d\n', n, m, k, x );

  m = 3;
  n = 41;
  k = 40;
  x = josephus ( n, m, k );

  fprintf ( 1, '  %3d  %3d  %3d  %3d\n', n, m, k, x );

  m = 2;
  n = 64;
  k = 64;
  x = josephus ( n, m, k );

  fprintf ( 1, '  %3d  %3d  %3d  %3d\n', n, m, k, x );

  m = 2;
  n = 1000;
  k = 1000;
  x = josephus ( n, m, k );

  fprintf ( 1, '  %3d  %3d  %3d  %3d\n', n, m, k, x );

  return
end
