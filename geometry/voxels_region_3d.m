function [ ishow, list_num, list, nregion ] = voxels_region_3d ( maxlist, ...
  nx, ny, nz, ishow )

%*****************************************************************************80
%
%% VOXELS_REGION_3D arranges a set of voxels into contiguous regions in 3D.
%
%  Discussion:
%
%    On input, the ISHOW array contains zero and nonzero values.  The nonzero
%    values are taken to be active voxels.  On output, the zero voxels remain
%    zero, and all the active voxels have been assigned a value which now
%    indicates membership in a region, or group of contiguous voxels.
%
%    On output, the array LIST contains information about the regions.
%    The last used element of LIST is LIST_NUM.
%
%    The number of elements in region NREGION is NELEM = LIST(LIST_NUM).  
%    The (I,J,K) indices of the last element in this region are in
%    LIST(LIST_NUM-3) through LIST(LIST_NUM-1), and the first element is
%    listed in LIST(LIST_NUM-3*NELEM), LIST(LIST_NUM-3*NELEM+1),
%    LIST(LIST_NUM-3*NELEM+2).
%
%    The number of elements in NREGION-1 is listed in LIST(LIST_NUM-3*NELEM-1), 
%    and the (I,J,K) indices of the these elements are listed there.
%
%  Picture:
%
%    Input:
%
%      0  2  0  0 17  0  3
%      0  0  3  0  1  0  4
%      1  0  4  8  8  0  7
%      3  0  6 45  0  0  0
%      3 17  0  5  9  2  5
%
%    Output:
%
%      0  1  0  0  2  0  3
%      0  0  2  0  2  0  3
%      4  0  2  2  2  0  3
%      4  0  2  2  0  0  0
%      4  4  0  2  2  2  2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MAXLIST, the maximum length of the array used to
%    list the elements of the regions.
%
%    Input, integer NX, NY, NZ, the number of voxels in the X, Y and
%    Z directions.
%
%    Input, integer ISHOW(NX,NY,NZ), the only significance to
%    the entries is whether they are zero or nonzero.  
%
%    Output, integer ISHOW(NX,NY,NZ), the nonzero entries have now been revalued 
%    so that contiguous entries have the same value, indicating a grouping into 
%    a region.
%
%    Output, integer LIST_NUM, the number of entries of LIST that were used.
%    However, if MAXLIST < LIST_NUM, then there was not enough space in
%    LIST to store the data properly, and LIST should not be used,
%    although the data in ISHOW should be correct.
%
%    Output, integer LIST(MAXLIST), contains, in stack form, a list
%    of the indices of the elements in each region.
%
%    Output, integer NREGION, the number of regions discovered.
%

%
%  Reset all nonzero entries of ISHOW to -1.
%
  for i = 1 : nx
    for j = 1 : ny
      for k = 1 : nz
        if ( ishow(i,j,k) ~= 0 )
          ishow(i,j,k) = -1;
        end
      end
    end
  end
%
%  Start the number of items in the region list at 0.
%
  list_num = 0;
%
%  Start the number of regions at 0.
%
  nregion = 0;
%
%  The stack begins empty.
%
  nstack = 0;
%
%  Search for an unused "ON" voxel from which we can "grow" a new region.
%
  for i = 1 : nx
    for j = 1 : ny
      for k = 1 : nz
%
%  We found a voxel that is "ON", and does not belong to any region.
%
        if ( ishow(i,j,k) == -1 )
%
%  Increase the number of regions.
%
          nregion = nregion + 1;
%
%  Add this voxel to the region.
%
          ishow(i,j,k) = nregion;
%
%  Add this voxel to the stack.
%
          stack(nstack+1) = i;
          stack(nstack+2) = j;
          stack(nstack+3) = k;

          stack(nstack+4) = 1;

          nstack = nstack + 4;
%
%  Add this voxel to the description of the region.
%
          nelements = 1;

          if ( list_num + 3 <= maxlist )
            list(list_num+1) = i;
            list(list_num+2) = j;
            list(list_num+3) = k;
          end

          list_num = list_num + 3;

          while ( 1 )
%
%  Find all neighbors of BASE that are "ON" but unused.
%  Mark them as belonging to this region, and stack their indices.
%
            ibase = stack(nstack-3);
            jbase = stack(nstack-2);
            kbase = stack(nstack-1);

            ilo = max ( ibase-1, 1 );
            ihi = min ( ibase+1, nx );
            jlo = max ( jbase-1, 1 );
            jhi = min ( jbase+1, ny );
            klo = max ( kbase-1, 1 );
            khi = min ( kbase+1, nz );

            nabes = 0;

            for i2 = ilo : ihi
              for j2 = jlo : jhi
                for k2 = klo : khi
%
%  We found a neighbor to our current search point, which is "ON" and unused.
%
                  if ( ishow(i2,j2,k2) == -1 )
%
%  Increase the number of neighbors.
%
                    nabes = nabes + 1;
%
%  Mark the neighbor as belonging to the region.
%
                    ishow(i2,j2,k2) = nregion;
%
%  Add the neighbor to the stack.
%
                    stack(nstack+1) = i2;
                    stack(nstack+2) = j2;
                    stack(nstack+3) = k2;

                    nstack = nstack + 3;
%
%  Add the neighbor to the description of the region.
%
                    nelements = nelements + 1;

                    if ( list_num + 3 <= maxlist )
                      list(list_num+1) = i2;
                      list(list_num+2) = j2;
                      list(list_num+3) = k2;
                    end

                    list_num = list_num + 3;

                  end
                end
              end
            end
%
%  If any new neighbors were found, take the last one as the basis
%  for a deeper search.
%
            if ( 0 < nabes )
              stack(nstack+1) = nabes;
              nstack = nstack + 1;
              continue
            end
%
%  If the current search point had no new neighbors, drop it from the stack.
%
            ncan = stack(nstack) - 1;
            nstack = nstack - 3;
            stack(nstack) = ncan;
%
%  If there are still any unused candidates at this level, take the
%  last one as the basis for a deeper search.
%
            if ( 0 < stack(nstack) )
              continue
            end
%
%  If there are no more unused candidates at this level, then we need
%  to back up a level in the stack.  If there are any candidates at
%  that earlier level, then we can still do more searching.
%
            nstack = nstack - 1;

            if ( nstack <= 0 )
              break
            end

          end
%
%  If we have exhausted the stack, we have completed this region.
%  Tag the number of elements to the end of the region description list.
%
          list_num = list_num + 1;
          if ( list_num <= maxlist )
            list(list_num) = nelements;
          end

        end

      end
    end
  end
%
%  Print some warnings.
%
  if ( maxlist < list_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VOXELS_REGION - Warning!\n' );
    fprintf ( 1, '  MAXLIST was too small to list the regions.\n' );
    fprintf ( 1, '  Do not try to use the LIST array!\n' );
    fprintf ( 1, '  The ISHOW data is OK, however.\n' );
  end

  return
end
