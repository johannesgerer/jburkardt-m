function subset_test046 ( )

%*****************************************************************************80
%
%% TEST046 tests INDEX_BOX2_NEXT_3D.
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
  kc = 30;
  n1 = 5;
  n2 = 3;
  n3 = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST046\n' );
  fprintf ( 1, '  INDEX_BOX2_NEXT_3D produces IJK indices that\n' );
  fprintf ( 1, '  lie on the surface of a box.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The box has half widths:\n' );
  fprintf ( 1, '  %3d  %3d  %3d\n', n1, n2, n3 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  and central cell:\n' );
  fprintf ( 1, '  %3d  %3d  %3d\n', ic, jc, kc );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will only print a PORTION of the data!\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #    I   J   K\n' );
  fprintf ( 1, '\n' );

  i = [];
  j = [];
  k = [];
  more = 0;
  n = 0;

  while ( 1 )

    [ i,  j, k, more ] = index_box2_next_3d ( n1, n2, n3, ic, jc, kc, i, j, k, more );

    if ( ~more )
      break
    end

    n = n + 1;

    if ( n <= 10 | 370 <= n )
      fprintf ( 1, '  %3d  %3d  %3d  %3d\n', n, i, j, k );
    end

  end

  return
end
