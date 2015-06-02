function volume = sphere_cap_volume_nd ( dim_num, r, h )

%*****************************************************************************80
%
%% SPHERE_CAP_VOLUME_ND computes the volume of a spherical cap in ND.
%
%  Discussion:
%
%    The spherical cap is a portion of the surface and interior of the sphere:
%
%      sum ( X(1:N)^2 ) <= R * R
%
%    which is no more than H units from some point P on the sphere.
%
%
%    The algorithm proceeds from the observation that the N-dimensional
%    sphere can be parameterized by a quantity RC that runs along the
%    radius from the center to the point P.  The value of RC at the
%    base of the spherical cap is (R-H) and at P it is R.  We intend to
%    use RC as our integration parameeter.
%
%    The volume of the spherical cap is then the integral, as RC goes
%    from (R-H) to R, of the N-1 dimensional volume of the sphere
%    of radius RS, where RC * RC + RS * RS = R * R.
%
%    The volume of the N-1 dimensional sphere of radius RS is simply 
%    some constants times RS**(N-1).
% 
%    After factoring out the constant terms, and writing RC = R * cos ( T ),
%    and RS = R * sin ( T ), and letting 
%      T_MAX = arc_sine ( sqrt ( ( 2.0 * r - h ) * h / r ) ),
%    the "interesting part" of our integral becomes
%
%      constants * R^N * Integral ( T = 0 to T_MAX ) sin^N ( T ) dT
%
%    The integral of sin^N ( T ) dT can be handled by recursion.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, real R, the radius of the sphere.
%
%    Input, real H, the "thickness" of the spherical cap,
%    which is normally between 0 and 2 * R.
%
%    Output, real VOLUME, the volume of the spherical cap.
%
  if ( h <= 0.0 )
    volume = 0.0;
    return
  end

  if ( 2.0 * r <= h )
    volume = sphere_volume_nd ( dim_num, r );
    return
  end

  if ( dim_num < 1 )

    volume = -1.0;

  elseif ( dim_num == 1 )

    volume = h;

  else

    factor1 = sphere_unit_volume_nd ( dim_num - 1 );

    angle = r8_asin ( sqrt ( ( 2.0 * r - h ) * h / r ) );

    factor2 = sin_power_int ( 0.0, angle, dim_num );

    volume = factor1 * factor2 * r^dim_num;

    if ( r < h )
      volume2 = sphere_volume_nd ( dim_num, r );
      volume = volume2 - volume;
    end

  end

  return
end
