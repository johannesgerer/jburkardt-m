%% ODE_FSU uses the fsuClusterMatlab command to run the ODE computation.
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    [] allows us to specify an output directory;
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%    'p' indicates this is a "parfor" job;
%    'w' indicates that the MATLAB session should wait for completion;
%    4 is the number of processors requested;
%    @ode_fun indicates the function we want to execute;
%    bVals, kVals are input arguments to ode_fun.
%
%    The function "ode_fun" must correspond to a MATLAB M-file "ode_fun.m"
%    and that file must be in MATLAB's path.  
%
%    The easiest way to ensure that the file is in MATLAB's path is to
%    create a subdirectory called "matlab" immediately below your home directory,
%    and place the function file there (as well as any other files needed by the job).
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
  bVals = 0.1 : 0.05 : 5;
  kVals = 1.5 : 0.05 : 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Submitting fsuClusterMatlab command at %s.\n', datestr ( now ) );

  tic
  results = fsuClusterMatlab ( [], [], 'p', 'w', 4, @ode_fun, bVals, kVals );
  toc

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computation completed at %s.\n', datestr ( now ) );

  peakVals = results{1};

  ode_display ( bVals, kVals, peakVals );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Image created at %s.\n', datestr ( now ) );

