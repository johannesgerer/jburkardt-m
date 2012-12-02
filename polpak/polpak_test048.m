function polpak_test048 ( )

%*****************************************************************************80
%
%% TEST048 tests I4_IS_TRIANGULAR, I4_TO_TRIANGLE, TRIANGLE_TO_I4.
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
  fprintf ( 1, 'TEST048\n' );
  fprintf ( 1, '  I4_TO_TRIANGLE converts a linear index to a\n' );
  fprintf ( 1, '    triangular one.\n' );
  fprintf ( 1, '  TRIANGLE_TO_I4 converts a triangular index to a\n' );
  fprintf ( 1, '    linear one.\n' );
  fprintf ( 1, '  I4_IS_TRIANGULAR returns T or F depending on\n' );
  fprintf ( 1, '    whether I is triangular.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I  =>   J   K  =>   I   T/F\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 20

    [ j, k ] = i4_to_triangle ( i );

    i2 = triangle_to_i4 ( j, k );

    l = i4_is_triangular ( i );

    fprintf ( 1, '  %2d    %4d    %4d    %4d    %1d\n',  i, j, k, i2, l );

  end

  return
end
