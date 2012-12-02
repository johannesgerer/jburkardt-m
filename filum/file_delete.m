function file_delete ( file_name )

%*****************************************************************************80
%
%% FILE_DELETE deletes a named file if it exists.
%
%  Discussion:
%
%    You might want to call this routine to get rid of any old copy
%    of a file, before trying to open a new copy with the OPEN argument:
%      status = 'new'.
%
%    It's not always safe to open a file with " STATUS = 'UNKNOWN' ".
%    For instance, on the SGI, the most recent version of the FORTRAN
%    compiler seems to go crazy when I open an unformatted direct
%    access file this way.  It creates an enormous file (of somewhat
%    random size).  The problem goes away if I delete any old copy
%    using this routine, and then open a fresh copy with
%    " STATUS = 'NEW' ".  It's a scary world.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file.
%

%
%  Does the file exist?
%
  if ( ~file_exist ( file_name ) )
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FILE_DELETE:\n' );
  fprintf ( 1, '  Deleting old version of "%s".\n', file_name );

  delete ( file_name );

  return
end
