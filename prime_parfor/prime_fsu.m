%% PRIME_FSU uses the fsuClusterMatlab command to run the PRIME computation.
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    [] allows us to specify an output directory;
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%    'p" indicates this is a "parfor" job;
%    'w' indicates that the MATLAB session should wait for completion;
%    4 is the number of processors requested;
%    @prime_fun indicates the function we want to execute;
%    {} would contain input arguments if there were any.
%
%    The function "prime_fun" must correspond to a MATLAB M-file "prime_fun.m"
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
%    26 March 2010
%
%  Author:
%
%    John Burkardt
%
  fsuClusterMatlab ( [], [], 'p', 'w', 4, @prime_fun, { 10000000 } )
