function n = poisson_fixed_time ( lambda, time )

%*****************************************************************************80
%
%% POISSON_FIXED_TIME counts the Poisson events in a fied time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real LAMBDA, the average number of events per unit time.
%
%    Input, real TIME, the amount of time to observe.
%
%    Output, integer N, the number of Poisson events observed.
%
  n = 0;
  t = 0.0;

  while ( t < time )
    dt = - log ( rand ( 1, 1 ) ) / lambda;
    n = n + 1;
    t = t + dt;
  end

  return
end
