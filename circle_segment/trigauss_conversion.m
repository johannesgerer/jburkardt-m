function tw = trigauss_conversion ( xw, omega )

%*****************************************************************************80
%
%% TRIGAUSS_CONVERSION converts Gauss to trigonometric Gauss quadrature.
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    Gaspare Da Fies, Alvise Sommariva, Marco Vianello
%
%  Parameters:
%
%    Input, real XW(N,2), the points and weights of a Gauss quadrature rule
%    on [-1,+1].
%
%    Input, real OMEGA, the arc angle, 0 < OMEGA <= PI.
%
%    Output, real TW(N,2), the angles and weights for the trigonometic
%    quadrature rule over [-OMEGA,+OMEGA].
%
  tw(:,1) = 2.0 * asin ( sin ( omega / 2.0 ) * xw(:,1) );
  tw(:,2) = xw(:,2);

  return
end

