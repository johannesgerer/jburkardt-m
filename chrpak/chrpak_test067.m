function chrpak_test067 ( )

%*****************************************************************************80
%
%% TEST067 tests I4_TO_XXDECODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST067\n' );
  fprintf ( 1, '  I4_TO_XXDECODE: I => XXDECODE character\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The XXDECODE alphabet\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '    "' );
  for i4 = 1 : 64
    c = i4_to_xxdecode ( i4 );
    fprintf ( 1, '%c', c );
  end
  fprintf ( 1, '"\n' );

  return
end
