%% HILBERT_FSU uses the fsuClusterMatlab command to run the HILBERT "computation".
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    '~/matlab/hilbert_parfor' allows us to specify an output directory;
%
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%
%    'p" indicates this is a "parfor" job;
%
%    'w' indicates that the MATLAB session should wait for completion;
%
%    workers is the number of processors requested;
%
%    @hilbert_fun indicates the function we want to execute;
%
%    { n } contains input arguments to the function.
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
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  m = 100;
  n = 100;
  workers = 4;

  tic

  fsuClusterMatlab ( '~/matlab/hilbert_parfor', [], 'p', 'w', workers, ...
    @hilbert_fun, { m, n } )

  toc
