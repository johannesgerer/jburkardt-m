function dy = ode_system(t, y, m, b, k)

%*****************************************************************************80
%
%% ODE_SYSTEM evaluates the right hand side of the ODE.
%
%  Discussion:
%
%    The second order ODE:
%
%      m * x'' + b * x' + k * x = 0
%
%    is transformed into a pair of first order ODE's
%    using the variables:
%
%
%      y(1) = x,
%      y(2) = x'
%
%    so that
%
%      y'(1) = y(2)
%      y'(2) = - ( k / m ) y(1) - ( b / m ) y(2)
%      
%  Modified:
%
%    01 March 2010
%
%  Parameters:
%
%    Input, real T, the current time.
%
%    Input, real Y(2), the current solution.
%
%    Input, real M, B, K, the mass, damping and stiffness constants.
%
%    Output, real DY(2,1), the right hand sides of the ODE's,
%    returned as a column vector.
%
  dy(1,1) = y(2);
  dy(2,1) = - ( k / m ) * y(1) - ( b / m ) * y(2);

  return
end

