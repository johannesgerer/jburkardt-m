function isgn = i4vec2_compare ( n, a1, a2, i, j )

%*****************************************************************************80
%
%% I4VEC2_COMPARE compares two I4VEC2's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data items.
%
%    Input, integer A1(N), A2(N), contain the two components of each item.
%
%    Input, integer I, J, the items to be compared.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, item I < item J,
%     0, item I = item J,
%    +1, item J < item I.
%
  isgn = 0;

       if ( a1(i) < a1(j) )

    isgn = -1;

  elseif ( a1(i) == a1(j) )

         if ( a2(i) < a2(j) )
      isgn = -1;
    elseif ( a2(i) < a2(j) )
      isgn = 0;
    elseif ( a2(j) < a2(i) )
      isgn = +1;
    end

  elseif ( a1(j) < a1(i) )

    isgn = +1;

  end

  return
end
