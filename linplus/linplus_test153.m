function linplus_test153 ( )

%*****************************************************************************80
%
%% TEST153 tests R8BLT_MXV, R8BLT_PRINT, R8BLT_RANDOM, R8BLT_SL, R8BLT_VXM.
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
  ml = 3;
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST153\n' );
  fprintf ( 1, '  For a band matrix in lower triangular storage,\n' );
  fprintf ( 1, '  R8BLT_RANDOM sets a random value;\n' );
  fprintf ( 1, '  R8BLT_SL solves systems;\n' );
  fprintf ( 1, '  R8BLT_MXV computes matrix-vector products;\n' );
  fprintf ( 1, '  R8BLT_VXM computes vector-matrix products;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );

  [ a, seed ] = r8blt_random ( n, ml, seed );

  r8blt_print ( n, ml, a, '  The R8BLT matrix:' );

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8blt_mxv ( n, ml, a, x );
    else
      b = r8blt_vxm ( n, ml, a, x );
    end

    r8vec_print ( n, b, '  The right hand side:' );
%
%  Solve the linear system.
%
    x = r8blt_sl ( n, ml, a, b, job );
 
    if ( job == 0 )
      r8vec_print ( n, x, '  Solution to the untransposed system:' );
    else
      r8vec_print ( n, x, '  Solution to the transposed system:' );
    end

  end

  return
end
