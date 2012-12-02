function van_der_corput_test02 ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST02 tests VAN_DER_CORPUT_SEQUENCE.
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
  fprintf ( 1, 'VAN_DER_CORPUT_TEST02\n' );
  fprintf ( 1, '  VAN_DER_CORPUT_SEQUENCE returns N elements\n' );
  fprintf ( 1, '  of a van der Corput sequence in the current base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I   R\n' );
  fprintf ( 1, '\n' );

  seed = 0;
  van_der_corput_seed_set ( seed );

  base = 2;
  van_der_corput_base_set ( base );

  n = 10;
  r = van_der_corput_sequence ( n );

  for i = 1: 10
    fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
  end

  return
end
