function value = r8_ceiling ( x )

%*****************************************************************************80
%
%% R8_CEILING rounds an R8 "up" (towards +oo) to the next integer.
%
%  Example:
%
%    X         Value
%
%   -1.1      -1
%   -1.0      -1
%   -0.9       0
%   -0.1       0
%    0.0       0
%    0.1       1
%    0.9       1
%    1.0       1
%    1.1       2
%    2.9       3
%    3.0       3
%    3.14159   4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number to be rounded up.
%
%    Output, real VALUE, the rounded value of X.
%
  value = round ( x );
  if ( value < x )
    value = value + 1;
  end

  return
end
