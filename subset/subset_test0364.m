function subset_test0364 ( )

%*****************************************************************************80
%
%% TEST0364 tests I4_TO_I4POLY, I4_TO_VAN_DER_CORPUT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n_test = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0364\n' );
  fprintf ( 1, '  I4_TO_VAN_DER_CORPUT computes the elements\n' );
  fprintf ( 1, '    of a van der Corput sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I4_TO_I4POLY converts an integer to an integer\n' );
  fprintf ( 1, '    polynomial in some base, and can be used to mimic\n' );
  fprintf ( 1, '    the van der Corput calculation.\n' );
  fprintf ( 1, '\n' );

  for j = 1 : 3

    base = prime(j);
    fprintf ( 1, '\n' );
    fprintf ( 1, '  BASE = %d\n', base );
    fprintf ( 1, '\n' );

    for i = 1 : n_test

      h1 = i4_to_van_der_corput ( i, base );

      [ ipoly, degree ] = i4_to_i4poly ( i, base );

      ipoly = i4vec_reverse ( degree+1, ipoly );

      value = i4poly_to_i4 ( degree, ipoly, base );

      h2 = value / base^(degree+1);

      fprintf ( 1, '  %6d  %14f  %14f\n', i, h1, h2 );

    end

  end

  return
end
