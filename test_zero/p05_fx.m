function fx = p05_fx ( x )

%*****************************************************************************80
%
%% P05_FX evaluates ( x + 3 ) * ( x - 1 )^2.
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
  fx = ( x + 3.0 ) .* ( x - 1.0 ) .* ( x - 1.0 );

  return
end
