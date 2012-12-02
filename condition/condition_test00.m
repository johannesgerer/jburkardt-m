function condition_test00 ( )

%*****************************************************************************80
%
%% CONDITION_TEST00 tests MATLAB's COND().
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONDITION_TEST00\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  The MATLAB COND() function estimates the L1 condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix               Order   Condition         MATLAB\n' );
  fprintf ( 1, '\n' );
%
%  Combinatorial matrix.
%
  name = 'Combinatorial';
  n = 4;
  alpha = 2.0;
  beta = 3.0;
  a = combin ( alpha, beta, n );
  cond_l1 = norm ( a, 1 ) * norm ( inv ( a ), 1 );
  estimate = cond ( a, 1 );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, estimate );
%
%  CONEX1
%
  name = 'CONEX1';
  n = 4;
  alpha = 100.0;
  a = conex1 ( alpha );
  cond_l1 = norm ( a, 1 ) * norm ( inv ( a ), 1 );
  estimate = cond ( a, 1 );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, estimate );
%
%  CONEX2
%
  name = 'CONEX2';
  n = 3;
  alpha = 100.0;
  a = conex2 ( alpha );
  cond_l1 = norm ( a, 1 ) * norm ( inv ( a ), 1 );
  estimate = cond ( a, 1 );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, estimate );
%
%  CONEX3
%
  name = 'CONEX3';
  n = 5;
  a = conex3 ( n );
  cond_l1 = norm ( a, 1 ) * norm ( inv ( a ), 1 );
  estimate = cond ( a, 1 );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, estimate );
%
%  CONEX4
%
  name = 'CONEX4';
  n = 4;
  a = conex4 ( );
  cond_l1 = norm ( a, 1 ) * norm ( inv ( a ), 1 );
  estimate = cond ( a, 1 );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, estimate );
%
%  KAHAN
%
  name = 'KAHAN';
  n = 4;
  alpha = 0.25;
  a = kahan ( alpha, n, n );
  cond_l1 = norm ( a, 1 ) * norm ( inv ( a ), 1 );
  estimate = cond ( a, 1 );
  fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, estimate );
%
%  Random
%
  seed = 123456789;

  for i = 1 : 5
    name = 'RANDOM';
    n = 4;
    [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
    cond_l1 = norm ( a, 1 ) * norm ( inv ( a ), 1 );
    estimate = cond ( a, 1 );
    fprintf ( 1, '  %20s  %4d  %14.6g  %14.6g\n', name, n, cond_l1, estimate );
  end

  return
end
