function subpak_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests PRIME_GE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  PRIME_GE returns the smallest prime number greater\n' );
  fprintf ( 1, '  than or equal to N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     P\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 20

    p = prime_ge ( n );
    fprintf ( 1, '%6d  %6d\n', n, p );

  end

  return
end
