%% DIJKSTRA_FSU uses the fsuClusterMatlab command to run the DIJKSTRA computation.
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    [] allows us to specify an output directory;
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%    'm' indicates this is an "MPI" job;
%    'w' indicates that the MATLAB session should wait for completion;
%    4 is the number of processors requested;
%    @dijkstra_fun indicates the function we want to execute;
%    nv, ohd are input arguments to dijkstra_fun.
%
%    The function "dijkstra_fun" must correspond to a MATLAB M-file "dijkstra_fun.m"
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
  nv = 6;
  ohd = initial_distance ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Submitting fsuClusterMatlab command at %s.\n', datestr ( now ) );

  results = fsuClusterMatlab ( [], [], 'm', 'w', 4, @dijkstra_fun, nv, ohd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computation completed at %s.\n', datestr ( now ) );

  mind = results{1};
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum distances from node 1:\n');
  fprintf ( 1, '\n' );
  for i = 1 : nv
    fprintf ( 1, '  %2d  %2d\n', i, mind(i) );
  end
