function [ bin, bin_limit ] = r8vec_bin ( n, x, bin_num, bin_min, bin_max )

%*****************************************************************************80
%
%% R8VEC_BIN computes bins based on a given R8VEC.
%
%  Discussion:
%
%    The user specifies minimum and maximum bin values, BIN_MIN and
%    BIN_MAX, and the number of bins, BIN_NUM.  This determines a
%    "bin width":
%
%      H = ( BIN_MAX - BIN_MIN ) / BIN_NUM
%
%    so that bin I will count all entries X(J) such that
%
%      BIN_LIMIT(I-1) <= X(J) < BIN_LIMIT(I).
%
%    The array X does NOT have to be sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries of X.
%
%    Input, real X(N), an (unsorted) array to be binned.
%
%    Input, integer BIN_NUM, the number of bins.  Two extra bins,
%    #1 and #BIN_NUM+2, count extreme values.
%
%    Input, real BIN_MIN, BIN_MAX, define the range and size
%    of the bins.  BIN_MIN and BIN_MAX must be distinct.
%    Normally, BIN_MIN < BIN_MAX, and the documentation will assume
%    this, but proper results will be computed if BIN_MIN > BIN_MAX.
%
%    Output, integer BIN(1:BIN_NUM+2).
%    BIN(1) counts entries of X less than BIN_MIN.
%    BIN(BIN_NUM+2) counts entries greater than or equal to BIN_MAX.
%    For 2 <= I <= BIN_NUM+1, BIN(I) counts the entries X(J) such that
%      BIN_LIMIT(I-1) <= X(J) < BIN_LIMIT(I).
%    where H is the bin spacing.
%
%    Output, real BIN_LIMIT(1:BIN_NUM+1), the "limits" of the bins.
%    BIN(I) counts the number of entries X(J) such that
%      BIN_LIMIT(I-1) <= X(J) < BIN_LIMIT(I).
%
  if ( bin_max == bin_min )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_BIN - Fatal error!\n' );
    fprintf ( 1, '  BIN_MIN = BIN_MAX.\n' );
    error ( 'R8VEC_BIN - Fatal error!' )
  end

  bin(1:bin_num+2) = 0;

  for i = 1 : n

    t = ( x(i) - bin_min ) / ( bin_max - bin_min );

    if ( t < 0.0 )
      j = 0;
    elseif ( 1.0 <= t )
      j = bin_num + 1;
    else
      j = 1 + floor ( bin_num * t );
    end

    bin(j+1) = bin(j+1) + 1;

  end
%
%  Compute the bin limits.
%
  for i = 0 : bin_num
    bin_limit(i+1) = (   ( bin_num - i ) * bin_min  ...
                       + (           i ) * bin_max ) ...
                       / ( bin_num    );
  end

  return
end
