function h = h_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% H_MEASURE determines the pointset quality measure H.
%
%  Discussion:
%
%    The H measure of dispersion for a set of N points in an DIM_NUM-dimensional
%    region is the maximum distance between a point in the region and 
%    some point in the set.
%
%    To compute this quantity exactly, for every point X in the region,
%    find the nearest element Z of the point set and compute the distance.
%    H is then the maximum of all these distances.
%
%    To ESTIMATE this quantity, carry out the same process, but only for
%    NS sample points in the region.
%
%    Under this measure, a mesh with a smaller value of H is preferable.
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
%    Output, real H, the H quality measure.
%
  seed = seed_init;
  h = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    h = max ( h, dist );

  end

  h = sqrt ( h );

  return
end
