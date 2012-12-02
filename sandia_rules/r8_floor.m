function value = r8_floor ( x )

%*****************************************************************************80
%
%% R8_FLOOR rounds an R8 "down" (towards -oo) to the next integer.
%
%  Example:
%
%    X         Value
%
%   -1.1      -2
%   -1.0      -1
%   -0.9      -1
%   -0.1      -1
%    0.0       0
%    0.1       0
%    0.9       0
%    1.0       1
%    1.1       1
%    2.9       2
%    3.0       3
%    3.14159   3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the value to be rounded down.
%
%    Output, real VALUE, the rounded value.
%
  value = round ( x );

  if ( x < value ) 
    value = value - 1;
  end

  return
end
