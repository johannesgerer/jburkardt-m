function nu = nu_measure ( dim_num, n, z, ns, sample_routine, seed_init )

%*****************************************************************************80
%
%% NU_MEASURE determines the pointset quality measure NU.
%
%  Discussion:
%
%    The NU measure of dispersion for a set of N points in an
%    DIM_NUM-dimensional region is defined as follows:
%
%    For each element Z(I) of the pointset, let VOLUME(I) be the volume
%    of the corresponding Voronoi region, restricted to the region.
%
%    Then
%
%      NU = max ( 1 <= I <= N ) VOLUME(I) / min ( 1 <= I <= N ) VOLUME(I)
%
%    This quantity can be estimated by using a large number of sampling
%    points to estimate the Voronoi volumes.
%
%    For an ideally uniform pointset, the Voronoi volumes would be equal,
%    so that NU would be 1.  In any case, NU must be 1 or greater.  In
%    comparing two meshes, the one with the lower value of NU would be
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
%    Output, NU, the NU quality measure.
%
  seed = seed_init;
  hit(1:n) = 0;

  for k = 1 : ns

    [ x, seed ] = feval ( sample_routine, dim_num, 1, seed );

    closest = find_closest ( dim_num, n, 1, x, z );

    hit(closest(1)) = hit(closest(1)) + 1;

  end

  volume(1:n) = hit(1:n) / ns;

  if ( min ( volume(1:n) ) == 0.0 )
    nu = r8_huge ( );
  else
    nu = max ( volume(1:n) ) / min ( volume(1:n) );
  end

  return
end
