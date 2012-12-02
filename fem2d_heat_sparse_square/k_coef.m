function k = k_coef ( n, x, y, time )

%*****************************************************************************80
%
%% K_COEF evaluates the coefficient K(X,Y,T) function.
%
%  Discussion:
%
%    We assume that the equation to be solved is
%
%      dUdT - Laplacian U + K * U = F
%
%    with K = 0, and F = (2*pi*pi-1)*sin(pi*x)*sin(pi*y)*exp(-t).
%
%    The exact solution is:
%
%      U = sin(pi*x) * sin(pi*y) * exp(-t)
%
%  Modified:
%
%    29 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), Y(N), the coordinates of the points.
%
%    Input, real TIME, the current time (assumed to be
%    the initial time).
%
%    Output, real K(N), the value of the coefficient.
%
  k(1:n) = 0.0;

  return
end
