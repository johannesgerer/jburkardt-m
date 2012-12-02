function test06895 ( )

%*****************************************************************************80
%
%% TEST06895 tests INVERSE_MOD_N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06895\n' );
  fprintf ( 1, '  INVERSE_MOD_N seeks Y, the inverse of B mod N,\n' );
  fprintf ( 1, '  so that mod ( B * Y, N ) = 1, but returns 0\n' );
  fprintf ( 1, '  if the inverse does not exist.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     B     N     Y     Z = mod ( B * Y, N )\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 10
    for b = 1 : n - 1
      y = inverse_mod_n ( b, n );
      z = mod ( b * y, n );
      fprintf ( 1, '  %4d  %4d  %4d  %4d\n', b, n, y, z );
    end
  end

  return
end
