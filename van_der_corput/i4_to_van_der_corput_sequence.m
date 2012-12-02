function r = i4_to_van_der_corput_sequence ( seed, base, n )

%*****************************************************************************80
%
%% I4_TO_VAN_DER_CORPUT_SEQUENCE: next N elements of a van der Corput sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Halton,
%    On the efficiency of certain quasi-random sequences of points
%    in evaluating multi-dimensional integrals,
%    Numerische Mathematik,
%    Volume 2, pages 84-90, 1960.
%
%    Johannes van der Corput,
%    Verteilungsfunktionen I & II,
%    Nederl. Akad. Wetensch. Proc.,
%    Volume 38, 1935, pages 813-820, pages 1058-1066.
%
%  Parameters:
%
%    Input, integer SEED, the seed or index of the desired element.
%    SEED should be nonnegative.
%    SEED = 0 is allowed, and returns R = 0.
%
%    Input, integer BASE, the van der Corput base, which is typically
%    a prime number.  BASE must be greater than 1.
%
%    Input, integer N, the number of elements to compute.
%
%    Output, real R[N], the SEED-th through SEED+N-1th elements of
%    the van der Corput sequence for base BASE.
%
  r(1:n) = 0.0;
%
%  Ensure that BASE is an acceptable integer.
%
  base = floor ( base );

  if ( base <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The input base BASE is <= 1!\n' );
    fprintf ( 1, '  BASE = %d\n', base );
    error ( 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!' );
  end
%
%  Ensure that SEED is an acceptable integer.
%
  seed = floor ( seed );

  if ( seed < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The input base SEED is < 0!\n' );
    fprintf ( 1, '  SEED = %d\n', seed );
    error ( 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!' );
  end
%
%  Carry out the computation.
%
  seed2(1:n) = seed:1:seed+n-1;
  base_inv = 1.0 / base;

  while ( any ( seed2 ~= 0 ) )
    digit = mod ( seed2, base );
    r = r + digit * base_inv;
    base_inv = base_inv / base;
    seed2 = floor ( seed2 / base );
  end

  return
end
