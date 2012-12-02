%% HEATED_PLATE_POOL uses the MATLABPOOL command to run the HEATED_PLATE code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
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
  matlabpool open local 4

  tol = 0.001;
  filename = 'solution.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEATED_PLATE_POOL\n' );
  fprintf ( 1, '  Solve heated plate problem with tolerance %f\n', tol );
  fprintf ( 1, '  Write solution to file "%s".\n', filename );

  heated_plate_fun ( tol, filename );

  matlabpool close
