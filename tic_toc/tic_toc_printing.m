function tic_toc_printing ( )

%*****************************************************************************80
%
%% TIC_TOC_PRINTING compares the printing and nonprinting versions of TOC.
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
  fprintf ( 1, '  A: Call TIC once, then call TOC five times.\n' );
  fprintf ( 1, '\n' );
%
%  Calling toc with no output argument invokes a printing operation
%  whose time is added to the next call.
%
  tic
  toc
  toc
  toc
  toc
  toc
%
%  Store the value, print later.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  B: Call TIC once, then call T=TOC five times,\n' );
  fprintf ( 1, '  storing the value.  Afterwards, print the five values.\n' );
  fprintf ( 1, '  Notice that calling the "printing" TOC adds the printing time\n' );
  fprintf ( 1, '  to the next elapsed time.\n' );
  fprintf ( 1, '\n' );

  tic
  a = toc;
  b = toc;
  c = toc;
  d = toc;
  e = toc;
  fprintf ( 1, 'Elapsed time is %12.10f seconds\n', a );
  fprintf ( 1, 'Elapsed time is %12.10f seconds\n', b );
  fprintf ( 1, 'Elapsed time is %12.10f seconds\n', c );
  fprintf ( 1, 'Elapsed time is %12.10f seconds\n', d );
  fprintf ( 1, 'Elapsed time is %12.10f seconds\n', e );

  return
end
