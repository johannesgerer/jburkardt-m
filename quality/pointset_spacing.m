function gamma = pointset_spacing ( dim_num, n, z )

%*****************************************************************************80
%
%% POINTSET_SPACING determines the minimum spacing between points in the set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 October 2004
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
%    Input, real Z(DIM_NUM,N), the point distribution.
%
%    Output, real GAMMA(N), the minimum distance between each
%    point and a distinct point in the set.
%
  gamma(1:n) = r8_huge ( );

  for j1 = 1 : n

    for j2 = 1 : n

      if ( j2 ~= j1 )
        gamma(j1) = min ( gamma(j1), ...
          sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 ) );
      end

    end

  end

  gamma(1:n) = sqrt ( gamma(1:n) );

  return
end
