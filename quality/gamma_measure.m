function gamma = gamma_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% GAMMA_MEASURE determines the pointset quality measure GAMMA.
%
%  Discussion:
%
%    The GAMMA measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%      GAMMA = ( GAMMA_MAX / GAMMA_MIN ),
%
%    where
%
%      GAMMA_MAX = maximum ( 1 <= I <= N ) DIST_MIN(I)
%      GAMMA_MIN = minimum ( 1 <= I <= N ) DIST_MIN(I)
%
%    and
%
%      DIST_MIN(I) = minimum ( 1 <= J <= N, I /= J ) distance ( Z(I), Z(J) )
%
%    Note that, in this code, the variable DIST_SQ_MIN is actually the square
%    of the minimum point distance, and so when we compute GAMMA, we must
%    take the square root of the given ratio.
%
%    GAMMA must be at least 1.  For an ideally regular mesh, GAMMA would
%    be equal to one.  Given two meshes, this measure recommends the one
%    with the smaller value of GAMMA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2004
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
%    Output, real GAMMA, the GAMMA quality measure.
%
%  Local parameters:
%
%    Local, real ( kind = 8 ) GAMMA_SQ_MAX, the maximum, over all points,
%    of the minimum squared distance to a distinct point.
%
%    Local, real ( kind = 8 ) GAMMA_SQ_MIN, the minimum, over all points,
%    of the minimum squared distance to a distinct point.
%

%
%  Take care of ridiculous cases.
%
  if ( n <= 1 )
    gamma = 0.0;
    return
  end

  gamma_sq_max = 0.0;
  gamma_sq_min = r8_huge ( );

  for j1 = 1 : n

    dist_sq_min = r8_huge ( );

    for j2 = 1 : n

      if ( j2 ~= j1 )
        dist_sq = sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 );
        if ( dist_sq < dist_sq_min )
          dist_sq_min = dist_sq;
        end
      end

    end

    gamma_sq_max = max ( gamma_sq_max, dist_sq_min );
    gamma_sq_min = min ( gamma_sq_min, dist_sq_min );

  end

  if ( gamma_sq_min <= 0.0 )
    gamma = r8_huge ( );
  else
    gamma = sqrt ( gamma_sq_max / gamma_sq_min );
  end

  return
end
