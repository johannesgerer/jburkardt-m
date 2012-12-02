function condition_test01 ( )

%*****************************************************************************80
%
%% CONDITION_TEST01 tests CONDITION_LINPACK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   12 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONDITION_TEST01\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  CONDITION_LINPACK estimates the L1 condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix               Order   Condition         Linpack\n' );
  fprintf ( 1, '\n' );
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
  cond_l1 = a_norm_l1 * a_inverse_norm_l1;
  cond = condition_linpack ( n, a );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, cond );
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
  cond_l1 = a_norm_l1 * a_inverse_norm_l1;
  cond = condition_linpack ( n, a );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, cond );
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
  cond_l1 = a_norm_l1 * a_inverse_norm_l1;
  cond = condition_linpack ( n, a );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, cond );
%
%  CONEX3
%
  name = 'CONEX3';
  n = 5;
  a = conex3 ( n );
  a_inverse = conex3_inverse ( n );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1 = a_norm_l1 * a_inverse_norm_l1;
  cond = condition_linpack( n, a );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, cond );
%
%  CONEX4
%
  name = 'CONEX4';
  n = 4;
  a = conex4 ( );
  a_inverse = conex4_inverse ( );
  a_norm_l1 = norm ( a, 1 );
  a_inverse_norm_l1 = norm ( a_inverse, 1 );
  cond_l1 = a_norm_l1 * a_inverse_norm_l1;
  cond = condition_linpack ( n, a );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, cond );
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
  cond_l1 = a_norm_l1 * a_inverse_norm_l1;
  cond = condition_linpack ( n, a );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, cond );
%
%  Random
%
  seed = 123456789;

  for i = 1 : 5
    name = 'RANDOM';
    n = 4;
    [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
    a_inverse = inv ( a );
    a_norm_l1 = norm ( a, 1 );
    a_inverse_norm_l1 = norm ( a_inverse, 1 );
    cond_l1 = a_norm_l1 * a_inverse_norm_l1;
    cond = condition_linpack ( n, a );
    fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, cond );
  end

  return
end
