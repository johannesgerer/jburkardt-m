function value = ellipse_eccentricity_2d ( r1, r2 )

%*****************************************************************************80
%
%% ELLIPSE_ECCENTRICITY_2D returns the eccentricity of an ellipse in 2D.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      ( ( X - XC ) / R1 )**2 + ( ( Y - YC ) / R2 )**2 <= 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R1, R2, the major and minor semi-axes.
%
%    Output, real VALUE, the eccentricity of the ellipse.
%
  minor = min ( abs ( r1 ), abs ( r2 ) );
  major = max ( abs ( r1 ), abs ( r2 ) );

  if ( major == 0.0E+00 )
    value = -Inf;
    return
  end

  value = sqrt ( 1.0E+00 - ( minor / major )^2 );

  return
end
