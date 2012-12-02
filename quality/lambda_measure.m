function lambda = lambda_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% LAMBDA_MEASURE determines the pointset quality measure LAMBDA.
%
%  Discussion:
%
%    The LAMBDA measure of point distribution quality for a set Z of
%    N points in an DIM_NUM-dimensional region is defined as follows:
%
%    Let
%
%      GAMMA(I) = minimum ( 1 <= J <= N, I /= J ) distance ( Z(I), Z(J) )
%
%    and let
%
%      GAMMA_AVE = sum ( 1 <= I <= N ) GAMMA(I) / N
%
%    then
%
%      LAMBDA = sqrt ( sum ( 1 <= I <= N ) ( GAMMA(I) - GAMMA_AVE )**2 / N )
%        / GAMMA_AVE
%
%    An ideally regular mesh would have GAMMA(I) = GAMMA_AVE for all I,
%    so that LAMBDA would be 0.  Under this measure, the mesh with the
%    smaller value of LAMBDA is to be preferred.
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
%    Input, real Z(DIM_NUM,N), the points.
%
%    Output, real LAMBDA, the LAMBDA quality measure.
%
%  Local parameters:
%
%    Local, real GAMMA_MAX, the maximum, over all points,
%    of the minimum distance to a distinct point.
%
%    Local, real GAMMA_MIN, the minimum, over all points,
%    of the minimum distance to a distinct point.
%

%
%  Take care of ridiculous cases.
%
  if ( n <= 1 )
    lambda = 0.0;
    return
  end
%
%  Compute the minimum spacing between distinct points of the set.
%
  gamma = pointset_spacing ( dim_num, n, z );
%
%  Average the minimum spacing.
%
  gamma_ave = sum ( gamma(1:n) ) / n;
%
%  Compute a weighted variance.
%
  if ( gamma_ave <= 0.0 )
    lambda = r8_huge ( );
  else
    lambda = sqrt ( sum ( ( gamma(1:n) - gamma_ave ).^2 ) / n ) / gamma_ave;
  end

  return
end
