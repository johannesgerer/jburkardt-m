function tic_toc_printing_test ( )

%*****************************************************************************80
%
%% TIC_TOC_PRINTING_TEST calls TIC_TOC_PRINTING.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIC_TOC_PRINTING_TEST:\n' );
  fprintf ( 1, '  We can estimate the resolution of the TIC/TOC call by\n' );
  fprintf ( 1, '  calling them one after the other, with no work in between.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  So calling TIC, and then calling TOC several times, might\n' );
  fprintf ( 1, '  seem to give us more estimates to compare.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  However, we must realize that calling TOC with the\n' );
  fprintf ( 1, '  printing option adds the printing time to the next measurement\n' );
  fprintf ( 1, '  of elapsed time.\n' );

  tic_toc_printing ( )

  return
end
