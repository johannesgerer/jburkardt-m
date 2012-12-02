function fx = p14_fx ( x )

%*****************************************************************************80
%
%% P14_FX evaluates the Camel.
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
  fx =   1.0 ./ ( ( x - 0.3 ).^2 + 0.01 ) ...
       + 1.0 ./ ( ( x - 0.9 ).^2 + 0.04 ) ...
       + 2.0 * x - 5.2;

  return
end
