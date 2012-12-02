function [ quasi, seed_new ] = niederreiter2 ( dim, seed )

%*****************************************************************************80
%
%% NIEDERREITER2 returns an element of the Niederreiter sequence base 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Harald Niederreiter,
%    Low-discrepancy and low-dispersion sequences,
%    Journal of Number Theory,
%    Volume 30, 1988, pages 51-70.
%
%  Parameters:
%
%    Input, integer DIM, the dimension of the sequence to be generated.
%
%    Input, integer SEED, the index of the element to compute.
%
%    Output, real QUASI(DIM), the next quasirandom vector.
%
%    Output, integer SEED_NEW, the next value of the SEED.
%
%  Local Parameters:
%
%    Local, integer MAXDIM, the maximum dimension that will be used.
%
%    Local, integer NBITS, the number of bits (not counting the sign) in a
%    fixed-point integer.
%
%    Local, real RECIP is the multiplier which changes the
%    integers in NEXTQ into the required real values in QUASI.
%
%    Local, integer NR_cj(MAXDIM,NBITS), the packed values of
%    Niederreiter's C(I,J,R).
%
%    Local, integer NR_dim, the spatial dimension of the sequence
%    as specified on an initialization call.
%
%    Local, integer NR_nextq(MAXDIM), the numerators of the next item in the
%    series.  These are like Niederreiter's XI(N) (page 54) except that
%    N is implicit, and the NR_nextq are integers.  To obtain
%    the values of XI(N), multiply by RECIP.
%
  global NR_cj;
  global NR_dim;
  global NR_nextq;
  global NR_seed;

  maxdim = 20;
  nbits = 31;
  recip = 2.0E+00^(-nbits);
%
%  Initialization.
%
  if ( isempty ( NR_dim ) | dim ~= NR_dim | seed <= 0 )

    if ( dim <= 0 | maxdim < dim )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NIEDERREITER2 - Fatal error!\n' );
      fprintf ( 1, '  Bad spatial dimension.\n' );
      error ( 'Fatal error in NIEDERREITER2!' );
    end

    NR_dim = dim;

    if ( seed < 0 )
      seed = 0;
    end

    NR_seed = seed;
%
%  Calculate the C array.
%
    NR_cj(1:dim,1:nbits) = calcc2 ( dim );

  end
%
%  Set up NEXTQ appropriately, depending on the Gray code of SEED.
%
%  You can do this every time, starting NEXTQ back at 0,
%  or you can do it once, and then carry the value of NEXTQ
%  around from the previous computation.
%
  if ( seed ~= NR_seed + 1 )

    gray = exor ( seed, seed / 2 );

    NR_nextq(1:dim) = 0;

    r = 0;

    while ( gray ~= 0 )

      if ( rem ( gray, 2 ) ~= 0 )
        for i = 1 : dim
          NR_nextq(i) = exor ( NR_nextq(i), NR_cj(i,r+1) );
        end
      end

      gray = floor ( gray / 2 );
      r = r + 1;

    end

  end
%
%  Multiply the numerators in NEXTQ by RECIP to get the next
%  quasi-random vector.
%
  quasi(1:dim) = NR_nextq(1:dim) * recip;
%
%  Find the position of the right-hand zero in SEED.  This
%  is the bit that changes in the Gray-code representation as
%  we go from SEED to SEED+1.
%
  r = 0;
  i = seed;

  while ( rem ( i, 2 ) ~= 0 )
    r = r + 1;
    i = floor ( i / 2 );
  end
%
%  Check that we have not passed 2**NBITS calls.
%
  if ( nbits <= r )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NIEDERREITER2 - Fatal error!\n' );
    fprintf ( 1, '  Too many calls!\n' );
    error ( 'Fatal error in NIEDERREITER2!' );
  end
%
%  Compute the new numerators in vector NEXTQ.
%
  for i = 1 : dim
    NR_nextq(i) = exor ( NR_nextq(i), NR_cj(i,r+1) );
  end

  NR_seed = seed;
  seed_new = seed + 1;

  return
end
