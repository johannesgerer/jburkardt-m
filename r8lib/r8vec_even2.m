function [ nval, xval ] = r8vec_even2 ( maxval, nfill, nold, xold )

%*****************************************************************************80
%
%% R8VEC_EVEN2 linearly interpolates new numbers into an R8VEC.
%
%  Discussion:
%
%    The number of values created between two old values can vary from
%    one pair of values to the next.
%
%    The interpolated values are evenly spaced.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MAXVAL, the size of the XVAL array, as declared by the
%    user.  MAXVAL must be large enough to hold the NVAL values computed by
%    this routine.  In other words, MAXVAL must be at least equal to
%    NOLD + SUM (1 <= I <= NOLD-1) NFILL(I).
%
%    Input, integer NFILL(NOLD-1), the number of values
%    to be interpolated between XOLD(I) and XOLD(I+1).
%    NFILL(I) does not count the endpoints.  Thus, if
%    NFILL(I) is 1, there will be one new point generated
%    between XOLD(I) and XOLD(I+1).
%    NFILL(I) must be nonnegative.
%
%    Input, integer NOLD, the number of values XOLD,
%    between which extra values are to be interpolated.
%
%    Input, real XOLD(NOLD), the original vector of numbers
%    between which new values are to be interpolated.
%
%    Output, integer NVAL, the number of values computed
%    in the XVAL array.
%    NVAL = NOLD + SUM ( 1 <= I <= NOLD-1 ) NFILL(I)
%
%    Output, real XVAL(MAXVAL).  On output, XVAL contains the
%    NOLD values of XOLD, as well as the interpolated
%    values, making a total of NVAL values.
%
  nval = 1;

  for i = 1 : nold-1

    if ( nfill(i) < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8VEC_EVEN2 - Fatal error!\n' );
      fprintf ( 1, '  NFILL(I) is negative for I = %d\n', i );
      fprintf ( 1, '  NFILL(I) = %d\n', nfill(i) );
      error ( 'R8VEC_EVEN2 - Fatal error!' );
    end

    if ( maxval < nval + nfill(i) + 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8VEC_EVEN2 - Fatal error!\n' );
      fprintf ( 1, '  MAXVAL is not large enough.\n' );
      fprintf ( 1, '  MAXVAL = %d\n', maxval );
      fprintf ( 1, '  which is exceeded by storage requirements\n' );
      fprintf ( 1, '  for interpolating in interval %d\n', i );
      error ( 'R8VEC_EVEN2 - Fatal error!' );
    end

    nadd = nfill(i) + 2;

    xval(nval:nval+nfill(i)+1) = r8vec_even ( nadd, xold(i), xold(i+1) );

    nval = nval + nfill(i) + 1;

  end 

  return
end
