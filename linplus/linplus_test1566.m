function linplus_test1566 ( )

%*****************************************************************************80
%
%% TEST1566 tests R8BUT_MXV, R8BUT_PRINT, R8BUT_RANDOM, R8BUT_SL, R8BUT_VXM.
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
  mu = 3;
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1566\n' );
  fprintf ( 1, '  For a band matrix in upper triangular storage,\n' );
  fprintf ( 1, '  R8BUT_RANDOM sets a random value;\n' );
  fprintf ( 1, '  R8BUT_SL solves systems;\n' );
  fprintf ( 1, '  R8BUT_MXV computes matrix-vector products;\n' );
  fprintf ( 1, '  R8BUT_VXM computes vector-matrix products;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N =     %d\n', n );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  [ a, seed ] = r8but_random ( n, mu, seed );

  r8but_print ( n, mu, a, '  The R8BUT matrix:' );

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8but_mxv ( n, mu, a, x );
    else
      b = r8but_vxm ( n, mu, a, x );
    end

    r8vec_print ( n, b, '  The right hand side:' );
%
%  Solve the linear system.
%
    x = r8but_sl ( n, mu, a, b, job );

    if ( job == 0 )
      r8vec_print ( n, x, '  Solution to the untransposed system:' );
    else
      r8vec_print ( n, x, '  Solution to the transposed system:' );
    end

  end

  return
end
