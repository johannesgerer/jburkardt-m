function subset_test043 ( )

%*****************************************************************************80
%
%% TEST043 tests INDEX_BOX_NEXT_2D.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST043\n' );
  fprintf ( 1, '  INDEX_BOX_NEXT_2D produces IJ indices that\n' );
  fprintf ( 1, '  lie on the surface of a box in 2D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The box has logical dimensions:\n' );
  fprintf ( 1, '  %3d by %3d\n', n1, n2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #    I   J\n' );
  fprintf ( 1, '\n' );

  i = [];
  j = [];
  more = 0;
  n = 0;

  while ( 1 )

    [ i, j, more ] = index_box_next_2d ( n1, n2, i, j, more );

    if ( ~more )
      break
    end

    n = n + 1;
    fprintf ( 1, '  %3d  %3d  %3d\n', n, i, j );

  end

  return
end
