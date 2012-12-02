function van_der_corput_test03 ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST03 tests VAN_DER_CORPUT_SEQUENCE, VAN_DER_CORPUT_SEED_GET, VAN_DER_CORPUT_SEED_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VAN_DER_CORPUT_TEST03\n' );
  fprintf ( 1, '  VAN_DER_CORPUT_SEED_SET sets the seed;\n' );
  fprintf ( 1, '  VAN_DER_CORPUT_SEED_GET gets the seed;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we demonstrate how computing elements\n' );
  fprintf ( 1, '  affects the seed, and how resetting the seed determines\n' );
  fprintf ( 1, '  the next element computed.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We start at element 0 and compute 10 elements.\n' );
  fprintf ( 1, '\n' );

  seed = 0;
  van_der_corput_seed_set ( seed );

  base = 2;
  van_der_corput_base_set ( base );

  n = 10;
  r = van_der_corput_sequence ( n );

  for i = 1: n
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  seed = van_der_corput_seed_get ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The current seed is %d\n', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We jump back to element 6 and compute 10 elements.\n' );
  fprintf ( 1, '\n' );

  seed = 6;
  van_der_corput_seed_set ( seed );

  n = 10;
  r = van_der_corput_sequence ( n );

  for i = 1: n
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  seed = van_der_corput_seed_get ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The current seed is %d\n', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We restart at element 0 and compute 6 elements.\n' );
  fprintf ( 1, '\n' );

  seed = 0;
  van_der_corput_seed_set ( seed );

  n = 6;
  r = van_der_corput_sequence ( n );

  for i = 1: n
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  seed = van_der_corput_seed_get ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The current seed is %d\n', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We jump to element 100 and compute 5 elements.\n' );
  fprintf ( 1, '\n' );

  seed = 100;
  van_der_corput_seed_set ( seed );

  n = 5;
  r = van_der_corput_sequence ( n );

  for i = 1: n
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  seed = van_der_corput_seed_get ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The current seed is %d\n', seed );

  return
end
