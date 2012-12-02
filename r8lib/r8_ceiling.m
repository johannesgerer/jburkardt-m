function value = r8_ceiling ( x )

%*****************************************************************************80
%
%% R8_CEILING rounds an R8 up to the nearest integral R8.
%
%  Example:
%
%    X         Value
%
%   -1.1      -1.0
%   -1.0      -1.0
%   -0.9       0.0
%   -0.1       0.0
%    0.0       0.0
%    0.1       1.0
%    0.9       1.0
%    1.0       1.0
%    1.1       2.0
%    2.9       3.0
%    3.0       3.0
%    3.14159   4.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 November 2011
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
  value = ceil ( x );

  return
end
