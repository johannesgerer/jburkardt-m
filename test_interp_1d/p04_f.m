function value = p04_f ( n, x )

%*****************************************************************************80
%
%% P04_F evaluates the function for problem p04.
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
%    06 August 2012
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
  value = atan ( 40 * x - 15 );

  return
end
