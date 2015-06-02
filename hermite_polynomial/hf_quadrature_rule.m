function [ t, wts ] = hf_quadrature_rule ( nt )

%*****************************************************************************80
%
%% HF_QUADRATURE_RULE: quadrature for Hf(i,x).
%
%  Discussion:
%
%    Hf(I,X) represents the Hermite function of "degree" I.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, the order of the rule.
%
%    Output, real T(NT,1), WTS(NT,1), the points and weights of the rule.
%
  aj = zeros ( nt, 1 );
  bj = sqrt ( ( 1 : nt )' / 2.0 );
  wts = zeros ( nt, 1 );
  wts(1,1) = sqrt ( sqrt ( pi ) );

  [ t, wts ] = imtqlx ( nt, aj, bj, wts );

  wts(1:nt,1) = wts(1:nt,1).^2 .* exp ( t(1:nt,1).^2 );

  return
end

