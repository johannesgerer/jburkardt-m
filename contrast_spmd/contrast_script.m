%% CONTRAST_SCRIPT is a script to call CONTRAST_FUN.
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
  fprintf ( 1, 'CONTRAST_SCRIPT\n' );
  fprintf ( 1, '  Enhance the contrast in an image using SPMD workers\n' );

%
%  Read a black and white image.
%
  x = imread ( 'surfsup.tif' );
%
%  Use SPMD workers to enhance the contrast.
%
  y = contrast_fun ( x );
