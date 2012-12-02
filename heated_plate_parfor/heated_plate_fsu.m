%% HEATED_PLATE_FSU runs HEATED_PLATE_FUN using fsuClusterMatlab.
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
%    @heated_plate_fun indicates the function we want to execute;
%    {*,*} contains input arguments.
%
%    The function "heated_plate_fun" must correspond to a MATLAB M-file
%    "heated_plate_fun.m" and that file must be in MATLAB's path.
%
%    The easiest way to ensure that the file is in MATLAB's path is to
%    create a subdirectory called "matlab" immediately below your home directory,
%    and place the function file there (as well as any other files needed by
%    the job).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2010
%
%  Author:
%
%    John Burkardt
%
  tol = 0.001;
  filename = 'solution.txt';

  fsuClusterMatlab ( [], [], 'p', 'w', 4, @heated_plate_fun, { tol, filename } )
