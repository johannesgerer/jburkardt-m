function test_condition ( )

%*****************************************************************************80
%
%% TEST_CONDITION tests the condition number computations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_CONDITION\n' );
  fprintf ( 1, '  Compute the L1 condition number of an example of each\n' );
  fprintf ( 1, '  test matrix\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Title                    N            COND            COND\n' );
  fprintf ( 1, '\n' );
%
%  AEGERTER
%
  title = 'AEGERTER';
  n = 5;
  cond1 = aegerter_condition ( n );

  a = aegerter ( n );
  b = aegerter_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  BAB
%
  title = 'BAB';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = bab_condition ( n, alpha, beta );

  a = bab ( n, alpha, beta );
  b = bab_inverse ( n, alpha, beta );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  BAUER
%
  title = 'BAUER';
  n = 6;
  cond1 = bauer_condition ( );

  a = bauer ( );
  b = bauer_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  BIS
%
  title = 'BIS';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = bis_condition ( alpha, beta, n );

  a = bis ( alpha, beta,  n, n );
  b = bis_inverse ( alpha, beta, n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  BIW
%
  title = 'BIW';
  n = 5;
  cond1 = biw_condition ( n );

  a = biw ( n );
  b = biw_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  BODEWIG
%
  title = 'BODEWIG';
  n = 3;
  cond1 = bodewig_condition ( );

  a = bodewig ( );
  b = bodewig_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  BOOTHROYD
%
  title = 'BOOTHROYD';
  n = 5;
  cond1 = boothroyd_condition ( n );

  a = boothroyd ( n );
  b = boothroyd_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  COMBIN
%
  title = 'COMBIN';
  n = 3;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = combin_condition ( alpha, beta, n );

  a = combin ( alpha, beta, n );
  b = combin_inverse ( alpha, beta, n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  COMPANION
%
  title = 'COMPANION';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +10.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  cond1 = companion_condition ( n, x );

  a = companion ( n, x );
  b = companion_inverse ( n, x );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  CONEX1
%
  title = 'CONEX1';
  n = 4;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = conex1_condition ( alpha );

  a = conex1 ( alpha );
  b = conex1_inverse ( alpha );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  CONEX2
%
  title = 'CONEX2';
  n = 3;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = conex2_condition ( alpha );

  a = conex2 ( alpha );
  b = conex2_inverse ( alpha );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  CONEX3
%
  title = 'CONEX3';
  n = 5;
  cond1 = conex3_condition ( n );

  a = conex3 ( n );
  b = conex3_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  CONEX4
%
  title = 'CONEX4';
  n = 4;
  cond1 = conex4_condition ( );

  a = conex4 ( );
  b = conex4_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DAUB2
%
  title = 'DAUB2';
  n = 4;
  cond1 = daub2_condition ( n );

  a = daub2 ( n );
  b = daub2_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DAUB4
%
  title = 'DAUB4';
  n = 8;
  cond1 = daub4_condition ( n );

  a = daub4 ( n );
  b = daub4_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DAUB6
%
  title = 'DAUB6';
  n = 12;
  cond1 = daub6_condition ( n );

  a = daub6 ( n );
  b = daub6_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DAUB8
%
  title = 'DAUB8';
  n = 16;
  cond1 = daub8_condition ( n );

  a = daub8 ( n );
  b = daub8_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DAUB10
%
  title = 'DAUB10';
  n = 20;
  cond1 = daub10_condition ( n );

  a = daub10 ( n );
  b = daub10_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DAUB12
%
  title = 'DAUB12';
  n = 24;
  cond1 = daub12_condition ( n );

  a = daub12 ( n );
  b = daub12_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DIAGONAL
%
  title = 'DIAGONAL';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +10.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  cond1 = diagonal_condition ( n, x );

  a = diagonal ( n, n, x );
  b = diagonal_inverse ( n, x );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  DIF2
%
  title = 'DIF2';
  n = 5;
  cond1 = dif2_condition ( n );

  a = dif2 ( n, n );
  b = dif2_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;
%
%  DOWNSHIFT
%
  title = 'DOWNSHIFT';
  n = 5;
  cond1 = downshift_condition ( n );

  a = downshift ( n );
  b = downshift_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  EXCHANGE
%
  title = 'EXCHANGE';
  n = 5;
  cond1 = exchange_condition ( n );

  a = exchange ( n, n );
  b = exchange_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  FIGONACCI2
%
  title = 'FIBONACCI2';
  n = 5;
  cond1 = fibonacci2_condition ( n );

  a = fibonacci2 ( n );
  b = fibonacci2_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  GFPP
%
  title = 'GFPP';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = gfpp_condition ( n, alpha );

  a = gfpp ( n, alpha );
  b = gfpp_inverse ( n, alpha );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  GIVENS
%
  title = 'GIVENS';
  n = 5;
  cond1 = givens_condition ( n );

  a = givens ( n, n );
  b = givens_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  HANKEL_N
%
  title = 'HANKEL_N';
  n = 5;
  cond1 = hankel_n_condition ( n );

  a = hankel_n ( n );
  b = hankel_n_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  HARMAN
%
  title = 'HARMAN';
  n = 8;
  cond1 = harman_condition ( );

  a = harman ( );
  b = harman_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  HARTLEY
%
  title = 'HARTLEY';
  n = 5;
  cond1 = hartley_condition ( n );

  a = hartley ( n );
  b = hartley_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  IDENTITY
%
  title = 'IDENTITY';
  n = 5;
  cond1 = identity_condition ( n );

  a = identity ( n, n );
  b = identity_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  ILL3
%
  title = 'ILL3';
  n = 3;
  cond1 = ill3_condition ( );

  a = ill3 ( );
  b = ill3_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  JORDAN
%
  title = 'JORDAN';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = jordan_condition ( n, alpha );

  a = jordan ( n, n, alpha );
  b = jordan_inverse ( n, alpha );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  KERSHAW
%
  title = 'KERSHAW';
  n = 4;
  cond1 = kershaw_condition ( );

  a = kershaw ( );
  b = kershaw_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  LIETZKE
%
  title = 'LIETZKE';
  n = 5;
  cond1 = lietzke_condition ( n );

  a = lietzke ( n );
  b = lietzke_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  MAXIJ
%
  title = 'MAXIJ';
  n = 5;
  cond1 = maxij_condition ( n );

  a = maxij ( n, n );
  b = maxij_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  MINIJ
%
  title = 'MINIJ';
  n = 5;
  cond1 = minij_condition ( n );

  a = minij ( n, n );
  b = minij_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  ORTH_SYMM
%
  title = 'ORTH_SYMM';
  n = 5;
  cond1 = orth_symm_condition ( n );

  a = orth_symm ( n );
  b = orth_symm_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  OTO
%
  title = 'OTO';
  n = 5;
  cond1 = oto_condition ( n );

  a = oto ( n, n );
  b = oto_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  PASCAL1
%
  title = 'PASCAL1';
  n = 5;
  cond1 = pascal1_condition ( n );

  a = pascal1 ( n );
  b = pascal1_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  PASCAL3
%
  title = 'PASCAL3';
  n = 5;
  r8_lo = 1.0;
  r8_hi = 10.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = pascal3_condition ( n, alpha );

  a = pascal3 ( n, alpha );
  b = pascal3_inverse ( n, alpha );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  PEI
%
  title = 'PEI';
  n = 5;
  r8_lo = 1.0;
  r8_hi = 10.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = pei_condition ( alpha, n );

  a = pei ( alpha, n );
  b = pei_inverse ( alpha, n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  RODMAN
%
  title = 'RODMAN';
  n = 5;
  r8_lo = 1.0;
  r8_hi = 10.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = rodman_condition ( n, alpha );

  a = rodman ( n, n, alpha );
  b = rodman_inverse ( n, alpha );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  RUTIS1
%
  title = 'RUTIS1';
  n = 4;
  cond1 = rutis1_condition ( );

  a = rutis1 ( );
  b = rutis1_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  RUTIS2
%
  title = 'RUTIS2';
  n = 4;
  cond1 = rutis2_condition ( );

  a = rutis2 ( );
  b = rutis2_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  RUTIS3
%
  title = 'RUTIS3';
  n = 4;
  cond1 = rutis3_condition ( );

  a = rutis3 ( );
  b = rutis3_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  RUTIS5
%
  title = 'RUTIS5';
  n = 4;
  cond1 = rutis5_condition ( );

  a = rutis5 ( );
  b = rutis5_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  SUMMATION
%
  title = 'SUMMATION';
  n = 5;
  cond1 = summation_condition ( n );

  a = summation ( n, n );
  b = summation_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  SWEET1
%
  title = 'SWEET1';
  n = 6;
  cond1 = sweet1_condition ( );

  a = sweet1 ( );
  b = sweet1_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  SWEET2
%
  title = 'SWEET2';
  n = 6;
  cond1 = sweet2_condition ( );

  a = sweet2 ( );
  b = sweet2_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  SWEET3
%
  title = 'SWEET3';
  n = 6;
  cond1 = sweet3_condition ( );

  a = sweet3 ( );
  b = sweet3_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  SWEET4
%
  title = 'SWEET4';
  n = 13;
  cond1 = sweet4_condition ( );

  a = sweet4 ( );
  b = sweet4_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  TRI_UPPER
%
  title = 'TRI_UPPER';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  cond1 = tri_upper_condition ( alpha, n );

  a = tri_upper ( alpha, n );
  b = tri_upper_inverse ( alpha, n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  UPSHIFT
%
  title = 'UPSHIFT';
  n = 5;
  cond1 = upshift_condition ( n );

  a = upshift ( n );
  b = upshift_inverse ( n );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  WILK03
%
  title = 'WILK03';
  n = 3;
  cond1 = wilk03_condition ( );

  a = wilk03 ( );
  b = wilk03_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  WILK04
%
  title = 'WILK04';
  n = 4;
  cond1 = wilk04_condition ( );

  a = wilk04 ( );
  b = wilk04_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  WILK05
%
  title = 'WILK05';
  n = 5;
  cond1 = wilk05_condition ( );

  a = wilk05 ( );
  b = wilk05_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );
%
%  WILSON
%
  title = 'WILSON';
  n = 4;
  cond1 = wilson_condition ( );

  a = wilson ( );
  b = wilson_inverse ( );
  a_norm = norm ( a, 1 );
  b_norm = norm ( b, 1 );
  cond2 = a_norm * b_norm;

  fprintf ( 1, '  %-20s  %4d  %14.6g  %14.6g\n', title, n, cond1, cond2 );

  return
end
