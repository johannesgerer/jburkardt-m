%% SPARSE_FSU uses the fsuClusterMatlab command to run the SPARSE "computation".
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    '~/matlab/sparse_parfor' allows us to specify an output directory;
%
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%
%    'p" indicates this is a "parfor" job;
%
%    'w' indicates that the MATLAB session should wait for completion;
%
%    workers is the number of processors requested;
%
%    @sparse_fun indicates the function we want to execute;
%
%    { n } contains input arguments to the function.
%
%    The function "sparse_fun" must correspond to a MATLAB M-file "sparse_fun.m"
%    and that file must be in MATLAB's path.
%
%    The easiest way to ensure that the file is in MATLAB's path is to
%    create a subdirectory called "matlab" immediately below your home directory,
%    and place the function file there (as well as any other files needed
%    by the job).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2012
%
%  Author:
%
%    John Burkardt
%
  workers = 4;

  tic

  results = fsuClusterMatlab ( '~/matlab/sparse_parfor', [], 'p', 'w', workers, ...
    @sparse_fun, { } );

  toc

  A_sparse = results{1};
%
%  Plot the results.
%
  spy ( A_sparse );
