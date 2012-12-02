function PAR = zermelo ( n )

%*****************************************************************************80
%
%% ZERMELO sets data for the  Zermelo problem
%
%  Modified:
%
%    04 February 2010
%
%  Author:
%
%    Gene Cliff
%
%  Parameters:
%
%    Input, integer N, the discretization parameter.
%
%    Output, structure PAR, contains the problem parameters.
%
  PAR.n = n;

  PAR.rhs  = @zermelo_rhs;
  PAR.cost = @zermelo_cost;
  PAR.ineq = @zermelo_ineq;

  tf = 10;
  PAR.tf = tf;
  PAR.ta = linspace(0, tf, n+1);

  PAR.x0   = [0; 0];

  PAR.k = -1;
  PAR.yf = 1.;

  PAR.plot = @zermelo_plot;

  return
end

