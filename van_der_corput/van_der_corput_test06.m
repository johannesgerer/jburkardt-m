function van_der_corput_test06 ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST06 tests I4_TO_VAN_DER_CORPUT_SEQUENCE.
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
  fprintf ( 1, 'VAN_DER_CORPUT_TEST06\n' );
  fprintf ( 1, '  I_TO_VAN_DER_CORPUT_SEQUENCE returns N elements\n' );
  fprintf ( 1, '  of a van der Corput sequence to a given base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Base    Seed   R\n' );
  fprintf ( 1, '\n' );

  n = 10;

  for base = 2: 5

    fprintf ( 1, '\n' );
    fprintf ( 1, '%d\n', base );

    seed = 0;

    r = i4_to_van_der_corput_sequence ( seed, base, n );

    for i = 1: n
      fprintf ( 1, '%d %f\n', seed+i-1, r(i) );
    end

  end

  return
end
