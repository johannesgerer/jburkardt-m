%% HEATED_PLATE_SCRIPT is a script to call HEATED_PLATE_FUN.
%
%  Discussion:
%
%    The BATCH command runs scripts, not functions.  So we have to write
%    this short script if we want to work with BATCH!
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
  filename = 'solution.txt'

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEATED_PLATE_SCRIPT\n' );
  fprintf ( 1, '  Call HEATED_PLATE_FUN to solve the heated plate problem\n' );
  fprintf ( 1, '  Use a tolerance %f\n', tol );
  fprintf ( 1, '  Write solution to file "%s".\n', filename );

  tic
  heated_plate_fun ( tol, filename );
  toc
