function r = van_der_corput_sequence ( n )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_SEQUENCE computes N elements of a van der Corput sequence.
%
%  Discussion:
%
%    The computation is controlled by the values of the internal base
%    and seed, which the user must be certain have been initialized.
%    The current internal base and seed are used, and the seed is
%    incremented by N on return.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Johannes van der Corput,
%    Verteilungsfunktionen I & II,
%    Nederl. Akad. Wetensch. Proc.,
%    Volume 38, 1935, pages 813-820, pages 1058-1066.
%
%  Parameters:
%
%    Global, integer VAN_DER_CORPUT_SEED, the seed or index of the
%    desired element.  SEED should be nonnegative.  Only the integer
%    part of SEED is used.  SEED = 0 is allowed, and returns R = 0.
%
%    Global, integer VAN_DER_CORPUT_BASE, the van der Corput base,
%    which is typically a prime number.  Only the integer part of
%    BASE is used.  BASE must be greater than 1.
%
%    Input, integer N, the number of elements to compute.
%
%    Output, real R(N), the SEED-th through SEED+N-1th elements of
%    the van der Corput sequence for base BASE.
%
  base = van_der_corput_base_get ( );

  seed = van_der_corput_seed_get ( );

  r = i4_to_van_der_corput_sequence ( seed, base, n );

  seed = seed + n;

  van_der_corput_seed_set ( seed );

  return
end
