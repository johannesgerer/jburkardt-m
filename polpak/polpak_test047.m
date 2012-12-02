function polpak_test047 ( )

%*****************************************************************************80
%
%% TEST047 tests I4_POCHHAMMER.
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
  fprintf ( 1, 'TEST047:\n' );
  fprintf ( 1, '  I4_POCHHAMMER evaluates the integer Pochhammer function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J   I4_Pochhammer(I,J)\n' );
  fprintf ( 1, '\n' );

  i = 3;
  j = 3;
  k = i4_pochhammer ( i, j );

  fprintf ( 1, '  %2d  %2d  %2d\n', i, j, k );

  i = 3;
  j = 4;
  k = i4_pochhammer ( i, j );
  fprintf ( 1, '  %2d  %2d  %2d\n', i, j, k );

  i = 3;
  j = 5;
  k = i4_pochhammer ( i, j );
  fprintf ( 1, '  %2d  %2d  %2d\n', i, j, k );

  return
end
