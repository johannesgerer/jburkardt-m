function components_test03 ( )

%*****************************************************************************80
%
%% COMPONENTS_TEST03 tests I4BLOCK_COMPONENTS on a simple case.
%
%  Discussion:
%
%    This calculation is also done by a program called REGION.
%    The two programs differ in the number of components discovered
%    because REGION uses the full 3x3 block of pixels, resulting
%    in 26 potential neighbors, whereas I4BLOCK_COMPONENTS uses only
%    the north/south, east/west, up/down directions for 8 neighbors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2011
%
%  Author:
%
%    John Burkardt
%
  l = 64;
  m = 64;
  n = 26;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPONENTS_TEST03\n' );
  fprintf ( 1, '  I4BLOCK_COMPONENTS finds and labels connected\n' );
  fprintf ( 1, '  components in a 3D integer block.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A is a 3D block of order %d*%d*%d\n', l, m, n );

  a = zeros ( l, m, n );
%
%  Retrieve the indices of nonzero data in A by reading a file.
%
  ijk = load ( 'indices.txt' );
%
%  You might try to guess how to work with 3D arrays from how 2D
%  arrays work.  But it didn't work out for me.  So I give up, and
%  will do the stoopid things instead.
%
  [ m1, n1 ] = size ( ijk );
  for l1 = 1 : m1
    a(ijk(l1,1),ijk(l1,2),ijk(l1,3)) = 1;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nonzero A values is %d\n', sum ( sum ( sum ( a ) ) ) );
%
%  Determine the components.
%
  [ component_num, c ] = i4block_components ( l, m, n, a );

  s = zeros ( 1, component_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of components = %d\n', component_num );

  for i = 1 : l
    for j = 1 : m
      for k = 1 : n
        if ( c(i,j,k) ~= 0 )
          s(c(i,j,k)) = s(c(i,j,k)) + 1;
        end
      end
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Component  Size\n' );
  fprintf ( 1, '\n' );
  for i = 1 : component_num
    fprintf ( 1, '  %4d  %8d\n', i, s(i) );
  end
  fprintf ( 1, '------  --------\n' );
  fprintf ( 1, ' Total  %8d\n', sum ( s(1:component_num) ) );

  return
end
