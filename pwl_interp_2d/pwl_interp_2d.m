function zi = pwl_interp_2d ( nxd, nyd, xd, yd, zd, ni, xi, yi )

%*****************************************************************************80
%
%% PWL_INTERP_2D: piecewise linear interpolant to data defined on a 2D grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NXD, NYD, the number of X and Y data values.
%
%    Input, real XD(NXD), YD(NYD), the sorted X and Y data.
%
%    Input, real ZD(NXD,NYD), the Z data.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI), YI(NI), the coordinates of the
%    interpolation points.
%
%    Output, real ZI(NI), the value of the interpolant.
%
  zi = zeros ( ni, 1 );

  for k = 1 : ni

    i = r8vec_bracket5 ( nxd, xd, xi(k) );
    if ( i == -1 )
      zi(k) = r8_huge ( );
      continue
    end

    j = r8vec_bracket5 ( nyd, yd, yi(k) );
    if ( j == -1 )
      zi(k) = r8_huge ( );
      continue
    end

    if ( yi(k) < yd(j+1) ...
      + ( yd(j) - yd(j+1) ) * ( xi(i) - xd(i) ) / ( xd(i+1) - xd(i) ) )

      dxa = xd(i+1) - xd(i);
      dya = yd(j)   - yd(j);

      dxb = xd(i)   - xd(i);
      dyb = yd(j+1) - yd(j);

      dxi = xi(k)   - xd(i);
      dyi = yi(k)   - yd(j);

      det = dxa * dyb - dya * dxb;

      alpha = ( dxi * dyb - dyi * dxb ) / det;
      beta =  ( dxa * dyi - dya * dxi ) / det;
      gamma = 1.0 - alpha - beta;

      zi(k) = alpha * zd(i+1,j) + beta * zd(i,j+1) + gamma * zd(i,j);

    else

      dxa = xd(i)   - xd(i+1);
      dya = yd(j+1) - yd(j+1);

      dxb = xd(i+1) - xd(i+1);
      dyb = yd(j)   - yd(j+1);

      dxi = xi(k)   - xd(i+1);
      dyi = yi(k)   - yd(j+1);

      det = dxa * dyb - dya * dxb;

      alpha = ( dxi * dyb - dyi * dxb ) / det;
      beta =  ( dxa * dyi - dya * dxi ) / det;
      gamma = 1.0 - alpha - beta;

      zi(k) = alpha * zd(i,j+1) + beta * zd(i+1,j) + gamma * zd(i+1,j+1);

    end

  end

  return
end
