function area = sphere_cap_area_nd ( dim_num, r, h )

%*****************************************************************************80
%
%% SPHERE_CAP_AREA_ND computes the area of a spherical cap in ND.
%
%  Discussion:
%
%    The spherical cap is a portion of the surface of the sphere:
%
%      sum ( X(1:N)**2 ) = R**2
%
%    which is no more than H units from the uppermost point on the sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Thomas Ericson and Victor Zinoviev,
%    Codes on Euclidean Spheres,
%    Elsevier, 2001, pages 439-441.
%    QA166.7 E75
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
%    Output, real AREA, the area of the spherical cap.
%
  if ( h <= 0.0 )
    area = 0.0;
    return
  end

  if ( 2.0 * r <= h )
    area = sphere_imp_area_nd ( dim_num, r );
    return
  end
%
%  For cases where R < H < 2 * R, work with the complementary region.
%
  haver_sine = sqrt ( ( 2.0 * r - h ) * h );

  theta = r8_asin ( haver_sine / r );

  if ( dim_num < 1 )

    area = -1.0;

  elseif ( dim_num == 1 )

    area = 0.0;

  elseif ( dim_num == 2 )

    area = 2.0 * theta * r;

  else

    ti = theta;

    tj = ti;
    ti = 1.0 - cos ( theta );

    for i = 2 : dim_num-2
      tk = tj;
      tj = ti;
      ti = ( ( i - 1 ) * tk - cos ( theta ) * sin ( theta )^( i - 1 ) ) / i;
    end

    area = sphere_k ( dim_num-1 ) * ti * r^( dim_num - 1 );

  end
%
%  Adjust for cases where R < H < 2R.
%
  if ( r < h )
    area2 = sphere_imp_area_nd ( dim_num, r );
    area = area2 - area;
  end

  return
end
