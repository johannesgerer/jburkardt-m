function zermelo_plot ( z_star, PAR )

%*****************************************************************************80
%
%% ZERMELO_PLOT is a plot routine for the Zermelo problem
%
%  Modified:
%
%    04 February 2010
%
%  Author:
%
%    Gene Cliff
%

%% Plot the control history

  figure
  stairs ( PAR.ta(1:end-1), z_star, 'LineWidth', 2 )
  xlabel ( 'Time');
  ylabel ( 'Steering angle (r)' );
  title ( 'Control over time' );
  grid on

%% Generate and plot the  planar path

   xi = PAR.x0;              %  set initial condition
   T_save = []; X_save = []; %  initialize arrays

% loop over intervals - the control is piecewise constant

  for jj=1:length(z_star)
    hndl_rhs = @(t, x) feval(PAR.rhs, t, x, z_star(jj), PAR);
    [T, X] = ode23(hndl_rhs, [PAR.ta(jj) PAR.ta(jj+1)], xi);
    xi = X(end,:)';
    T_save = [T_save; T(2:end)]; X_save = [X_save; X(2:end,:)];
  end

  figure
  plot(X_save(:,1), X_save(:,2), 'r', 'LineWidth', 2 );
  hold on;
  xy_axis = axis;
  plot( xy_axis(1:2), PAR.yf*[ 1 1], '--k')
  plot([0 0], xy_axis(3:4), '-k')
  plot( xy_axis(1:2), [0 0], '-k')
  xlabel ( 'X position' );
  ylabel ( 'Y position' );
  title ( 'Path of the boat' );

  return
end
