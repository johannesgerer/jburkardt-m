function condition_test02 ( )

%*****************************************************************************80
%
%% CONDITION_TEST02 tests CONDITION_SAMPLE1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2012
%
%  Author:
%
%    John Burkardt
%
  m_test = [ 10, 1000, 100000 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONDITION_TEST02\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  CONDITION_SAMPLE1 estimates the L1 condition number using sampling.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix                 Samples Order   Condition        Estimate\n' );
%
%  Combinatorial matrix.
%
  name = 'Combinatorial';
  n = 4;
  alpha = 2.0;
  beta = 3.0;
  a = combin ( alpha, beta, n );
  a_inverse = combin_inverse ( alpha, beta, n );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1  = a_norm_l1 * a_inverse_norm_l1;
  fprintf ( 1, '\n' );
  for i = 1 : 3
    m = m_test(i);
    cond = condition_sample1 ( n, a, m );
    fprintf ( 1, '  %20s  %8d  %4d  %14.6g  %14.6g\n', name, m, n, cond_l1, cond );
  end
%
%  CONEX1
%
  name = 'CONEX1';
  n = 4;
  alpha = 100.0;
  a = conex1 ( alpha );
  a_inverse = conex1_inverse ( alpha );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1  = a_norm_l1 * a_inverse_norm_l1;
  fprintf ( 1, '\n' );
  for i = 1 : 3
    m = m_test(i);
    cond = condition_sample1 ( n, a, m );
    fprintf ( 1, '  %20s  %8d  %4d  %14.6g  %14.6g\n', name, m, n, cond_l1, cond );
  end
%
%  CONEX2
%
  name = 'CONEX2';
  n = 3;
  alpha = 100.0;
  a = conex2 ( alpha );
  a_inverse = conex2_inverse ( alpha );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1  = a_norm_l1 * a_inverse_norm_l1;
  fprintf ( 1, '\n' );
  for i = 1 : 3
    m = m_test(i);
    cond = condition_sample1 ( n, a, m );
    fprintf ( 1, '  %20s  %8d  %4d  %14.6g  %14.6g\n', name, m, n, cond_l1, cond );
  end
%
%  CONEX3
%
  name = 'CONEX3';
  n = 5;
  a = conex3 ( n );
  a_inverse = conex3_inverse ( n );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1  = a_norm_l1 * a_inverse_norm_l1;
  fprintf ( 1, '\n' );
  for i = 1 : 3
    m = m_test(i);
    cond = condition_sample1 ( n, a, m );
    fprintf ( 1, '  %20s  %8d  %4d  %14.6g  %14.6g\n', name, m, n, cond_l1, cond );
  end
%
%  CONEX4
%
  name = 'CONEX4';
  n = 4;
  a = conex4 ( );
  a_inverse = conex4_inverse ( );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1  = a_norm_l1 * a_inverse_norm_l1;
  fprintf ( 1, '\n' );
  for i = 1 : 3
    m = m_test(i);
    cond = condition_sample1 ( n, a, m );
    fprintf ( 1, '  %20s  %8d  %4d  %14.6g  %14.6g\n', name, m, n, cond_l1, cond );
  end
%
%  KAHAN
%
  name = 'KAHAN';
  n = 4;
  alpha = 0.25;
  a = kahan ( alpha, n, n );
  a_inverse = kahan_inverse ( alpha, n );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1  = a_norm_l1 * a_inverse_norm_l1;
  fprintf ( 1, '\n' );
  for i = 1 : 3
    m = m_test(i);
    cond = condition_sample1 ( n, a, m );
    fprintf ( 1, '  %20s  %8d  %4d  %14.6g  %14.6g\n', name, m, n, cond_l1, cond );
  end
%
%  Random
%
  seed = 123456789;

  for j = 1 : 5
    name = 'RANDOM';
    n = 4;
    [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
    a_inverse = inv ( a );
    a_norm_l1 = norm ( a, 1 );
    a_inverse_norm_l1 = norm ( a_inverse, 1 );
    cond_l1  = a_norm_l1 * a_inverse_norm_l1;
    fprintf ( 1, '\n' );
    for i = 1 : 3
      m = m_test(i);
      cond = condition_sample1 ( n, a, m );
      fprintf ( 1, '  %20s  %8d  %4d  %14.6g  %14.6g\n', name, m, n, cond_l1, cond );
    end
  end

  return
end
