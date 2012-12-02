function value = p05_f ( n, x )

%*****************************************************************************80
%
%% P05_F evaluates the function for problem p05.
%
%  Discussion:
%
%    Step function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), the evaluation points.
%
%    Output, real VALUE(N,1), the function values.
%
  value =       cos (  7.0 * x ) ...
        + 5.0 * cos ( 11.2 * x ) ...
        - 2.0 * cos ( 14.0 * x ) ...
        + 5.0 * cos ( 31.5 * x ) ...
        + 7.0 * cos ( 63.0 * x );

  return
end
