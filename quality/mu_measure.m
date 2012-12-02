function mu = mu_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% MU_MEASURE determines the pointset quality measure MU.
%
%  Discussion:
%
%    The MU measure of dispersion for a set of N points in an
%    DIM_NUM-dimensional region takes the ratio of the largest and
%    smallest half-diameters of the Voronoi cells defined by a pointset.
%
%    To compute this quantity exactly, for every point X in the region,
%    find the nearest element Z of the point set and compute the distance.
%
%    Then, for each element Z(I) of the point set, define H(I) to be the
%    maximum of these distances.
%
%    MU is then the ratio of the maximum and minimum values of H.
%
%    To ESTIMATE this quantity, carry out the same process, but only for
%    NS sample points in the region.
%
%    In an ideally regular mesh, MU would be 1.  MU must be at least 1.
%    Under this measure, the mesh with the smaller value of MU is to be
%    preferred.
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
%    Output, real MU, the MU quality measure.
%
  seed = seed_init;
  h(1:n) = 0.0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    dist = sum ( ( x(1:dim_num) - z(1:dim_num,closest(1)) ).^2 );

    h(closest(1)) = max ( h(closest(1)), dist );

  end

  h_max = sqrt ( max ( h(1:n) ) );
  h_min = sqrt ( min ( h(1:n) ) );

  if ( h_min == 0.0 )
    mu = r8_huge ( );
  else
    mu = h_max / h_min;
  end

  return
end
