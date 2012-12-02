function linplus_test57 ( )

%*****************************************************************************80
%
%% TEST57 tests R8SM_SL.
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
  m = 5;
  n = m;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST57\n' );
  fprintf ( 1, '  R8SM_SL implements the Sherman-Morrison method\n' );
  fprintf ( 1, '    for solving a perturbed linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  for job = 1 : -1 : 0
%
%  Set the matrix.
%
    [ a, u, v, seed ] = r8sm_random ( m, n, seed );

    r8sm_print ( m, n, a, u, v, '  The Sherman-Morrison matrix A:' );
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8sm_mxv ( m, n, a, u, v, x );
    else
      b = r8sm_vxm ( m, n, a, u, v, x );
    end

    r8vec_print ( n, b, '  The right hand side vector B:' );
%
%  Factor the matrix.
%
    [ a_lu, pivot, info ] = r8ge_fa ( n, a );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Fatal error!\n' );
      fprintf ( 1, '  R8GE_FA declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      continue;
    end
%
%  Solve the linear system.
%
    x = r8sm_sl ( n, a_lu, u, v, b, pivot, job );
 
    if ( job == 0 )
      r8vec_print ( n, x, '  Solution to A * X = B:' )
    else
      r8vec_print ( n, x, '  Solution to A'' * X = B:' )
    end
 
  end

  return
end
