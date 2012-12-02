function subset_test1478 ( )

%*****************************************************************************80
%
%% TEST1478 tests SUBTRIANGLE_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  rank = 0;

  more = 0;
  i1 = 0;
  j1 = 0;
  i2 = 0;
  j2 = 0;
  i3 = 0;
  j3 = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1478\n' );
  fprintf ( 1, '  SUBTRIANGLE_NEXT generates the indices of subtriangles\n' );
  fprintf ( 1, '  in a triangle whose edges were divided into N subedges.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this test, N = %d\n', n  );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank    I1  J1    I2  J2    I3  J3\n' );
  fprintf ( 1, '\n' );

  while ( 1 )

    [ more, i1, j1, i2, j2, i3, j3 ] = subtriangle_next ( n, more, ...
      i1, j1, i2, j2, i3, j3 );

    rank = rank + 1;

    fprintf ( 1, '  %4d    %2d  %2d    %2d  %2d    %2d  %2d\n', ...
      rank, i1, j1, i2, j2, i3, j3 );

    if ( ~more )
      break
    end

  end

  return
end
