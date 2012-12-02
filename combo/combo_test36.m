function combo_test36 ( )

%*****************************************************************************80
%
%% COMBO_TEST36 tests SETPART_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST36\n' );
  fprintf ( 1, '  Set partitions:\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  SETPART_ENUM enumerates,\n' );
  fprintf ( 1, ' \n' );
%
%  Enumerate.
%
  for n = 1 : 6
    npart = setpart_enum ( n );
    fprintf ( 1, '  %4d  %4d\n', n, npart );
  end

  return
end
