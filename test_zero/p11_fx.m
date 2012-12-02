function fx = p11_fx ( x )

%*****************************************************************************80
%
%% P11_FX evaluates the Pinhead.
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
  epsilon = 0.00001;

  fx = ( 16.0 - x.^4 ) ./ ( 16.0 * x.^4 + epsilon );

  return
end
