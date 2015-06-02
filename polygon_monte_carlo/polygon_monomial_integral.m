function nu_pq = polygon_monomial_integral ( nv, v, e )

%*****************************************************************************80
%
%% POLYGON_MONOMIAL_INTEGRAL integrates a monomial over a polygon.
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
%    07 April 2014
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
%    Input, integer NV, the number of vertices of the polygon.
%
%    Input, real V(2,NV), the vertex coordinates.
%
%    Input, integer E(2), the exponents of the monomial.
%
%    Output, real NU_PQ, the unnormalized moment Nu(P,Q).
%
  p = e(1);
  q = e(2);

  nu_pq = 0.0;

  xj = v(1,nv);
  yj = v(2,nv);

  for i = 1 : nv

    xi = v(1,i);
    yi = v(2,i);

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
