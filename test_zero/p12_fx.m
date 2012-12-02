function fx = p12_fx ( x )

%*****************************************************************************80
%
%% P12_FX evaluates Flat Stanley.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2011
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
  factor = 1000.0;

  fx = ( x ~= 0 ) .* ( 2.0 * ( x > 1 ) - 1.0 ) ...
    .* exp ( log ( factor ) + log ( abs ( x - 1.0 ) ) - 1.0 ./ ( x - 1.0 ).^2 );

  return
end
