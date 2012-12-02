%% IMAGE_SCRIPT is a script to call IMAGE_FUN.
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
%    28 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_SCRIPT\n' );
  fprintf ( 1, '  Filter an image using 3 workers\n' );

  [ x, y, z ] = image_fun ( );
