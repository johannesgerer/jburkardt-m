function chrpak_test054 ( )

%*****************************************************************************80
%
%% TEST054 tests I4_TO_BINHEX.
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
  fprintf ( 1, 'TEST054\n' );
  fprintf ( 1, '  I4_TO_BINHEX: I => BINHEX character\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The BINHEX alphabet\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    "' );
  for i4 = 1 : 64
    c = i4_to_binhex ( i4 );
    fprintf ( 1, '%c', c );
  end
  fprintf ( 1, '"\n' );

  return
end
