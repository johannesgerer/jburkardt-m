function value = poly5 ( x )

%*****************************************************************************80
%
%% POLY5 evaluates a particular fifth-degree polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the value of the polynomial at X.
%
  value = ( x - 0.1 ) .* ...
          ( x - 0.2 ) .* ...
          ( x - 0.4 ) .* ...
          ( x - 2.1 ) .* ...
          ( x - 3.0 );

  return
end
