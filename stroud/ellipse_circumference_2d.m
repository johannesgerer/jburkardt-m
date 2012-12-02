function value = ellipse_circumference_2d ( r1, r2 )

%*****************************************************************************80
%
%% ELLIPSE_CIRCUMFERENCE_2D returns the circumference of an ellipse in 2D.
%
%  Discussion:
%
%    There is no closed formula for the circumference of an ellipse.
%
%    Defining the eccentricity by
%
%      E = sqrt ( 1 - ( r2 / r1 )**2 )
%
%    where R1 and R2 are the major and minor axes, then
%
%      circumference
%        = 4 * R1 * E(K,2*PI)
%        = R1 * Integral ( 0 <= T <= 2*PI ) sqrt ( 1 - E**2 * sin**2 ( T ) ) dT
%
%    This integral can be approximated by the Gauss-Kummer formula.
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
%    29 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Harris and Horst Stocker,
%    Handbook of Mathematics and Computational Science,
%    Springer, 1998.
%
%  Parameters:
%
%    Input, real R1, R2, the major and minor semi-axes.
%
%    Output, real VALUE, the circumference of the ellipse.
%
  if ( r1 == r2 ) then
    value = 2.0 * pi * r1;
    return
  end 
%
%  Compute the eccentricity of the ellipse.
%
  e = sqrt ( 1.0 - ( min ( r1, r2 ) / max ( r1, r2 ) )^2 );

  value = 1.0;
  term = value;
  i = 0;

  while ( 1 )

    i = i + 1;
    term = term * ( 2 * i - 3 ) * ( 2 * i - 1 ) * e * e / ( 2 * 2 * i * i );

    if ( abs ( term ) <= eps * ( abs ( value ) + 1.0 ) )
      break
    end

    value = value + term;

  end

  value = 2.0 * pi * max ( r1, r2 ) * value;

  return
end
