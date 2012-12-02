function result = p00_gauss_hermite ( problem, order )

%*****************************************************************************80
%
%% P00_GAUSS_HERMITE applies a Gauss-Hermite quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2009
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
  [ xtab, weight ] = hermite_compute ( order );

  option = 1;
  f_vec = p00_fun ( problem, option, order, xtab );

  result = weight(1:order)' * f_vec(1:order);

  return
end
