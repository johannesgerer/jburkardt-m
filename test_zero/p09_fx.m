function fx = p09_fx ( x )

%*****************************************************************************80
%
%% P09_FX evaluates the Newton Baffler.
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
  fx =                  ( x <  6.00 ) * 0.75 .* ( x - 6.25 ) - 0.3125 ...
     + ( 6.00 <= x ) .* ( x <= 6.50 ) * 2.00 .* ( x - 6.25 ) ...
     + ( 6.50 <  x )                  * 0.75 .* ( x - 6.25 ) + 0.3125;

  return
end
