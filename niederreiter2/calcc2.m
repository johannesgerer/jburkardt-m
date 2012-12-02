function cj = calcc2 ( dimen )

%*****************************************************************************80
%
%% CALCC2 computes the constants C(I,J,R).
%
%  Discussion:
%
%    As far as possible, Niederreiter's notation is used.
%
%    For each value of I, we first calculate all the corresponding
%    values of C.  These are held in the array CI.  All these
%    values are either 0 or 1.
%
%    Next we pack the values into the
%    array CJ, in such a way that CJ(I,R) holds the values of C
%    for the indicated values of I and R and for every value of
%    J from 1 to NBITS.  The most significant bit of CJ(I,R)
%    (not counting the sign bit) is C(I,1,R) and the least
%    significant bit is C(I,NBITS,R).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    R Lidl and Harald Niederreiter,
%    Finite Fields,
%    Cambridge University Press, 1984, page 553.
%
%    Harald Niederreiter,
%    Low-discrepancy and low-dispersion sequences,
%    Journal of Number Theory,
%    Volume 30, 1988, pages 51-70.
%
%  Parameters:
%
%    Input, integer DIMEN, the dimension of the sequence to be generated.
%
%    Output, integer CJ(MAXDIM,0:NBITS-1), the packed values of
%    Niederreiter's C(I,J,R)
%
%  Local Parameters:
%
%    Local, integer MAXDIM, the maximum dimension that will be used.
%
%    Local, integer MAXE; we need MAXDIM irreducible polynomials over Z2.
%    MAXE is the highest degree among these.
%
%    Local, integer MAXV, the maximum possible index used in V.
%
%    Local, integer NBITS, the number of bits (not counting the sign) in a
%    fixed-point integer.
%
  maxdim = 20;
  maxe = 6;
  nbits = 31;

  maxv = nbits + maxe;
%
%  Here we supply the coefficients and the
%  degrees of the first MAXDIM irreducible polynomials over Z2.
%
  irred_deg(1:maxdim) = ...
    [ 1, 1, 2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6 ];

  irred(1:maxdim,1:maxe+1) = [ ...
    0,1,0,0,0,0,0; ...
    1,1,0,0,0,0,0; ...
    1,1,1,0,0,0,0; ...
    1,1,0,1,0,0,0; ...
    1,0,1,1,0,0,0; ...
    1,1,0,0,1,0,0; ...
    1,0,0,1,1,0,0; ...
    1,1,1,1,1,0,0; ...
    1,0,1,0,0,1,0; ...
    1,0,0,1,0,1,0; ...
    1,1,1,1,0,1,0; ...
    1,1,1,0,1,1,0; ...
    1,1,0,1,1,1,0; ...
    1,0,1,1,1,1,0; ...
    1,1,0,0,0,0,1; ...
    1,0,0,1,0,0,1; ...
    1,1,1,0,1,0,1; ...
    1,1,0,1,1,0,1; ...
    1,0,0,0,0,1,1; ...
    1,1,1,0,0,1,1];
%
%  Prepare to work in Z2.
%
  [ add, mul, sub ] = setfld2 ( 0 );

  for i = 1 : dimen
%
%  For each dimension, we need to calculate powers of an
%  appropriate irreducible polynomial:  see Niederreiter
%  page 65, just below equation (19).
%
%  Copy the appropriate irreducible polynomial into PX,
%  and its degree into E.  Set polynomial B = PX ** 0 = 1.
%  M is the degree of B.  Subsequently B will hold higher
%  powers of PX.
%
    e = irred_deg(i);

    px_deg = irred_deg(i);

    for j = 0 : e
      px(j+1) = irred(i,j+1);
    end

    b_deg = 0;
    b(0+1) = 1;
%
%  Niederreiter (page 56, after equation (7), defines two
%  variables Q and U.  We do not need Q explicitly, but we do need U.
%
    u = 0;

    for j = 1 : nbits
%
%  If U = 0, we need to set B to the next power of PX
%  and recalculate V.  This is done by subroutine CALCV2.
%
      if ( u == 0 )
        [ b_deg, b, v ] = calcv2 ( maxv, px_deg, px, add, mul, sub, b_deg, b );
      end
%
%  Now C is obtained from V.  Niederreiter obtains A from V (page 65,
%  near the bottom), and then gets C from A (page 56, equation (7)).
%  However this can be done in one step.  Here CI(J,R) corresponds to
%  Niederreiter's C(I,J,R).
%
      for r = 0 : nbits-1
        ci(j,r+1) = v(r+u+1);
      end
%
%  Increment U.
%
%  If U = E, then U = 0 and in Niederreiter's
%  paper Q = Q + 1.  Here, however, Q is not used explicitly.
%
      u = u + 1;
      if ( u == e )
        u = 0;
      end

    end
%
%  The array CI now holds the values of C(I,J,R) for this value
%  of I.  We pack them into array CJ so that CJ(I,R) holds all
%  the values of C(I,J,R) for J from 1 to NBITS.
%
    for r = 0 : nbits-1
      term = 0;
      for j = 1 : nbits
        term = 2 * term + ci(j,r+1);
      end
      cj(i,r+1) = term;
    end

  end

  return
end
