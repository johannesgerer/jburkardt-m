%% IMAGE_FSU uses the fsuClusterMatlab command to run the IMAGE computation.
%
%  Discussion:
%
%    The arguments to fsuClusterMatlab mean:
%
%    [] allows us to specify an output directory;
%    [] allows us to specify switches to the MOAB queue handler, such as more time.
%    'm" indicates this is an "MPI-like" job;
%    'w' indicates that the MATLAB session should wait for completion;
%    4 is the number of processors requested;
%    @image_fun indicates the function we want to execute;
%    {} would contain input arguments if there were any.
%
%    The function "image_fun" must correspond to a MATLAB M-file "image_fun.m"
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
%    28 March 2010
%
%  Author:
%
%    John Burkardt
%
  fsuClusterMatlab ( [], [], 'm', 'w', 4, @image_fun, { } )
