%% ODE_SCRIPT: Parameter Sweep of an ODE
%
%  Discussion:
%
%    This is a parameter sweep study of a 2nd order ODE system.
%
%      m*x'' + b*x' + k*x = 0
%
%    We solve the ODE for a time span of 0 to 25 seconds, with initial
%    conditions X(0) = 0 and X'(0) = 1. We sweep the parameters "b" and "k"
%    and record the peak values of X for each condition. At the end, we plot a
%    surface of the results.
%
%    The results can be displayed by calling ODE_SWEEP_DISPLAY.M.
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
%    John Burkardt
%

%
%  Initialization:
%
  bVals = 0.1 : 0.05 : 5;
  kVals = 1.5 : 0.05 : 5;
%
%  Begin the parameter sweep.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ODE_SCRIPT\n' );
  fprintf ( 1, '  Sweep through sets of values of parameters B and K,\n' );
  fprintf ( 1, '  computing the solution of the ODE corresponding to each set.\n' );
  fprintf ( 1, '  For each solution X(T), determine the maximum value over time.\n' );
  fprintf ( 1, '  Construct a contour plot of XMAX(B,K).\n' );
  fprintf ( 1, '  Use the PARFOR command to carry out these computations in parallel.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of K values = %d\n', length ( kVals ) );
  fprintf ( 1, '  Number of B values = %d\n', length ( bVals ) );
  fprintf ( 1, '  Number of times the ODE must be solved = %d\n', ...
    length ( kVals ) * length ( bVals ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Begin computation\n' );
%
%  Solve the ODE for every pair of K and B values and return the maximum
%  value over the time interval.
%
  tic
  peakVals = ode_fun ( bVals, kVals );
  toc

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computation completed\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  To display the results, use the command:\n' );
  fprintf ( 1, '    ode_display ( bVals, kVals, peakVals );\n' );
