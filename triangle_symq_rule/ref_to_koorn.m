function u = ref_to_koorn ( r )

%*****************************************************************************80
%
%% REF_TO_KOORN maps points from the reference to Koornwinder's triangle.
%
%  Discussion:
%
%    The reference triangle has vertices:
%
%      ( -1, -1/sqrt(3) )
%      ( +1, -1/sqrt(3) )
%      (  0, +2/sqrt(3) )
%
%    Koornwinder's triangle has vertices:
%
%      ( -1, -1 )
%      ( +1, -1 )
%      ( -1, +1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R(2), the coordinates of a point in the
%    reference triangle.
%
%    Output, real U(2), the coordinates of the point in
%    the Koornwinder triangle.
%
  a10 = -1.0 / 3.0;
  a11 =  1.0;
  a12 = -1.0 / sqrt ( 3.0 );

  a20 = - 1.0 / 3.0;
  a21 =   0.0;
  a22 =   2.0 * sqrt ( 3.0 ) / 3.0;

  u(1) = a10 + r(1) + a12 * r(2);
  u(2) = a20 +        a22 * r(2);

  return
end
