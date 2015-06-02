function z = f_two ( x )

%*****************************************************************************80
%
%% F_TWO evaluates a function whose integral over the unit hypercube is 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the arguments.
%
%    Output, real Z, the function value.
%
  m = length ( x );

  z = ( 1 + 1 / m ) ^ m * ( prod ( x(1:m) ) ) ^ ( 1 / m );

  return
end
