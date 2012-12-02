function linplus_test38 ( )

%*****************************************************************************80
%
%% TEST38 tests R8GE_MU.
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
  n = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST38\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_MU computes A*x or A''*X\n' );
  fprintf ( 1, '    where A has been factored by R8GE_TRF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  for job = 0 : 1

    if ( job == 0 ) 
      trans = 'N';
    else
      trans = 'T';
    end
%
%  Set the matrix.
%
    [ amn, seed ] = r8ge_random ( m, n, seed );

    if ( job == 0 )

      xn = r8vec_indicator ( n );

      cm = r8ge_mxv ( m, n, amn, xn );

    else

      xm = r8vec_indicator ( m );

      cn = r8ge_vxm ( m, n, amn, xm );

    end
%
%  Factor the matrix.
%
    [ amn_lu, pivot, info ] = r8ge_trf ( m, n, amn );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST38 - Fatal error!\n' );
      fprintf ( 1, '  R8GE_TRF declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      continue;
    end
%
%  Now multiply the factored matrix times solution to get right hand side again.
%
    if ( job == 0 )

      bm = r8ge_mu ( m, n, amn_lu, trans, pivot, xn );

      r8vec2_print_some ( m, cm, bm, 10, '  A*x and PLU*x' );

    else

      bn = r8ge_mu ( m, n, amn_lu, trans, pivot, xm );

      r8vec2_print_some ( n, cn, bn, 10, '  A''*x and (PLU)''*x' );

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix is %d by %d\n', n, m );

  for job = 0 : 1

    if ( job == 0 ) 
      trans = 'N';
    else
      trans = 'T';
    end
%
%  Set the matrix.
%
    [ anm, seed ] = r8ge_random ( n, m, seed );

    if ( job == 0 )

      xm = r8vec_indicator ( m );

      cn = r8ge_mxv ( n, m, anm, xm );

    else

      xn = r8vec_indicator ( n );

      cm = r8ge_vxm ( n, m, anm, xn );

    end
%
%  Factor the matrix.
%
    [ anm_lu, pivot, info ] = r8ge_trf ( n, m, anm );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST38 - Fatal error!\n' );
      fprintf ( 1, '  R8GE_TRF declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      continue;
    end
%
%  Now multiply factored matrix times solution to get right hand side again.
%
    if ( job == 0 )

      bn = r8ge_mu ( n, m, anm_lu, trans, pivot, xm );

      r8vec2_print_some ( n, cn, bn, 10, '  A*x and PLU*x' );

    else

      bm = r8ge_mu ( n, m, anm_lu, trans, pivot, xn );

      r8vec2_print_some ( m, cm, bm, 10, '  A''*x and (PLU)''*x' );

    end

  end

  return
end
