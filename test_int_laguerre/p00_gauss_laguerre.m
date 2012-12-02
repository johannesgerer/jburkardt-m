function result = p00_gauss_laguerre ( problem, order )

%*****************************************************************************80
%
%% P00_GAUSS_LAGUERRE applies a Gauss-Laguerre rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Input, integer ORDER, the order of the Gauss-Laguerre rule 
%    to apply.
%
%    Output, real RESULT, the approximate integral.
%
  alpha = p00_alpha ( problem );

  alpha2 = 0.0;
  [ xtab, weight ] = laguerre_compute ( order, alpha2 );

  xtab(1:order) = xtab(1:order) + alpha;

  f_vec = p00_fun ( problem, order, xtab );
%
%  The Gauss-Laguerre rule assumes a weight of EXP(-X).
%
%  We need to multiply each F(X) by EXP(X) to implicitly 
%  adjust for this weight.
%
  f_vec(1:order) = f_vec(1:order) .* exp ( xtab(1:order) );

  result = exp ( -alpha ) * weight(1:order) * f_vec(1:order)';

  return
end
