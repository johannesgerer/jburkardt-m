function subset_test092 ( )

%*****************************************************************************80
%
%% TEST092 tests PERM_FIXED_ENUM.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST092\n' );
  fprintf ( 1, '  PERM_FIXED_ENUM enumerates the permutations\n' );
  fprintf ( 1, '  of N objects that leave M unchanged.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this test, N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M    F(N,M)\n' );
  fprintf ( 1, '\n' );

  for m = 0 : n

    fnm = perm_fixed_enum ( n, m );
    fprintf ( 1, '  %2d  %8d\n', m, fnm );

  end

  return
end
