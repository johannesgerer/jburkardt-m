function fx = p10_fx ( x )

%*****************************************************************************80
%
%% P10_FX evaluates the Repeller.
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
  fx = 20.0 * x ./ ( 100.0 * x .* x + 1.0 );

  return
end
