function r = i4_to_halton ( seed, base )

%*****************************************************************************80
%
%% I4_TO_HALTON computes an element of a Halton sequence.
%
%  Reference:
%
%    John Halton,
%    On the efficiency of certain quasi-random sequences of points
%    in evaluating multi-dimensional integrals,
%    Numerische Mathematik,
%    Volume 2, pages 84-90, 1960.
% 
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, the seed or index of the desired element.
%    SEED should be nonnegative.  Only the integer part of SEED is used.
%    SEED = 0 is allowed, and returns R = 0.
%
%    Input, integer BASE(1:ndim), the Halton bases, which are typically
%    prime numbers.  Only the integer part of BASE is used.
%    BASE must be greater than 1.
%
%    Output, real R(1:ndim), the SEED-th element of the Halton sequence.
%
  ndim = length ( base );

  r(1:ndim) = 0.0;
%
%  Ensure that BASE is an integer, and acceptable.
%
  base = floor ( base );

  if ( any ( base <= 1 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_HALTON - Fatal error!\n' );
    fprintf ( 1, '  Some input base is <= 1!\n' );
    return
  end
%
%  Ensure that SEED is an integer, and acceptable.
%
  seed = floor ( seed );

  if ( seed < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_HALTON - Fatal error!\n' );
    fprintf ( 1, '  The input SEED is < 0!\n' );
    fprintf ( 1, '  SEED = %d\n', seed );
    return
  end
%
%  Carry out the computation.
%
  base_inv(1:ndim) = 1.0 ./ base(1:ndim);
  seed2(1:ndim) = seed;

  while ( any ( seed2 ~= 0 ) )
    digit = mod ( seed2, base );
    r = r + digit .* base_inv;
    base_inv = base_inv ./ base;
    seed2 = floor ( seed2 ./ base );
  end

  return
end
