function qoi_quad ( )

%*****************************************************************************80
%
%% QOI_QUAD seeks the expected value of a quantity of interest.
%
%  Discussion:
%
%    Our base value for DELTA_BASE is 0.01.
%
%    Our quantity of interest Q is the time at which the solution achieves
%    the value 0.99.
%
%    Our parameter U is uniformly distributed in [-1,+1], and determines
%    our actual value of DELTA by
%
%      DELTA = 2^U * DELTA_BASE.
%
%    We seek the expected value of Q, which we define as:
%
%      E(Q) = Integral ( -1 <= U <= +1 ) Q(Y(DELTA(U))) rho(U) dU
%
%    where 
%
%      rho(U) = 1/2;
%      DELTA(U) = 2^U * DELTA_BASE;
%      Y(DELTA()) is the solution of the combustion ODE for an initial
%        condition of DELTA;
%      Q(Y) is the (first) time T* at which the solution Y(T*) = 0.99.
%
%    We approximate the integral using a Clenshaw-Curtis quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2013
%
%  Author:
%
%    John Burkardt
%
  delta_base = 0.01;
  n_max = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QOI_QUAD\n' );
  fprintf ( 1, '  Use quadrature to estimate the expected value of our\n' );
  fprintf ( 1, '  quantity of interest Q, the time at which the\n' );
  fprintf ( 1, '  combustion solution reaches 0.99.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using Clenshaw-Curtis quadrature of orders 1 through %d\n', n_max );
%
%  Set up an option to have ODE45 return when the solution reached 0.99.
%
  options = odeset ( 'EVENTS', @event_function );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   N      Estimated Q\n' );
  fprintf ( 1, '\n' );

  for n = 1 : n_max

    [ x, w ] = clenshaw_curtis_compute ( n );

    f = zeros ( n, 1 );

    for j = 1 : n
%
%  Uniformly select 
%    U, the logarithm base 2, between -1 and +1, of
%    F, a factor between 1/2 and 2, which multiplies 
%    DELTA_BASE, the base value, which gives us
%    DELTA, the initial size of the flame.
%
      u = x(j);
      factor = 2^u;
      delta = factor * delta_base;
%
%  Set the starting point.
%
      t_start = 0.0;
      y_start(1,1) = delta;
%
%  Get the stopping point.
%
      t_stop = 250.0;
%
%  Call ODE45 to solve the problem, stopping immediately if the event 
%  (y=0.99) is observed.
%
      t_span = [ t_start, t_stop ];

      [ t, y ] = ode45 ( @flame_fun, t_span, y_start, options );
%
%  Our function must be weighted by rho(u), which is uniformly 1/2.
%
      f(j) = 0.5 * t(end);

    end
%
%  Compute the integral estimate.
%
    q = w' * f;

    fprintf ( 1, '  %2d  %12g\n', n, q );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QOI_QUAD\n' );
  fprintf ( 1, '  Normal end of execution\n' );

  return
end
