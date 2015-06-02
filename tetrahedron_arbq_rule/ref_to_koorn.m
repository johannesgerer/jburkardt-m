function u = ref_to_koorn ( r )

%*****************************************************************************80
%
%% REF_TO_KOORN maps points from the reference to Koornwinder's tetrahedron.
%
%  Discussion:
%
%    The reference tetrahedron has vertices:
%
%  (-1, -1/Sqrt(3), -1/Sqrt(6) )
%  ( 0,  2/Sqrt(3), -1/Sqrt(6) )
%  ( 1, -1/Sqrt(3), -1/Sqrt(6) )
%  ( 0,  0,      3/Sqrt(6) )
%
%    Koornwinder's tetrahedron has vertices:
%
%  ( -1, -1, -1 )
%  ( -1, +1, -1 )
%  ( +1, -1, -1 )
%  ( -1, -1, +1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R(3), the coordinates of a point in the
%    reference tetrahedron.
%
%    Output, real U(3), the coordinates of the point in
%    the Koornwinder tetrahedron.
%
  s3 = sqrt ( 3.0 );
  s6 = sqrt ( 6.0 );

  a10 = - 0.5;
  a11 =   1.0;
  a12 = - 1.0 / s3;
  a13 = - 1.0 / s6;

  a20 = - 0.5;
  a21 =   0.0;
  a22 =   2.0 / s3;
  a23 = - 1.0 / s6;

  a30 = - 0.5;
  a31 =   0.0;
  a32 =   0.0;
  a33 =   0.5 * s6;

  u(1) = a10 + a11 * r(1) + a12 * r(2) + a13 * r(3);
  u(2) = a20 +              a22 * r(2) + a23 * r(3);
  u(3) = a30 +                           a33 * r(3);

  return
end
