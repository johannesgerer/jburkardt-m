function [ xtab, weight ] = ncc_rule ( norder )

%*****************************************************************************80
%
%% NCC_RULE computes the coefficients of a Newton-Cotes closed quadrature rule.
%
%  Discussion:
%
%    For the interval [-1,1], the Newton-Cotes quadrature rule estimates
%
%      Integral ( -1 <= X <= 1 ) F(X) dX
%
%    using NORDER equally spaced abscissas XTAB(I) and a weight vector
%    WEIGHT(I):
%
%      Sum ( 1 <= I <= N ) WEIGHT(I) * F ( XTAB(I) ).
%
%    For the CLOSED rule, the abscissas include A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NORDER, the order of the rule.
%
%    Output, real XTAB(NORDER), the abscissas of the rule.
%
%    Output, real WEIGHT(NORDER), the weights of the rule.
%

%
%  Compute a closed quadrature rule.
%
  a = -1.0;
  b =  1.0;

  for i = 1 : norder
    xtab(i) = ( ( norder - i     ) * a   ...
              + (          i - 1 ) * b ) ...
              / ( norder - 1     );
  end

  weight = nc_rule ( norder, a, b, xtab );

  return
end
