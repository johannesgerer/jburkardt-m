function xval = r8vec_even3 ( nold, nval, xold )

%*****************************************************************************80
%
%% R8VEC_EVEN3 evenly interpolates new data into an R8VEC.
%
%  Discussion:
%
%    This routine accepts a short vector of numbers, and returns a longer
%    vector of numbers, created by interpolating new values between
%    the given values.
%
%    Between any two original values, new values are evenly interpolated.
%
%    Over the whole vector, the new numbers are interpolated in
%    such a way as to try to minimize the largest distance interval size.
%
%    The algorithm employed is not "perfect".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NOLD, the number of values XOLD, between which extra
%    values are to be interpolated.
%
%    Input, integer NVAL, the number of values to be computed
%    in the XVAL array.  NVAL should be at least NOLD.
%
%    Input, real XOLD(NOLD), the original vector of numbers
%    between which new values are to be interpolated.
%
%    Output, real XVAL(NVAL).  On output, XVAL contains the
%    NOLD values of XOLD, as well as interpolated
%    values, making a total of NVAL values.
%

  xlen = 0.0;
  for i = 1 : nold - 1
    xlen = xlen + abs ( xold(i+1) - xold(i) );
  end

  ntemp = nval - nold;

  density = ntemp / xlen;

  ival = 1;
  ntot = 0;
  xlentot = 0.0;

  for i = 1 : nold-1

    xleni = abs ( xold(i+1) - xold(i) );
    npts = floor ( density * xleni );
    ntot = ntot + npts;
%
%  Determine if we have enough left-over density that it should
%  be changed into a point.  A better algorithm would agonize
%  more over where that point should go.
%
    xlentot = xlentot + xleni;
    nmaybe = round ( xlentot * density );

    if ( ntot < nmaybe )
      npts = npts + nmaybe - ntot;
      ntot = nmaybe;
    end

    for j = 1 : npts+2
      xval(ival+j-1) = ( ( npts+2 - j     ) * xold(i)     ...
                       + (          j - 1 ) * xold(i+1) ) ...
                       / ( npts+2     - 1 );
    end

    ival = ival + npts + 1;

  end

  return
end
