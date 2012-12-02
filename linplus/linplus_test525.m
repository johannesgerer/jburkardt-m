function linplus_test525 ( )

%*****************************************************************************80
%
%% TEST525 tests R8PP_FA, R8PP_SL.
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
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST525\n' );
  fprintf ( 1, '  R8PP_FA factors a R8PP system,\n' );
  fprintf ( 1, '  R8PP_SL solves a R8PP system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8pp_random ( n, seed );

  r8pp_print ( n, a, '  The R8PP matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );

  r8vec_print ( n, x, '  The desired solution:' );
%
%  Compute the corresponding right hand side.
%
  b = r8pp_mxv ( n, a, x );

  r8vec_print ( n, b, '  The right hand side:' );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8pp_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Fatal error!\n' );
    fprintf ( 1, '  R8PP_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The R8PP matrix has been factored.\n' );
%
%  Solve the linear system.
%
  x = r8pp_sl ( n, a_lu, b );
 
  r8vec_print ( n, x, '  Solution:' );

  return
end
