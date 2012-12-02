function nu_pq = moment ( n, x, y, p, q )

%*****************************************************************************80
%
%% MOMENT computes an unnormalized moment of a polygon.
%
%  Discussion:
%
%    Nu(P,Q) = Integral ( x, y in polygon ) x^p y^q dx dy
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carsten Steger,
%    On the calculation of arbitrary moments of polygons,
%    Technical Report FGBV-96-05,
%    Forschungsgruppe Bildverstehen, Informatik IX,
%    Technische Universitaet Muenchen, October 1996.
%
%  Parameters:
%
%    Input, integer N, the number of vertices of the polygon.
%
%    Input, real X(N), Y(N), the vertex coordinates.
%
%    Input, integer P, Q, the indices of the moment.
%
%    Output, real NU_PQ, the unnormalized moment Nu(P,Q).
%
  nu_pq = 0.0;

  xj = x(n);
  yj = y(n);

  for i = 1 : n

    xi = x(i);
    yi = y(i);

    s_pq = 0.0;

    for k = 0 : p
      for l = 0 : q
        s_pq = s_pq ...
          + r8_choose ( k + l, l ) * r8_choose ( p + q - k - l, q - l ) ...
          * xi ^ k * xj ^ ( p - k ) ...
          * yi ^ l * yj ^ ( q - l );
      end
    end

    nu_pq = nu_pq + ( xj * yi - xi * yj ) * s_pq;

    xj = xi;
    yj = yi;

  end

  nu_pq = nu_pq / ( p + q + 2 ) / ( p + q + 1 ) / r8_choose ( p + q, p );

  return
end
