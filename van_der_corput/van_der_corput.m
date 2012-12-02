function r = van_der_corput ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT computes an element of a van der Corput sequence.
%
%  Discussion:
%
%    The global variables van_der_corput_SEED and van_der_corput_BASE
%    control the computation.  Therefore, before using this routine the
%    first time, the user should ensure that these values have been
%    set, perhaps by calls to van_der_corput_base_set() and
%    van_der_corput_seed_set().  Each call by the user produces the next
%    element of the current sequence.  The seed value is automatically
%    incremented.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 20080
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
%    Output, real R, the SEED-th element of the van der Corput sequence
%    for base BASE.
%
  base = van_der_corput_base_get ( );

  seed = van_der_corput_seed_get ( );

  r = i4_to_van_der_corput ( seed, base );

  seed = seed + 1;

  van_der_corput_seed_set ( seed );

  return
end
