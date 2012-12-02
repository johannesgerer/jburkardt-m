function [ o, x, w ] = en_her_01_1 ( n )

%*****************************************************************************80
%
%% EN_HER_01_1 implements the Stroud rule 1.1 for region EN_HER.
%
%  Discussion:
%
%    The rule has order O = 1.
%
%    The rule has precision P = 1.
%
%    EN_HER is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = 1;
  volume = sqrt ( pi^n );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  1 point.
%
  k = k + 1;
% x(1:n,k) = 0.0;
  w(k) = volume;

  return
end
