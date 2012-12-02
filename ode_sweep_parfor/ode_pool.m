%% ODE_POOL uses the MATLABPOOL command to run the ODE code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
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
%  Initialize the k and b ranges.
%
  bVals = 0.1 : 0.05 : 5;
  kVals = 1.5 : 0.05 : 5;
%
%  Begin the parameter sweep.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ODE_POOL\n' );
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

  matlabpool open local 4
%
%  Solve the ODE for every pair of K and B values and return the maximum
%  value over the time interval.
%
  tic
  peakVals = ode_fun ( bVals, kVals );
  toc

  matlabpool close
%
%  Now display am image of the data.
%
  ode_display ( bVals, kVals, peakVals );

