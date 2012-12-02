function [ t, wts ] = p_quadrature_rule ( nt )

%*****************************************************************************80
%
%% P_QUADRATURE_RULE: quadrature for Legendre function P(n,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, the order of the rule.
%
%    Output, real T(NT), WTS(NT), the points and weights
%    of the rule.
% 
  t = zeros ( nt, 1 );

  bj = zeros ( nt, 1 );
  for i = 1 : nt
    bj(i) = ( i * i ) / ( 4 * i * i - 1 );
  end
  bj(1:nt) = sqrt ( bj(1:nt) );

  wts = zeros ( nt, 1 );
  wts(1) = sqrt ( 2.0 );

  [ t, wts ] = imtqlx ( nt, t, bj, wts );

  wts(1:nt) = wts(1:nt).^2;

  return
end
