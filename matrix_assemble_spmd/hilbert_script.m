%% HILBERT_SCRIPT is a script to call HILBERT_FUN.
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
%    26 February 2011
%
%  Author:
%
%    John Burkardt
%
  m = 100;
  n = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_SCRIPT\n' );
  fprintf ( 1, '  Define the %dx%d Hilbert matrix using SPMD workers.\n', ...
    m, n );

  tic
  a = hilbert_fun ( m, n );
  toc

  a_sum = sum ( sum ( a ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum of entries = %f\n', a_sum );

