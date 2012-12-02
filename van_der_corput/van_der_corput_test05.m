function van_der_corput_test05

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST05 tests I4_TO_VAN_DER_CORPUT.
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
  fprintf ( 1, 'VAN_DER_CORPUT_TEST05\n' );
  fprintf ( 1, '  I4_TO_VAN_DER_CORPUT returns the I-th element\n' );
  fprintf ( 1, '  of a van der Corput sequence to a given base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Base    Seed   R\n' );
  fprintf ( 1, '\n' );

  for base = 2: 5

    fprintf ( 1, '\n' );
    fprintf ( 1, '%d\n', base );

    for seed = 0: 10
      r = i4_to_van_der_corput ( seed, base );
      fprintf ( 1, '%d %f\n', seed, r );
    end

  end

  return
end
