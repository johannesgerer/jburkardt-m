function wathen_test ( )

%*****************************************************************************80
%
%% WATHEN_TEST tests the WATHEN library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the WATHEN library.\n' );
%
%  Set up and solve a single system with FULL, BANDED, SPARSE and DAVIS.
%
  wathen_test01 ( );
  wathen_test02 ( );
  wathen_test03 ( );
  wathen_test04 ( );
%
%  Demonstrate storage for a sequence of problems.
%
  wathen_test05 ( );
%
%  For various problem sizes:
%  * time FULL
%  * time BANDED
%  * time FULL, BANDED, SPARSE, DAVIS.
%  * time SPARSE, DAVIS (larger systems).
%
  wathen_test06 ( );
  wathen_test07 ( );
  wathen_test08 ( );
  wathen_test09 ( );
%
%  Use the conjugate gradient solver
%  * with FULL storage
%  * with ST storage
%  * with BANDED storage.
%  * with sparse storage.
%
  wathen_test10 ( );
  wathen_test11 ( );
  wathen_test115 ( );
  wathen_test12 ( );
%
%  Use SPY to display the sparsity of the matrix.
%
  wathen_test13 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

