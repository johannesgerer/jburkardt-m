function linplus_test27 ( )

%*****************************************************************************80
%
%% TEST27 tests R8GB_TRF, R8GB_TRS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  m = n;
  ml = 1;
  mu = 2;
  nrhs = 1;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST27\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_TRF computes the PLU factors.\n' );
  fprintf ( 1, '  R8GB_TRS solves a factored linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =      %d\n', m );
  fprintf ( 1, '  Matrix columns N =   %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8gb_random ( m, n, ml, mu, seed );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8gb_mxv ( m, n, ml, mu, a, x );
%
%  Factor the matrix.
%
  [ a_lu, pivot, info ] = r8gb_trf ( m, n, ml, mu, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST27 - Fatal error!\n' );
    fprintf ( 1, '  R8GB_TRF declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the linear system.
%  Note that, because of quirks in MATLAB, we need to copy our vector-based
%  data to and from 2D arrays.
%
  b_mat = r8vec_to_r8ge ( n, nrhs, b );
  [ x_mat, info ] = r8gb_trs ( n, ml, mu, nrhs, 'N', a_lu, pivot, b_mat );
  x = r8ge_to_r8vec ( n, nrhs, x_mat );
  r8vec_print ( n, x, '  Solution:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  job = 1;
  b = r8gb_mu ( n, ml, mu, a_lu, pivot, x, job );
%
%  Solve the linear system.
%
  b_mat = r8vec_to_r8ge ( n, nrhs, b );
  [ x_mat, info ] = r8gb_trs ( n, ml, mu, nrhs, 'T', a_lu, pivot, b_mat );
  x = r8ge_to_r8vec ( n, nrhs, x_mat );
  r8vec_print ( n, x, '  Solution to transposed system:' );

  return
end
