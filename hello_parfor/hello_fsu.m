%% HELLO_FSU uses the fsuClusterMatlab command to run the HELLO "computation".
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    '~/matlab/hello_parfor' allows us to specify an output directory;
%
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%
%    'p" indicates this is a "parfor" job;
%
%    'w' indicates that the MATLAB session should wait for completion;
%
%    workers is the number of processors requested;
%
%    @hello_fun indicates the function we want to execute;
%
%    { n } contains input arguments to the function.
%
%    The function "hello_fun" must correspond to a MATLAB M-file "hello_fun.m"
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
%    02 March 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  workers = 4;

  tic

  fsuClusterMatlab ( '~/matlab/hello_parfor', [], 'p', 'w', workers, ...
    @hello_fun, { n } )

  toc
