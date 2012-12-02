function fx = p06_fx ( x )

%*****************************************************************************80
%
%% P06_FX evaluates exp ( x ) - 2 - 1 / ( 10 * x )^2 + 2 / ( 100 * x )^3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX(*), the value of the function at X.
%
  fx = exp ( x ) - 2.0 - 1.0 ./ ( 10.0 * x ).^2 + 2.0 ./ ( 100.0 * x ).^3;

  return
end
