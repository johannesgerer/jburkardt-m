function value = p03_f ( n, x )

%*****************************************************************************80
%
%% P03_F evaluates the function for problem p03.
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
  value = x .* ( 10 * x - 1.0 ) .* ( 5 * x - 2.0 ) .* ( 5 * x - 2.0 ) ...
    .* ( 4 * x - 3.4 ) .* ( x - 1 );

  return
end
