function [ h, hmin, hmax ] = p17_stepsize ( option )

%*****************************************************************************80
%
%% P17_STEPSIZE returns step sizes for problem 17.
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
  h =    1.000;
  hmin = 0.001;
  hmax = 2.000;

  return
end
