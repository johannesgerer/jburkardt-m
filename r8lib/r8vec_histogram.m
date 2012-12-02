function histo_gram = r8vec_histogram ( n, a, a_lo, a_hi, histo_num )

%*****************************************************************************80
%
%% R8VEC_HISTOGRAM computes a histogram of the elements of an R8VEC.
%
%  Discussion:
%
%    Values between A_LO and A_HI will be histogrammed into the bins
%    1 through HISTO_NUM.  Values below A_LO are counted in bin 0,
%    and values greater than A_HI are counted in bin HISTO_NUM+1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, real A(N), the array to examine.
%
%    Input, real A_LO, A_HI, the lowest and highest
%    values to be histogrammed.  These values will also define the bins.
%
%    Input, integer HISTO_NUM, the number of bins to use.
%
%    Output, integer HISTO_GRAM(0:HISTO_NUM+1), contains the number of
%    entries of A in each bin.
%
  histo_gram(1:histo_num+2) = 0;

  delta = ( a_hi - a_lo ) / ( 2 * histo_num );

  for i = 1 : n

    if ( a(i) < a_lo )

      histo_gram(1) = histo_gram(2) + 1;

    elseif ( a(i) <= a_hi )

      j = round ( ...
        ( ( a_hi -       delta - a(i)        ) * ( 1         )   ...
        + (      -       delta + a(i) - a_lo ) * ( histo_num ) ) ...
        / ( a_hi - 2.0 * delta        - a_lo ) );

      histo_gram(j+1) = histo_gram(j+1) + 1;

    elseif ( a_hi < a(i) )

      histo_gram(histo_num+2) = histo_gram(histo_num+2) + 1;

    end

  end

  return
end
