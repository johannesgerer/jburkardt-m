%% HILBERT_FSU uses the fsuClusterMatlab command to run the HILBERT computation.
%
%  Discussion:
%
%    We invoke MATLAB with a command like this:
%
%      results = ...
%        fsuClusterMatlab ( '~/matlab/matrix_assemble_spmd', [], 'm', 'w', ...
%        workers, @hilbert_fun, { m, n } );
%
%    The arguments to fsuClusterMatlab mean:
%
%    results is a cell array containing the output.
%
%    '~/matlab/matrix_assemble_spmd' allows us to specify a directory into
%    which the fsuClusterMatlab command can store various intermediate and
%    result files and directories associated with this job.
%
%    [] allows us to specify switches to the MOAB queue handler,
%    such as more than the default time.
%
%    'm' indicates this is an "MPI-like" job;
%
%    'w' indicates that the MATLAB session should wait for completion;
%
%    wokers is the number of processors requested;
%
%    @hilbert_fun indicates the function we want to execute;
%
%    {m, n} contains the input arguments to the function;
%
%    The function "hilbert_fun" must correspond to a MATLAB M-file "hilbert_fun.m"
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
%    26 February 2011
%
%  Author:
%
%    John Burkardt
%
  workers = 4;
  m = 100;
  n = 100;

  tic
  results = ...
    fsuClusterMatlab ( '~/matlab/matrix_assemble_spmd', [], 'm', 'w', ...
    workers, @hilbert_fun, { m, n } );
  toc
