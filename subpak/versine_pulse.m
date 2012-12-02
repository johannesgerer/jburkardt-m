function value = versine_pulse ( t, ta, tb, v1, amp )

%*****************************************************************************80
%
%% VERSINE_PULSE adds a versine pulse to a constant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T, the current time.
%
%    Input, real TA, the time at which the pulse begins.
%
%    Input, real TB, the time at which the pulse finishes.
%
%    Input, real V1, the constant value.
%
%    Input, real AMP, the amplitude of the pulse.
%
%    Output, real VALUE, the value of the signal at time T.
%
  value = v1 + ( ta <= t && t <= tb ) * ...
    ( 0.5 * amp * ( 1.0 - cos ( 2.0 * pi * ( t - ta ) / ( tb - ta ) ) ) );

  return
end


