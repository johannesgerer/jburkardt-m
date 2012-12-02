function [ ntri, tri ] = sphere_imp_gridfaces_3d ( maxtri, nlat, nlong )

%*****************************************************************************80
%
%% SPHERE_IMP_GRIDFACES_3D produces a grid of triangles on an implicit sphere in 3D.
%
%  Discussion:
%
%    The point numbering system is the same used in SPHERE_IMP_GRIDPOINTS_3D,
%    and that routine may be used to compute the coordinates of the points.
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )**2 ) = R**2
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
%    Input, integer MAXTRI, the maximum number of triangles.
%
%    Input, integer NLAT, NLONG, the number of latitude and longitude
%    lines to draw.  The latitudes do not include the North and South
%    poles, which will be included automatically, so NLAT = 5, for instance,
%    will result in points along 7 lines of latitude.
%
%    Output, integer NTRI, the number of triangles.
%
%    Output, integer TRI(3,MAXTRI), the triangle vertices.
%
  dim_num = 3;
  ntri = 0;
%
%  The first row.
%
  n = 1;

  sw = 2;
  se = sw + 1;

  s_min = 2;
  s_max = nlong + 1;

  for j = 0 : nlong - 1

    if ( ntri < maxtri )
      ntri = ntri + 1;
      tri(1:dim_num,ntri) = [ sw, se, n ]';
    end

    sw = se;

    if ( se == s_max )
      se = s_min;
    else
      se = se + 1;
    end

  end
%
%  The intermediate rows.
%
  for i = 1 : nlat

    n_max = s_max;
    n_min = s_min;

    s_max = s_max + nlong;
    s_min = s_min + nlong;

    nw = n_min;
    ne = nw + 1;
    sw = s_min;
    se = sw + 1;

    for j = 0 : nlong - 1

      if ( ntri < maxtri )
        ntri = ntri + 1;
        tri(1:dim_num,ntri) = [ sw, se, nw ]';
      end

      if ( ntri < maxtri )
        ntri = ntri + 1;
        tri(1:dim_num,ntri) = [ ne, nw, se ]';
      end

      sw = se;
      nw = ne;

      if ( se == s_max )
        se = s_min;
      else
        se = se + 1;
      end

      if ( ne == n_max )
        ne = n_min;
      else
        ne = ne + 1;
      end

    end

  end
%
%  The last row.
%
  n_max = s_max;
  n_min = s_min;

  s = n_max + 1;

  nw = n_min;
  ne = nw + 1;

  for j = 0 : nlong - 1

    if ( ntri < maxtri )
      ntri = ntri + 1;
      tri(1:dim_num,ntri) = [ ne, nw, s ]';
    end

    nw = ne;

    if ( ne == n_max )
      ne = n_min;
    else
      ne = ne + 1;
    end

  end

  return
end
