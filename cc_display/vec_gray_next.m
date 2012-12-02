function [ a, done, change ] = vec_gray_next ( n, base, a, done )

%*****************************************************************************80
%
%% VEC_GRAY_NEXT computes the elements of a product space.
%
%  Discussion:
%
%    The elements are produced one at a time.
%
%    This routine handles the case where the number of degrees of freedom may
%    differ from one component to the next.
%
%    A method similar to the Gray code is used, so that successive
%    elements returned by this routine differ by only a single element.
%
%    The routine uses internal static memory.
%
%  Example:
%
%    N = 2, BASE = ( 2, 3 ), DONE = TRUE
%
%     A    DONE  CHANGE
%    ---  -----  ------
%    0 0  FALSE    1
%    0 1  FALSE    2
%    0 2  FALSE    2
%    1 2  FALSE    1
%    1 1  FALSE    2
%    1 0  FALSE    2
%    1 0   TRUE   -1  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer, 1986,
%    ISBN: 0387963472,
%    LC: QA164.S79.
%
%  Parameters:
%
%    Input, integer N, the number of components.
%
%    Input, integer BASE(N), contains the number of degrees of
%    freedom of each component.  The output values of A will
%    satisfy 0 <= A(I) < BASE(I).
%
%    Input, integer A(N).  On the first call, the input value
%    of A doesn't matter.  Thereafter, it should be the same as
%    its output value from the previous call.  
%
%    Input, logical DONE.  On the first call, the user must
%    set DONE to TRUE.  Thereafter, DONE should be set to the output
%    value of DONE on the previous call.
%
%    Output, integer A(N), the next element of the space.
%
%    Output, logical DONE.  If DONE is FALSE, the program has computed
%    another entry, which is contained in A.  If DONE is TRUE,
%    then there are no more entries.
%
%    Output, integer CHANGE, is set to the index of the element whose
%    value was changed.  On return from the first call, CHANGE
%    is 1, even though all the elements have been "changed".  On
%    return with DONE equal to TRUE, CHANGE is -1.
%
  persistent active;
  persistent dir;
%
%  The user is calling for the first time.
%
  if ( done )

    done = 0;
    a(1:n) = 0;

    dir(1:n) = 1;
    active(1:n) = 1;

    for i = 1 : n

      if ( base(i) < 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'VEC_GRAY_NEXT - Warning!\n' );
        fprintf ( 1, '  For index I = %d\n', i );
        fprintf ( 1, '  the nonpositive value of BASE(I) = %d\n',  base(i) );
        fprintf ( 1, '  which was reset to 1!\n' );
        base(i) = 1;
        active(i) = 0;
      elseif ( base(i) == 1 )
        active(i) = 0;
      end

    end

    change = 1;

    return

  end
%
%  Find the maximum active index.
%
  change = -1;

  for i = 1 : n
    if ( active(i) ~= 0 )
      change = i;
    end
  end
%
%  If there are NO active indices, we have generated all vectors.
%
  if ( change == -1 )
    done = 1;
    return
  end
%
%  Increment the element with maximum active index.
%
  a(change) = a(change) + dir(change);
%
%  If we attained a minimum or maximum value, reverse the direction
%  vector, and deactivate the index.
%
  if ( a(change) == 0 | a(change) == base(change) - 1 )
    dir(change) = -dir(change);
    active(change) = 0;
  end
%
%  Activate all subsequent indices.
%
  for i = change + 1 : n
    if ( 1 < base(i) ) 
      active(i) = 1;
    end
  end

  return
end
