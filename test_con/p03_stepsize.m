function [ h, hmin, hmax ] = p03_stepsize ( option )

%*****************************************************************************80
%
%% P03_STEPSIZE returns step sizes for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Output, real H, HMIN, HMAX, suggested values for the
%    initial step, the minimum step, and the maximum step.
%
  h =    0.50000;
  hmin = 0.00025;
  hmax = 3.00000;

  return
end
