function f = cosine_sum ( x )

%*****************************************************************************80
%
%% COSINE_SUM evaluates a function which is a cosine sum.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real F, the value.
%
  f =     cos (       x ) ...
    + 5 * cos ( 1.6 * x ) ...
    - 2 * cos ( 2.0 * x ) ...
    + 5 * cos ( 4.5 * x ) ...
    + 7 * cos ( 9.0 * x );

  return
end

