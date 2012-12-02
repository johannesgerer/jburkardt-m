function value = i4_ceiling ( x )

%*****************************************************************************80
%
%% I4_CEILING rounds an R8 up to the next I4.
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
%    Output, integer VALUE, the rounded value of X.
%
  value = ceil ( x );

  return
end
