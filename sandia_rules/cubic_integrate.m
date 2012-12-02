function q = cubic_integrate ( a, b )

%*****************************************************************************80
%
%% CUBIC_INTEGRATE integrates the cubic from A to B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the integration interval.
%
%    Output, real Q, the integral from A to B.
%
  q = cubic_antiderivative ( b ) - cubic_antiderivative ( a );

  return
end
