function chrpak_test066 ( )

%*****************************************************************************80
%
%% TEST066 tests I4_TO_UUDECODE.
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
  fprintf ( 1, 'TEST066\n' );
  fprintf ( 1, '  I4_TO_UUDECODE: I => UUDECODE character\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The UUDECODE alphabet\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    "' );
  for i4 = 1 : 64
    c = i4_to_uudecode ( i4 );
    fprintf ( 1, '%c', c );
  end
  fprintf ( 1, '"\n' );

  return
end
