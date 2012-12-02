function angle = vector_directions_nd ( dim_num, v )

%*****************************************************************************80
%
%% VECTOR_DIRECTIONS_ND returns the direction angles of a vector in ND.
%
%  Discussion:
%
%    Let V be the vector, and let E(I) be the I-th unit coordinate axis vector.
%    The I-th direction angle is the angle between V and E(I), which is
%    the angle whose cosine is equal to the direction cosine:
%
%      Direction_Cosine(I) = V dot E(I) / |V|.
%
%    If V is the null or zero vector, then the direction cosines and
%    direction angles are undefined, and this routine simply returns
%    zeroes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real V(DIM_NUM), the vector.
%
%    Output, real ANGLE(DIM_NUM), the direction angles, in radians,
%    that the vector V makes with the coordinate axes.
%

%
%  Get the norm of the vector.
%
  vnorm = sqrt ( sum ( ( v(1:dim_num) ).^2 ) );

  if ( vnorm == 0.0 )
    angle(1:dim_num) = 0.0;
    return
  end

  for i = 1 : dim_num
    angle(1:dim_num) = acos ( v(1:dim_num) / vnorm );
  end

  return
end
