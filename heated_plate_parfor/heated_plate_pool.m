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
%    27 May 2012
%
%  Author:
%
%    John Burkardt
%
  tol = 0.1;
  filename = 'solution.txt';
  workers = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEATED_PLATE_POOL\n' );
  fprintf ( 1, '  Solve heated plate problem with tolerance %f\n', tol );
  fprintf ( 1, '  Write solution to file "%s".\n', filename );

  available = matlabpool ( 'size' );

  if ( available ~= workers )
    if ( 0 < available )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Closing current MATLABPOOL with %d workers.\n', available );
      matlabpool ( 'close' );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Opening MATLABPOOL with %d workers.\n', workers );
    matlabpool ( 'open', 'local', workers );
    available = workers;
  end

  tic
  heated_plate_fun ( tol, filename );
  toc

  matlabpool close
