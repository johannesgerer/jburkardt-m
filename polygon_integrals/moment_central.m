function mu_pq = moment_central ( n, x, y, p, q )

%*****************************************************************************80
%
%% MOMENT_CENTRAL computes central moments of a polygon.
%
%  Discussion:
%
%    The central moment Mu(P,Q) is defined by
%
%      Mu(P,Q) = Integral ( polygon ) (x-Alpha(1,0))^p (y-Alpha(0,1))^q dx dy
%              / Area ( polygon )
%
%    where
%
%      Alpha(1,0) = Integral ( polygon ) x dx dy / Area ( polygon )
%      Alpha(0,1) = Integral ( polygon ) y dx dy / Area ( polygon )
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
%    Output, real MU_PQ, the unnormalized moment Mu(P,Q).
%
  alpha_10 = moment_normalized ( n, x, y, 1, 0 );
  alpha_01 = moment_normalized ( n, x, y, 0, 1 );

  mu_pq = 0.0;

  for i = 0 : p
    for j = 0 : q

      alpha_ij = moment_normalized ( n, x, y, i, j );

      mu_pq = mu_pq + r8_mop ( p + q - i - j ) ...
        * r8_choose ( p, i ) * r8_choose ( q, j ) ...
        * alpha_10 ^ ( p - i ) * alpha_01 ^ ( q - j ) * alpha_ij;

    end
  end

  return
end
