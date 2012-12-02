function [ left, right ] = ivec_bracket ( n, x, xval )

%*****************************************************************************80
%
%% IVEC_BRACKET searches a sorted IVEC for successive brackets of a value.
%
%  Discussion:
%
%    If the values in the vector are thought of as defining intervals
%    on the real line, then this routine searches for the interval
%    nearest to or containing the given value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, length of input array.
%
%    Input, integer X(N), an array that has been sorted into ascending order.
%
%    Input, integer XVAL, a value to be bracketed.
%
%    Output, integer LEFT, RIGHT, the results of the search.
%    Either:
%      XVAL < X(1), when LEFT = 1, RIGHT = 2;
%      XVAL > X(N), when LEFT = N-1, RIGHT = N;
%    or
%      X(LEFT) <= XVAL <= X(RIGHT).
%
  for i = 2: n - 1

    if ( xval < x(i) )
      left = i - 1;
      right = i;
      return;
    end

  end

  left = n - 1;
  right = n;

  return
end
