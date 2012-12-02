function d = d_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% D_MEASURE determines the pointset quality measure D.
%
%  Discussion:
%
%    The D measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%    For each point Z(I) in the pointset, let V(I) be the subregion
%    defined by the intersection of the region with the Voronoi
%    region associated with Z(I).
%
%    Let D(I) be the determinant of the deviatoric tensor associated with
%    the region V(I).
%
%    Then D = maximum ( 1 <= I <= N ) D(I).
%
%    This quantity can be estimated using sampling.  A given number of
%    sample points are generated in the region, assigned to the nearest
%    element of the pointset, and used to approximate the Voronoi regions
%    and the deviatoric tensors.
%
%    In an ideally regular mesh, each deviatoric tensor would have a
%    zero determinant, and hence D would be zero.  In general, the smaller
%    D, the better.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Max Gunzburger and John Burkardt,
%    Uniformity Measures for Point Samples in Hypercubes.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real D, the D quality measure.
%
  seed = seed_init;
  centroid(1:dim_num,1:n) = 0.0;
  hit(1:n) = 0;
  moment(1:dim_num,1:dim_num,1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    hit(closest(1)) = hit(closest(1)) + 1;

    centroid(1:dim_num,closest(1)) = centroid(1:dim_num,closest(1)) + x(1:dim_num);

    for i1 = 1 : dim_num
      for i2 = 1 : dim_num
        moment(i1,i2,closest(1)) = moment(i1,i2,closest(1)) + x(i1) * x(i2);
      end
    end

  end

  for j = 1 : n

    if ( 0 < hit(j) )

      centroid(1:dim_num,j) = centroid(1:dim_num,j) / hit(j);

      moment(1:dim_num,1:dim_num,j) = moment(1:dim_num,1:dim_num,j) / hit(j);

      for i1 = 1 : dim_num
        for i2 = 1 : dim_num
          moment(i1,i2,j) = moment(i1,i2,j) - centroid(i1,j) * centroid(i2,j);
        end
      end

    end

  end

  tri(1:n) = 0.0;

  for j = 1 : n
    for i = 1 : dim_num
      tri(j) = tri(j) + moment(i,i,j);
    end
  end

  for j = 1 : n
    for i = 1 : dim_num
      moment(i,i,j) = moment(i,i,j) - tri(j) / dim_num;
    end
  end

  d = 0.0;

  for j = 1 : n

    di = dge_det ( dim_num, moment(1:dim_num,1:dim_num,j) );

    d = max ( d, di );

  end

  return
end
