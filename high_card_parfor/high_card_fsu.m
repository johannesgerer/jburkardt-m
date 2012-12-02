%% HIGH_CARD_FSU uses the fsuClusterMatlab command to run the HIGH_CARD "computation".
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    '~/matlab/high_card_parfor' allows us to specify an output directory;
%
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%
%    'p" indicates this is a "parfor" job;
%
%    'w' indicates that the MATLAB session should wait for completion;
%
%    workers is the number of processors requested;
%
%    @high_card_fun indicates the function we want to execute;
%
%    { n } contains input arguments to the function.
%
%    The function "high_card_fun" must correspond to a MATLAB M-file "high_card_fun.m"
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
  m = 100;
  n = 1000;
  workers = 4;

  tic

  results = fsuClusterMatlab ( '~/matlab/high_card_parfor', [], 'p', 'w', workers, ...
    @high_card_fun, { m, n } );

  toc

  p = results{1};
%
%  Plot the results.
%
  high_card_display ( m, p );
