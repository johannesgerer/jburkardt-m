function histo_gram = i4vec_histogram_masked ( n, a, histo_num_mask )

%*****************************************************************************80
%
%% I4VEC_HISTOGRAM_MASKED computes a histogram of a masked I4VEC.
%
%  Discussion:
%
%    It is assumed that the entries in the vector A are nonnegative.
%    Only values between 0 and HISTO_NUM will be histogrammed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, integer A(N), the array to examine.
%
%    Input, integer HISTO_NUM, the maximum value for which a
%    histogram entry will be computed.
%
%    Input, integer MASK(N), the mask.
%
%    Output, integer HISTO_GRAM(1:HISTO_NUM+1), contains the number of
%    entries of A with the values of 0 through HISTO_NUM.
%
  histo_gram(1:histo_num+1) = 0;

  for i = 1 : n

    if ( mask(i) == 1 )

      if ( 0 <= a(i) && a(i) <= histo_num )
        histo_gram(a(i)+1) = histo_gram(a(i)+1) + 1;
      end

    end

  end

  return
end
