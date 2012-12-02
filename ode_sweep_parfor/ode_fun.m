function peakVals = ode_fun ( bVals, kVals )

%*****************************************************************************80
%
%% ODE_FUN finds peak values of an ODE over a mesh of parameter values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2011
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, real bVals(M), a vector of B values.
%
%    Input, real kVals(N), a vector of K values.
%
%    Output, real peakVals(M,N), a vector containing the maximum value of
%    the ODE solution over a fixed time interval, for every combination
%    of B and K values.
%

%
%  Form a grid of all pairs of K and B:
%
  [ kGrid, bGrid ] = meshgrid ( bVals, kVals );
%
%  Define an array to hold the results, and initialize it to NAN.
%
  peakVals = nan ( size ( kGrid ) );
%
%  Solve the ODE for every pair of K and B values.  (M is fixed at 5.)
%
  m = 5.0;

  parfor ij = 1 : numel(kGrid)
%
%  Solve the ODE over the time interval 0 <= T <= 25, with
%  initial conditions X(0) = 0, X'(0) = 1.
%
    [ T, Y ] = ode45 ( @(t,y) ode_system ( t, y, m, bGrid(ij), kGrid(ij) ), ...
      [0, 25],  [0, 1] );
%
%  Retrieve the maximum value achieved by this solution.
%
    peakVals(ij) = max ( Y(:,1) );

  end

  return
end
