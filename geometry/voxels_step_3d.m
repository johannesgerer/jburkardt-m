function v3 = voxels_step_3d ( v1, v2, inc, jnc, knc )

%*****************************************************************************80
%
%% VOXELS_STEP_3D computes voxels along a line from a given point in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer V1(3), the coordinates of the base voxel from
%    which the line begins.
%
%    Input, integer V2(3), the coordinates of the current voxel
%    on the line.  For the first call, these might be equal to V1.
%
%    Input, integer INC, JNC, KNC, the increments to the voxels.
%    These values define the direction along which the line proceeds.
%    However, the voxels on the line will typically be incremented
%    by a fractional value of the vector (INC,JNC,KNC), and the
%    result is essentially rounded.
%
%    Output, integer V3(3), the coordinates of the next voxel along
%    the line.
%
  dim_num = 3;

  v3(1:dim_num) = v2(1:dim_num);
%
%  Assuming for the moment that (I,J,K) can take on real values,
%  points on the line have the form:
%
%    I = V1(2) + alpha * inc
%    J = V1(2) + alpha * jnc
%    K = V1(3) + alpha * knc
%
  if ( inc == 0 & jnc == 0 & knc == 0 )
    return
  end

  alpha = 0.0;
%
%  Compute the smallest ALPHA that will change one of V2(1:3) by +-0.5.
%
  if ( 0 < inc )
    alphai = ( ( v2(1) - v1(1) ) + 0.5 ) / inc;
  elseif ( inc < 0 )
    alphai = ( ( v2(1) - v1(1) ) - 0.5 ) / inc;
  else
    alphai = Inf;
  end

  if ( 0 < jnc )
    alphaj = ( ( v2(2) - v1(2) ) + 0.5 ) / jnc;
  elseif ( jnc < 0 )
    alphaj = ( ( v2(2) - v1(2) ) - 0.5 ) / jnc;
  else
    alphaj = Inf;
  end

  if ( 0 < knc )
    alphak = ( ( v2(3) - v1(3) ) + 0.5 ) / knc;
  elseif ( knc < 0 )
    alphak = ( ( v2(3) - v1(3) ) - 0.5 ) / knc;
  else
    alphaj = Inf;
  end
%
%  The ALPHA of smallest positive magnitude represents the closest next voxel.
%
  alpha = Inf;

  if ( 0.0 < alphai )
    alpha = min ( alpha, alphai );
  end

  if ( 0.0 < alphaj )
    alpha = min ( alpha, alphaj );
  end

  if ( 0.0 < alphak )
    alpha = min ( alpha, alphak );
  end
%
%  Move to the new voxel.  Whichever index just made the half
%  step must be forced to take a whole step.
%
  if ( alpha == alphai )
    v3(1) = v2(1) + r8_sign ( inc );
    v3(2) = v1(2) + round ( alpha * jnc );
    v3(3) = v1(3) + round ( alpha * knc );
  elseif ( alpha == alphaj )
    v3(1) = v1(1) + round ( alpha * inc );
    v3(2) = v2(2) + r8_sign ( jnc );
    v3(3) = v1(3) + round ( alpha * knc );
  elseif ( alpha == alphak )
    v3(1) = v1(1) + round ( alpha * inc );
    v3(2) = v1(2) + round ( alpha * jnc );
    v3(3) = v2(3) + r8_sign ( knc );
  end

  return
end
