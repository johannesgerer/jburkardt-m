function subset_test045 ( )

%*****************************************************************************80
%
%% TEST045 tests INDEX_BOX2_NEXT_2D.
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
  ic = 10;
  jc = 20;
  n1 = 4;
  n2 = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST045\n' );
  fprintf ( 1, '  INDEX_BOX2_NEXT_2D produces IJ indices that\n' );
  fprintf ( 1, '  lie on the surface of a box2 in 2D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The box has half-widths:\n' );
  fprintf ( 1, '  %3d  %3d\n', n1, n2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  and has center cell:\n' );
  fprintf ( 1, '  %3d  %3d\n', ic, jc );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #    I   J\n' );
  fprintf ( 1, '\n' );

  i = [];
  j = [];
  more = 0;
  n = 0;

  while ( 1 )

    [ i, j, more ] = index_box2_next_2d ( n1, n2, ic, jc, i, j, more );

    if ( ~more )
      break
    end

    n = n + 1;
    fprintf ( 1, '  %3d  %3d  %3d\n', n, i, j );

  end

  return
end
