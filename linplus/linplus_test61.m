function linplus_test61 ( )

%*****************************************************************************80
%
%% TEST61 tests R8UT_MXV, R8UT_SL, R8UT_VXM.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST61\n' );
  fprintf ( 1, '  For an upper triangular matrix,\n' );
  fprintf ( 1, '  R8UT_SL solves systems;\n' );
  fprintf ( 1, '  R8UT_MXV computes matrix-vector products.\n' );
  fprintf ( 1, '  R8UT_VXM computes vector-matrix products.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  for i = 1 : n
    for j = 1 : n
      if ( i <= j )
        a(i,j) = j;
      else
        a(i,j) = 0.0;
      end
    end
  end

  r8ut_print ( n, n, a, '  The upper triangular matrix:' );

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8ut_mxv ( n, n, a, x );
    else
      b = r8ut_vxm ( n, n, a, x );
    end
%
%  Solve the linear system.
%
    x = r8ut_sl ( n, a, b, job );

    if ( job == 0 )
      r8vec_print ( n, x, '  Solution:' );
    else
      r8vec_print ( n, x, '  Solution to transposed system:' );
    end

  end

  return
end
