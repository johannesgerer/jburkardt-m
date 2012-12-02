function linplus_test42 ( )

%*****************************************************************************80
%
%% TEST42 tests R8GE_NP_TRF, R8GE_NP_TRM, R8GE_NP_TRS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  m = 10;
  n = m;
  nrhs = 1;

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST42\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_NP_TRF factors without pivoting,\n' );
  fprintf ( 1, '  R8GE_NP_TRS solves factored systems.\n' );
  fprintf ( 1, '  R8GE_NP_TRM computes A*X for factored A.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ge_random ( m, n, seed );
%
%  Set the desired solution.
%
  x(1:n) = 1.0E+00;
%
%  Compute the corresponding right hand side.
%
  b = r8ge_mxv ( m, n, a, x );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8ge_np_trf ( m, n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST42 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_NP_TRF declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  b_mat = r8vec_to_r8ge ( n, nrhs, b );
  [ x_mat, info ] = r8ge_np_trs ( n, nrhs, 'N', a_lu, b_mat );
  x = r8ge_to_r8vec ( n, nrhs, x_mat );
   
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST42 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_TRS returned an error condition!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  r8vec_print ( n, x, '  Solution:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  job = 0;
  b = r8ge_np_trm ( m, n, a_lu, x, job );
%
%  Solve the system
%
  b_mat = r8vec_to_r8ge ( n, nrhs, b );
  [ x_mat, info ] = r8ge_np_trs ( n, nrhs, 'N', a_lu, b_mat );
  x = r8ge_to_r8vec ( n, nrhs, x_mat );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST42 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_TRS returned an error condition!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  r8vec_print ( n, x, '  Solution:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  job = 1;
  b = r8ge_np_trm ( m, n, a_lu, x, job );
%
%  Solve the system.
%
  b_mat = r8vec_to_r8ge ( n, nrhs, b );
  [ x_mat, info ] = r8ge_np_trs ( n, nrhs, 'T', a_lu, b_mat );
  x = r8ge_to_r8vec ( n, nrhs, x_mat );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST42 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_TRS returned an error condition!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  r8vec_print ( n, x, '  Solution of transposed system:' );

  return
end
