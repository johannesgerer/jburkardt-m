% startup.m
%
%  Discussion:
%
%    MATLAB always has a "current directory".  
%
%    This current directory starts out with a default directory often located
%    somewhere in the file system associated with the MATLAB application.
%
%    It's convenient to have this initial directory changed to somewhere
%    associated with YOUR files, so that you can easily draw MATLAB's attention
%    to various files you want to run.
%
%    By placing this file, "startup.m", somewhere in MATLAB's search path,
%    you can move MATLAB's current directory to a more suitable location. 
%
%    For that matter, you can also add directories to the search path,
%    define constants, and take care of other matters that produce a pleasing
%    environment for you.
%
%    For instance, under the Macintosh OSX operating system, the main MATLAB 
%    directory might be /Applications//MATLAB_R2007b or 
%    /Applications/MATLAB_R2009b.app.  It's enough to put the startup.m file 
%    directly in this folder.  If you're neat, you might prefer to place it in
%    the toolbox/local subdirectory.  MATLAB will still be able to find and
%    execute it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2011
%
%  Author:
%
%    John Burkardt
%
  beep off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATLAB''s default startup directory is: "%s".\n', pwd );
  cd /Users/jburkardt/public_html/m_src
  fprintf ( 1, 'Moving to preferred directory: "%s".\n', pwd );
