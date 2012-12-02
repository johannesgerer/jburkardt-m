function phi = basis_brick27 ( n, p )

%*****************************************************************************80
%
%% BASIS_BRICK20: BRICK20 basis functions at natural coordinates.
%
%  Discussion:
%
%        8----19---7
%       /|         /
%     20 |   26   /|
%     /          / |
%    5----17----6  |
%    |   |      |  |
%    |  16---24-|-15
%    |  /|      | /|
%    |25 |  27  |23|        t
%    |/         |/ |        |   s
%   13----22---14  |        |  /
%    |   |      |  |        | /
%    |   |      |  |        |/
%    |   4--11--|--3        0---------r
%    |  /       | /
%    | 12   21  |10
%    |/         |/
%    1----9-----2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(3,N), natural coordinates of evaluation points.
%
%    Output, real PHI(27,N), the basis function values.
%
  rm(1:n) = p(1,1:n) + 1.0;
  rz(1:n) = p(1,1:n);
  rp(1:n) = p(1,1:n) - 1.0;

  sm(1:n) = p(2,1:n) + 1.0;
  sz(1:n) = p(2,1:n);
  sp(1:n) = p(2,1:n) - 1.0;

  tm(1:n) = p(3,1:n) + 1.0;
  tz(1:n) = p(3,1:n);
  tp(1:n) = p(3,1:n) - 1.0;

  phi(1,1:n)  =         rz .* rp       .* sz .* sp       .* tz .* tp / 8.0;
  phi(2,1:n)  =   rm .* rz             .* sz .* sp       .* tz .* tp / 8.0;
  phi(3,1:n)  =   rm .* rz       .* sm .* sz             .* tz .* tp / 8.0;
  phi(4,1:n)  =         rz .* rp .* sm .* sz             .* tz .* tp / 8.0;
  phi(5,1:n)  =         rz .* rp       .* sz .* sp .* tm .* tz       / 8.0;
  phi(6,1:n)  =   rm .* rz             .* sz .* sp .* tm .* tz       / 8.0;
  phi(7,1:n)  =   rm .* rz       .* sm .* sz       .* tm .* tz       / 8.0;
  phi(8,1:n)  =         rz .* rp .* sm .* sz       .* tm .* tz       / 8.0;

  phi(9,1:n)  = - rm       .* rp       .* sz .* sp       .* tz .* tp / 4.0;
  phi(10,1:n) = - rm .* rz       .* sm       .* sp       .* tz .* tp / 4.0;
  phi(11,1:n) = - rm       .* rp .* sm .* sz             .* tz .* tp / 4.0;
  phi(12,1:n) = -       rz .* rp .* sm       .* sp       .* tz .* tp / 4.0;
  phi(13,1:n) = -       rz .* rp       .* sz .* sp .* tm       .* tp / 4.0;
  phi(14,1:n) = - rm .* rz             .* sz .* sp .* tm       .* tp / 4.0;
  phi(15,1:n) = - rm .* rz       .* sm .* sz       .* tm       .* tp / 4.0;
  phi(16,1:n) = -       rz .* rp .* sm .* sz       .* tm       .* tp / 4.0;
  phi(17,1:n) = - rm       .* rp       .* sz .* sp .* tm .* tz       / 4.0;
  phi(18,1:n) = - rm .* rz       .* sm       .* sp .* tm .* tz       / 4.0;
  phi(19,1:n) = - rm       .* rp .* sm .* sz       .* tm .* tz       / 4.0;
  phi(20,1:n) = -       rz .* rp .* sm       .* sp .* tm .* tz       / 4.0;

  phi(21,1:n) =   rm       .* rp .* sm       .* sp       .* tz .* tp / 2.0;
  phi(22,1:n) =   rm       .* rp       .* sz .* sp .* tm       .* tp / 2.0;
  phi(23,1:n) =   rm .* rz       .* sm       .* sp .* tm       .* tp / 2.0;
  phi(24,1:n) =   rm       .* rp .* sm .* sz       .* tm       .* tp / 2.0;
  phi(25,1:n) =         rz .* rp .* sm       .* sp .* tm       .* tp / 2.0;
  phi(26,1:n) =   rm       .* rp .* sm       .* sp .* tm .* tz       / 2.0;

  phi(27,1:n) = - rm       .* rp .* sm       .* sp .* tm       .* tp;

  return
end
