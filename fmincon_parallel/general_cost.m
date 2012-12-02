function val = general_cost(z, PAR)

%*****************************************************************************80
%
%% GENERAL_COST evaluates the cost function for a test example.
%
%  Discussion:
%
%    The example is based on a Zermelo problem with
%   piecewise constant steering control.
%
%  Modified:
%
%    04 February 2010
%
%  Author:
%
%    Gene Cliff
%
  xi = PAR.x0;%  set initial condition

%% loop over intervals - the control is piecewise constant

  for jj=1:length(z)
      hndl_rhs = @(t, x) feval(PAR.rhs, t, x, z(jj), PAR);
      [T, X] = ode23(hndl_rhs, [PAR.ta(jj) PAR.ta(jj+1)], xi);
      xi = X(end,:)';
  end

  val = feval(PAR.cost, xi); % evaluate the cost functional

  assignin('base', 'XI', xi);      % save the final state

  return
end
