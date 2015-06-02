function histo_gram = i4mat_histogram ( m, n, a, histo_num )

%*****************************************************************************80
%
%% I4MAT_HISTOGRAM computes a histogram of the elements of an I4MAT.
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
%    04 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Input, integer A(M,N), the array to examine.
%
%    Input, integer HISTO_NUM, the maximum value for which a
%    histogram entry will be computed.
%
%    Output, integer HISTO_GRAM(1:HISTO_NUM+1), contains the number of
%    entries of A with the values of 0 through HISTO_NUM.
%
  histo_gram(1:histo_num+1) = 0;

  for j = 1 : n
    for i = 1 : m

      if ( 0 <= a(i,j) && a(i,j) <= histo_num )
        histo_gram(a(i,j)+1) = histo_gram(a(i,j)+1) + 1;
      end

    end
  end

  return
end
