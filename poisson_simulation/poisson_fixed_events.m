function [ t, w ] = poisson_fixed_events ( lambda, event_num )

%*****************************************************************************80
%
%% POISSON_FIXED_EVENTS simulates the occurrence of a given number of Poisson events.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real LAMBDA, the average number of events per unit time.
%
%    Input, integer EVENT_NUM, the number of events to wait for.
%
%    Output, real T(EVENT_NUM+1), the time at which a total of 0, 1, 2, ...
%    and EVENT_NUM events were observed.
%
%    Output, real W(EVENT_NUM+1), the waiting time until the I-th event
%    occurred.
%

%
%  Poisson waiting times follow an exponential distribution.
%
  w(1) = 0.0;
  w(2:event_num+1) = - log ( rand ( event_num, 1 ) ) / lambda;
%
%  The time til event I is the sum of the waiting times 0 through I.
%
  t(1:event_num+1) = cumsum ( w(1:event_num+1) );

  return
end
