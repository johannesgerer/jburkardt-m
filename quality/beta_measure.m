function beta = beta_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% BETA_MEASURE determines the pointset quality measure BETA.
%
%  Discussion:
%
%    The BETA measure of point distribution quality for a set Z of
%    N points in an DIM_NUM dimensional region is defined as follows:
%
%    For each point Z(I), determine the nearest distinct element of
%    the pointset by 
%
%      GAMMA(I) = minimum ( 1 <= J <= N, I /= J ) distance ( Z(I), Z(J) )
%
%    Let GAMMA_AVE be the average of GAMMA(1:N).
%
%    Let GAMMA_STD be the standard deviation of the GAMMA's:
%
%      GAMMA_STD = sqrt ( 1 / ( N - 1 ) 
%        * sum ( 1 <= I <= N ) ( GAMMA(I) - GAMMA_AVE )**2 ) )
%
%    Then BETA is the standard deviation normalized by the average:
%
%      BETA = GAMMA_STD / GAMMA_AVE.
%
%    For an ideally regular mesh, the GAMMA(I)'s will be equal and
%    BETA will be zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
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
%    Output, real BETA, the BETA quality measure.
%
  gamma = pointset_spacing ( dim_num, n, z );

  gamma_ave = sum ( gamma(1:n) ) / n;

  if ( 1 < n )
    gamma_std = sqrt ( sum ( ( gamma(1:n) - gamma_ave ).^2 ) / ( n - 1 ) );
  else
    gamma_std = 0.0;
  end

  if ( 0.0D+00 < gamma_ave )
    beta = gamma_std / gamma_ave;
  else
    beta = 0.0;
  end

  return
end
