function subset_test044 ( )

%*****************************************************************************80
%
%% TEST044 tests INDEX_BOX_NEXT_3D.
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
  n1 = 5;
  n2 = 3;
  n3 = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST044\n' );
  fprintf ( 1, '  INDEX_BOX_NEXT_3D produces IJK indices that\n' );
  fprintf ( 1, '  lie on the surface of a box.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The box has logical dimensions:\n' );
  fprintf ( 1, '  %3d  %3d  %3d\n', n1, n2, n3 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #    I   J   K\n' );
  fprintf ( 1, '\n' );

  i = [];
  j = [];
  k = [];
  more = 0;
  n = 0;

  while ( 1 )

    [ i, j, k, more ] = index_box_next_3d ( n1, n2, n3, i, j, k, more );

    if ( ~more )
      break
    end

    n = n + 1;
    fprintf ( 1, '  %3d  %3d  %3d  %3d\n', n, i, j, k );

  end

  return
end
