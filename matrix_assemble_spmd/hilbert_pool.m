%% HILBERT_POOL uses the MATLABPOOL command to run the HILBERT code.
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
%    26 February 2011
%
%  Author:
%
%    John Burkardt
%
  m = 100;
  n = 100;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_POOL:\n' );
  fprintf ( 1, '  Define the %dx%d Hilbert matrix using SPMD workers.\n', ...
    m, n );
%
%  I can only ask for 2 workers on my laptop because that's all the
%  cores I have.
%
  workers = 2;

  matlabpool ( 'open', 'local', workers )

  tic
  a = hilbert_fun ( m, n );
  toc

  matlabpool ( 'close' )

  a_sum = sum ( sum ( a ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum of entries = %f\n', a_sum );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_POOL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );
