function geometry_test226 ( )

%*****************************************************************************80
%
%% TEST226 tests VOXELS_REGION_3D.
%
%  The test region is 8 by 9 by 1 voxels:
%
%    123456789
%  1 .........
%  2 ...11.1..
%  3 ..11111..
%  4 ...11.1..
%  5 ......1..
%  6 .11..11..
%  7 ..1......
%  8 .......1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
  maxlist = 100;
  dim_num = 3;
  nx = 8;
  ny = 9;
  nz = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST226\n' );
  fprintf ( 1, '  VOXELS_REGION_3D groups voxels into regions.\n' );

  ishow(1:nx,1:ny,1:nz) = 0;

  ishow(2,4,1) = 1;
  ishow(2,5,1) = 1;
  ishow(2,7,1) = 1;

  ishow(3,3,1) = 1;
  ishow(3,4,1) = 1;
  ishow(3,5,1) = 1;
  ishow(3,6,1) = 1;
  ishow(3,7,1) = 1;

  ishow(4,4,1) = 1;
  ishow(4,5,1) = 1;
  ishow(4,7,1) = 1;

  ishow(5,7,1) = 1;

  ishow(6,2,1) = 1;
  ishow(6,3,1) = 1;
  ishow(6,6,1) = 1;
  ishow(6,7,1) = 1;

  ishow(7,3,1) = 1;

  ishow(8,8,1) = 1;

  [ ishow, list_num, list, nregion ] = voxels_region_3d ( maxlist, nx, ny, nz, ishow );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of regions found = %d\n', nregion );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The nonzero ISHOW array elements are:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : nx
    for j = 1 : ny
      for k = 1 : nz
        l = ishow(i,j,k);
        if ( l ~= 0 )
          fprintf ( 1, '  %4d  %4d  %4d  %4d\n', i, j, k, l );
        end
      end
    end
  end

  if ( maxlist < list_num )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The stack-based list of regions is unusable.\n' );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The stack-based list of regions is:\n' );
    fprintf ( 1, '\n' );

    iregion = nregion;

    while ( 0 < list_num )

      nelements = list(list_num);
      list_num = list_num - 1;

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Region %d include %d voxels:\n', iregion, nelements );
      fprintf ( 1, '\n' );

      for l = 1 : nelements
        k = list(list_num);
        list_num = list_num - 1;
        j = list(list_num);
        list_num = list_num - 1;
        i = list(list_num);
        list_num = list_num - 1;
        fprintf ( 1, '  %4d  %4d  %4d\n', i, j, k );
      end

      iregion = iregion - 1;

    end

  end

  return
end

