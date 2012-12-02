function e = e_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% E_MEASURE determines the pointset quality measure E.
%
%  Discussion:
%
%    The E measure of point distribution quality for a set Z of
%    N points in an DIM_NUM dimensional region is defined as follows:
%
%    Assign every point X in the region to the nearest element
%    Z(I) of the point set.  For each point Z(I), let E_VEC(I) be the
%    integral of the distance between Z(I) and all the points assigned to
%    it:
%
%      E_VEC(I) = Integral ( all X nearest to Z(I) ) distance ( X, Z(I) )
%
%    If we let VOLUME be the volume of the region, then we define E by:
%
%      E = sum ( 1 <= I <= N ) E_VEC(I) / VOLUME
%
%    This quantity can be estimated by using sampling to pick a large
%    number of points in the region, rather than all of them.
%
%    The E measure is minimized by a centroidal Voronoi tessellation.
%
%    Given two meshes, the one with a lower value of E is to be recommended.
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
%    Input, real ( kind = 8 ) Z(DIM_NUM,N), the points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, character SAMPLE_ROUTINE, the name of the function to be used to
%    return sample points in the region.  The function must have the form
%      [ x, seed ] = sample_routine ( dim_num, n, seed )
%
%    Input, integer SEED_INIT, the initial value of the random number seed.
%
%    Output, real E, the E quality measure.
%
  seed = seed_init;
  e_vec(1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    e_vec(closest(1)) = e_vec(closest(1)) + dist;

  end

  e = sum ( e_vec(1:n) ) / ns;

  return
end
