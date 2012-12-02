function van_der_corput_test01 ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST01 tests VAN_DER_CORPUT.
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
  fprintf ( 1, 'VAN_DER_CORPUT_TEST01\n' );
  fprintf ( 1, '  VAN_DER_CORPUT returns the next element\n' );
  fprintf ( 1, '  of a van der Corput sequence in the current base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I   R\n' );
  fprintf ( 1, '\n' );

  seed = 0;
  van_der_corput_seed_set ( seed );

  base = 2;
  van_der_corput_base_set ( base );

  for i = 0: 10
    r = van_der_corput ( );
    fprintf ( 1, '%d %f\n', seed+i, r );
  end

  return
end
