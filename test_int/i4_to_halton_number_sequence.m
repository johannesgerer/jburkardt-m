function r = i4_to_halton_number_sequence ( seed, base, n )

%*****************************************************************************80
%
%% I4_TO_HALTON_NUMBER_SEQUENCE computes the next N elements of a scalar Halton sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
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
%  Parameters:
%
%    Input, integer SEED, the index of the desired element.
%    Only the absolute value of SEED is considered.
%    SEED = 0 is allowed, and returns R = 0.
%
%    Input, integer BASE, the Halton base, which should be a prime number.
%    This routine only checks that BASE is greater than 1.
%
%    Input, integer N, the number of elements desired.
%
%    Output, real R(N), the SEED-th through (SEED+N-1)-th
%    elements of the Halton sequence for base BASE.
%

%
%  Set SEED2 = ( SEED, SEED+1, SEED+2, ..., SEED+N-1 )
%
  seed2(1:n) = ( 1 : n ) + abs ( seed ) - 1;

  if ( base <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_HALTON_NUMBER_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The input base BASE is <= 1!\n' );
    fprintf ( 1, '  BASE = %d\n', base );
    error ( 'I4_TO_HALTON_NUMBER_SEQUENCE - Fatal error!' );
  end

  base_inv = 1.0 / base;

  r(1:n) = 0.0;

  while ( any ( seed2(1:n) ~= 0 ) )
    digit(1:n) = mod ( seed2(1:n), base );
    r(1:n) = r(1:n) + digit(1:n) * base_inv;
    base_inv = base_inv / base;
    seed2(1:n) = floor ( seed2(1:n) / base );
  end

  return
end
