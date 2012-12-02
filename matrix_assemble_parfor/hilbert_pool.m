%% HILBERT_POOL uses the MATLABPOOL command to run the HILBERT function.
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
%    21 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_POOL\n' );
  fprintf ( 1, '  Call HILBERT_FUN to assemble the Hilbert matrix.\n' );

  m = 100;
  n = 100;

  matlabpool open local 4

  tic
  a = hilbert_fun ( m, n );
  toc

  matlabpool close
