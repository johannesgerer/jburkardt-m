function p_xy = cvt_disk ( r, ns, np, p_xy, p_type )

%*****************************************************************************80
%
%% CVT_DISK computes a CVT in the disk.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, integer NS, the number of sample points.
%
%    Input, integer NP, the number of points.
%
%    Input, real P_XY(2,NP), the point coordinates.
%
%    Input, integer P_TYPE(NP),
%    1, the point is constrained to the circle.
%    2, the point is constrainted to the disk.
%
%    Output, real P_XY(2,NP), the updated point coordinates.
%
  for it = 1 : 30
%
%  We can use uniform sampling for a nonuniform problem,
%  but we have to use the nonuniform weight somehow to
%  scale the points.
%
    if ( 1 )
      s_xy = disk_sample_nonuniform ( ns, r );
    else
      s_xy = disk_sample_uniform ( ns, r );
    end

    nearest = find_closest ( ns, s_xy, np, p_xy );

    v_xy(1:2,1:np) = p_xy(1:2,1:np);
    c(1,1:np) = 1;

    for j1 = 1 : ns
      j2 = nearest(j1);
      v_xy(1:2,j2) = v_xy(1:2,j2) + s_xy(1:2,j1);
      c(1,j2) = c(1,j2) + 1;
    end

    v_xy(1,1:np) = v_xy(1,1:np) ./ c(1,1:np);
    v_xy(2,1:np) = v_xy(2,1:np) ./ c(1,1:np);
%
%  Modify centroids of points on boundary.
%
    b = find ( p_type == 1 );
    r2(1,b) = sqrt ( v_xy(1,b).^2 + v_xy(2,b).^2 );
    v_xy(1,b) = r * v_xy(1,b) ./ r2(1,b);
    v_xy(2,b) = r * v_xy(2,b) ./ r2(1,b);

    p_xy(1:2,1:np) = v_xy(1:2,1:np);

  end

  return
end

