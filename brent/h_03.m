function value = h_03 ( x )

%*****************************************************************************80
%
%% H_03 evaluates x^3+x^2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the point at which F is to be evaluated.
%
%    Output, real VALUE, the value of the function at X.
%
  value = x .* x .* ( x + 1.0 );

  return
end
