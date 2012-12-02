function chi = chi_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% CHI_MEASURE determines the pointset quality measure CHI.
%
%  Discussion:
%
%    The CHI measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%    Assign every point X in the region to the nearest element
%    Z(I) of the point set.  For each Z(I), let H(I) be the maximum
%    distance between Z(I) and any point assigned to it by this process.
%
%    For each point Z(I), we determine the nearest distinct element of
%    the pointset by
%
%      GAMMA(I) = minimum ( 1 <= J <= N, I /= J ) distance ( Z(I), Z(J) )
%
%    Then
%
%      CHI(I) = 2 * H(I) / GAMMA(I)
%
%    and
%
%      CHI = maximum ( 1 <= I <= N ) CHI(I)
%
%    This quantity can be estimated by using sampling to pick a large
%    number of points in the region, rather than all of them.
%
%    For an ideally regular mesh, all the CHI(I)'s will be equal.
%    Any deviation from regularity increases the value of some entries
%    of CHI; thus, given two meshes, the one with a lower value of
%    CHI is to be recommended.
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
%    Max Gunzburger
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
%    Output, real CHI, the CHI quality measure.
%
  seed = seed_init;
  h(1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    h(closest(1)) = max ( h(closest(1)), dist );

  end

  gamma = pointset_spacing ( dim_num, n, z );

  chi_vec(1:n) = 2.0 * sqrt ( h(1:n) ) ./ gamma(1:n);

  chi = max ( chi_vec(1:n) );

  return
end
