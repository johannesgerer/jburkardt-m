function phy = reference_to_physical_t6 ( t, n, ref )

%*****************************************************************************80
%
%% REFERENCE_TO_PHYSICAL_T6 maps T6 reference points to physical points.
%
%  Discussion:
%
%    Given the vertices of an order 6 physical triangle and a point
%    (XSI,ETA) in the reference triangle, the routine computes the value
%    of the corresponding image point (X,Y) in physical space.
%
%    The mapping from (XSI,ETA) to (X,Y) has the form:
%
%      X(ETA,XSI) = A1 * XSI**2 + B1 * XSI*ETA + C1 * ETA**2
%                 + D1 * XSI    + E1 * ETA     + F1
%
%      Y(ETA,XSI) = A2 * XSI**2 + B2 * XSI*ETA + C2 * ETA**2
%                 + D2 * XSI    + E2 * ETA     + F2
%
%  Reference Element T6:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  6  5
%    |  |   \
%    |  |    \
%    0  1--4--2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,6), the coordinates of the vertices.
%    The vertices are assumed to be the images of (0,0), (1,0),
%    (0,1),(1/2,0), (1/2,1/2) and (0,1/2) respectively.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real REF(2,N), points in the reference triangle.
%
%    Output, real PHY(2,N), corresponding points in the
%    physical triangle.
%
  for i = 1 : 2

    a(i) =   2.0 * t(i,1) + 2.0 * t(i,2)                ...
           - 4.0 * t(i,4);

    b(i) =   4.0 * t(i,1)                               ...
           - 4.0 * t(i,4) + 4.0 * t(i,5) - 4.0 * t(i,6);

    c(i) =   2.0 * t(i,1)                + 2.0 * t(i,3) ...
                                         - 4.0 * t(i,6);

    d(i) = - 3.0 * t(i,1) -       t(i,2)                ...
           + 4.0 * t(i,4);

    e(i) = - 3.0 * t(i,1)                -       t(i,3) ...
                                         + 4.0 * t(i,6);
    f(i) =         t(i,1);

  end

  for i = 1 : 2
    phy(i,1:n) = a(i) * ref(1,1:n) .* ref(1,1:n) ...
               + b(i) * ref(1,1:n) .* ref(2,1:n) ...
               + c(i) * ref(2,1:n) .* ref(2,1:n) ...
               + d(i) * ref(1,1:n) ...
               + e(i) * ref(2,1:n) ...
               + f(i);
  end

  return
end
