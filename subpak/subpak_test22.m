function subpak_test22 (  )

%*****************************************************************************80
%
%% TEST22 tests LCM_12N.
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
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  LCM_12N computes the least common multiple of the\n' );
  fprintf ( 1, '  integers 1 through N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N     LCM_12N ( N )\n' );
  fprintf ( 1, '\n' );
  for n = 1 : 12
    fprintf ( 1, '  %3d  %8d\n', n, lcm_12n ( n ) );
  end

  return
end
