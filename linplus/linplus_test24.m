function linplus_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests R8GB_ML.
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
  m = 10;
  n = m;
  ml = 1;
  mu = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_ML computes A*x or A''*X\n' );
  fprintf ( 1, '    where A has been factored by R8GB_FA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M              = %d\n', m );
  fprintf ( 1, '  Matrix columns N           = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML         = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU         = %d\n', mu );

  for job = 0 : 1
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
    if ( job == 0 )
      b = r8gb_mxv ( m, n, ml, mu, a, x );
    else
      b = r8gb_vxm ( m, n, ml, mu, a, x );
    end
%
%  Factor the matrix.
%
    [ a_lu, pivot, info ] = r8gb_fa ( n, ml, mu, a );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST24 - Fatal error!\n' );
      fprintf ( 1, '  R8GB_FA declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      return
    end
%
%  Now multiply factored matrix times solution to get right hand side again.
%
    b2 = r8gb_ml ( n, ml, mu, a_lu, pivot, x, job );

    if ( job == 0 )
      r8vec2_print_some ( n, b, b2, 10, '  A*x and PLU*x' );
    else
      r8vec2_print_some ( n, b, b2, 10, '  A''*x and (PLU)''*x' );
    end

  end

  return
end
