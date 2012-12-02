function v = voxels_line_3d ( v1, v2, n )

%*****************************************************************************80
%
%% VOXELS_LINE_3D computes voxels along a line in 3D.
%
%  Discussion:
%
%    The line itself is defined by two voxels.  The line will begin
%    at the first voxel, and move towards the second.  If the value of
%    N is equal to the L1 distance between the two voxels, then the
%    line will "almost" reach the second voxel.  Depending on the
%    direction, 1, 2 or 3 more steps may be needed.
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
%  Reference:
%
%    Daniel Cohen,
%    Voxel Traversal along a 3D Line,
%    Graphics Gems IV,
%    edited by Paul Heckbert,
%    AP Professional, 1994.
%
%  Parameters:
%
%    Input, integer V1(3), the voxel that begins the line.
%
%    Input, integer V2(3), the voxel that ends the line.
%
%    Input, integer N, the number of voxels to compute.
%
%    Output, integer V(3,N), a sequence of voxels, whose
%    first value is V1 and which proceeds towards V2.
%
  dim_num = 3;

  if ( n <= 0 )
    return
  end
%
%  Determine the number of voxels on the line.
%
  for i = 1 : dim_num
    s(i) = r8_sign ( v2(i) - v1(i) );
  end
  a(1:dim_num) = abs ( v2(1:dim_num) - v1(1:dim_num) );

  exy = a(2) - a(1);
  exz = a(3) - a(1);
  ezy = a(2) - a(3);
%
%  We start at the starting point.
%
  v(1:dim_num,1) = v1(1:dim_num)';

  for i = 2 : n

    v(1:dim_num,i) = v(1:dim_num,i-1);

    if ( exy < 0 )

      if ( exz < 0 )
        v(1,i) = v(1,i) + s(1);
        exy = exy + 2 * a(2);
        exz = exz + 2 * a(3);
      else
        v(3,i) = v(3,i) + s(3);
        exz = exz - 2 * a(1);
        ezy = ezy + 2 * a(2);
      end

    elseif ( ezy < 0 )
      v(3,i) = v(3,i) + s(3);
      exz = exz - 2 * a(1);
      ezy = ezy + 2 * a(2);
    else
      v(2,i) = v(2,i) + s(2);
      exy = exy - 2 * a(1);
      ezy = ezy - 2 * a(3);
    end

  end

  return
end
