function van_der_corput_test04 ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST04 tests VAN_DER_CORPUT_SEQUENCE, VAN_DER_CORPUT_SEED_GET, VAN_DER_CORPUT_SEED_SET.
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
  fprintf ( 1, 'VAN_DER_CORPUT_TEST04\n' );
  fprintf ( 1, '  VAN_DER_CORPUT_BASE_SET sets the base;\n' );
  fprintf ( 1, '  VAN_DER_CORPUT_BASE_GET gets the base;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we show how setting the base changes\n' );
  fprintf ( 1, '  the results of the sequence.\n' );
  fprintf ( 1, '\n' );

  seed = 0;
  van_der_corput_seed_set ( seed );

  base = 2;
  van_der_corput_base_set ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current SEED = %d\n', seed );
  fprintf ( 1, '  Current BASE = %d\n', base );

  n = 10;
  r = van_der_corput_sequence ( n );

  for i = 1: n
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  seed = 0;
  van_der_corput_seed_set ( seed );

  base = 3;
  van_der_corput_base_set ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat the calculation with a new base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current SEED = %d\n', seed );
  fprintf ( 1, '  Current BASE = %d\n', base );

  seed = van_der_corput_seed_get ( );

  n = 10;
  r = van_der_corput_sequence ( n );

  for i = 1: n
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  seed = 0;
  van_der_corput_seed_set ( seed );

  base = 4;
  van_der_corput_base_set ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat the calculation with a new base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current SEED = %d\n', seed );
  fprintf ( 1, '  Current BASE = %d\n', base );

  seed = van_der_corput_seed_get ( );

  n = 10;
  r = van_der_corput_sequence ( n );

  for i = 1: n
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  return
end
