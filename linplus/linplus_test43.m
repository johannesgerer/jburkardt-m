function linplus_test43 ( )

%*****************************************************************************80
%
%% TEST43 tests R8LT_MXV, R8LT_SL, R8LT_VXM.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST43\n' );
  fprintf ( 1, '  For a matrix in lower triangular storage,\n' );
  fprintf ( 1, '  R8LT_SL solves systems;\n' );
  fprintf ( 1, '  R8LT_MXV computes matrix-vector products;\n' );
  fprintf ( 1, '  R8LT_VXM computes vector-matrix products;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  for i = 1 : n
    for j = 1 : n
      if ( j <= i )
        a(i,j) = j;
      else
        a(i,j) = 0.0;
      end
    end
  end

  r8lt_print ( n, n, a, '  The lower triangular matrix:' );

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8lt_mxv ( n, n, a, x );
    else
      b = r8lt_vxm ( n, n, a, x );
    end
%
%  Solve the linear system.
%
    x = r8lt_sl ( n, a, b, job );
 
    if ( job == 0 )
      r8vec_print ( n, x, '  Solution:' );
    else
      r8vec_print ( n, x, '  Solution to the transposed system:' );
    end

  end

  return
end
