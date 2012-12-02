function [ a, isplit ] = i4vec_split_unsort ( n, a, split )

%*****************************************************************************80
%
%% I4VEC_SPLIT_UNSORT "splits" an unsorted I4VEC based on a splitting value.
%
%  Discussion:
%
%    If the vector is already sorted, it is simpler to do a binary search
%    on the data than to call this routine.
%
%    The vector is not assumed to be sorted before input, and is not
%    sorted during processing.  If sorting is not needed, then it is
%    more efficient to use this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, integer A(N), the array to split.  
%
%    Input, integer SPLIT, the value used to split the vector.
%    It is not necessary that any value of A actually equal SPLIT.
%
%    Input, integer A(N), all the entries of A that are less than 
%    or equal to SPLIT are in A(1:ISPLIT); entries greater than
%    SPLIT have moved to A(ISPLIT+1:N).
%
%    Output, integer ISPLIT, indicates the position of the last
%    entry of the split vector that is less than or equal to SPLIT.
%

%
%  Partition the vector into A1, A2, A3, where
%    A1 = A(I1:J1) holds values <= SPLIT,
%    A2 = A(I2:J2) holds untested values,
%    A3 = A(I3:J3) holds values > SPLIT.
%
  i1 = 1;
  j1 = 0;

  i2 = 1;
  j2 = n;

  i3 = n + 1;
  j3 = n;
%
%  Pick the next item from A2, and move it into A1 or A3.
%  Adjust indices appropriately.
%
  for i = 1 : n

    if ( a(i2) <= split )
      i2 = i2 + 1;
      j1 = j1 + 1;
    else
      temp = a(i2);
      a(i2) = a(i3-1);
      a(i3-1) = temp;
      i3 = i3 - 1;
      j2 = j2 - 1;
    end

  end

  isplit = j1;

  return
end
