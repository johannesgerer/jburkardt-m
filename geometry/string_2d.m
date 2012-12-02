function [ p1, p2, string_num, order, string ] = string_2d ( nvec, p1, p2 )

%*****************************************************************************80
%
%% STRING_2D groups line segments into connected lines in 2D.
%
%  Discussion:
%
%    The routine receives an unordered set of line segments, described by
%    pairs of coordinates (X1,Y1) and (X2,Y2), and tries to group them
%    into ordered lists that constitute connected jagged lines.
%
%    This routine will not match two endpoints unless they are exactly equal.
%
%    On input, line segment I has endpoints ( X1VEC(I), Y1VEC(I) )
%    and ( X2VEC(I), Y2VEC(I) ).
%
%    On output, the order of the components may have been
%    switched.  That is, for some I, ( X1VEC(I), Y1VEC(I) ) and
%    ( X2VEC(I), Y2VEC(I) ) may have been swapped.
%
%    More importantly, all the entries X1VEC(I), Y1VEC(I),
%    Y1VEC(I) and Y2VEC(I) may have been swapped with another index J.
%
%    The resulting coordinates will have been sorted in order
%    of the string to which they belong, and then by the order
%    of their traversal within that string.
%
%    The array STRING(I) identifies the string to which segment I belongs.
%
%    If two segments I and J have the same value of STRING, then
%    ORDER(I) and ORDER(J) give the relative order of the two segments 
%    in the string.  Thus if ORDER(I) = -3 and ORDER(J) = 2, then when 
%    the string is traversed, segment I is traversed first, then four other
%    segments are traversed, and then segment J is traversed.
%
%    For each string, the segment with ORDER(I) = 0 is the initial segment 
%    from which the entire string was "grown" (with growth possible to both the
%    left and the right).
%
%    Thanks to Martijn Engelsman, on 05 July 2005, for pointing out a 
%    misspelled variable name,
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NVEC, the number of line segments to be analyzed.
%
%    Input, real P1(2,NVEC), P2VEC(2,NVEC), the line segments.
%
%    Output, real P1(2,NVEC), P2VEC(2,NVEC), the line segments,
%    which are now sorted.
%
%    Output, integer STRING_NUM, the number of strings created.
%
%    Output, integer ORDER(NVEC), the order vector.
%
%    Output, integer STRING(NVEC), the string to which each segment I belongs.
%
  dim_num = 2;
%
%  Mark STRING so that each segment is alone.
%
  order(1:nvec) = 0;
  for i = 1 : nvec
    string(1:nvec) = nvec + i;
  end
%
%  Starting with the lowest numbered group of line segments,
%  see if any higher numbered groups belong.
%
  seed = 1;
  string_num = 1;
  string(seed) = string_num;

  while ( 1 )

    x1val = p1(1,seed);
    y1val = p1(2,seed);

    x2val = p2(1,seed);
    y2val = p2(2,seed);

    jval = order(seed);
    kval = order(seed);

    while ( 1 )

      match = 0;

      for j = 1 : nvec

        if ( string_num < string(j) )

          if ( x1val == p1(1,j) & y1val == p1(2,j) )

            jval = jval - 1;
            order(j) = jval;
            string(j) = string_num;
            x1val = p2(1,j);
            y1val = p2(2,j);
            match = match + 1;

            temp = p1(1,j);
            p1(1,j) = p2(1,j);
            p2(1,j) = temp;

            temp = p1(2,j);
            p1(2,j) = p2(2,j);
            p2(2,j) = temp;

          elseif ( x1val == p2(1,j) & y1val == p2(2,j) )

            jval = jval - 1;
            order(j) = jval;
            string(j) = string_num;
            x1val = p1(1,j);
            y1val = p1(2,j);
            match = match + 1;

          elseif ( x2val == p1(1,j) & y2val == p1(2,j) )

            kval = kval + 1;
            order(j) = kval;
            string(j) = string_num;
            x2val = p2(1,j);
            y2val = p2(2,j);
            match = match + 1;

          elseif ( x2val == p2(1,j) & y2val == p2(2,j) )

            kval = kval + 1;
            order(j) = kval;
            string(j) = string_num;
            x2val = p1(1,j);
            y2val = p1(2,j);
            match = match + 1;

            temp = p1(1,j);
            p1(1,j) = p2(1,j);
            p2(1,j) = temp;

            temp = p1(2,j);
            p1(2,j) = p2(2,j);
            p2(2,j) = temp;

          end

        end

      end
%
%  If the string has closed on itself, then we don't want to
%  look for any more matches for this string.
%
      if ( x1val == x2val & y1val == y2val )
        break
      end
%
%  If we made no matches this pass, we're done.
%
      if ( match <= 0 )
        break
      end

    end
%
%  This string is "exhausted".  Are there any line segments we
%  haven't looked at yet?
%
    seed = 0;

    for i = 1 : nvec
      if ( string_num < string(i) )
        seed = i;
        string_num = string_num + 1;
        string(i) = string_num;
        break;
      end
    end

    if ( seed == 0 )
      break
    end

  end
%
%  There are no more line segments to look at.  Renumber the
%  isolated segments.
%
%  Question: Can this ever happen?
%
  for i = 1 : nvec
    if ( nvec < string(i) )
      string_num = string_num + 1;
      string(i) = string_num;
    end
  end
%
%  Now sort the line segments by string and by order of traversal.
%
  i = 0;
  isgn = 0;
  j = 0;

  indx = 0;

  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( nvec, indx, isgn );

    if ( 0 < indx )

      temp = order(i);
      order(i) = order(j);
      order(j) = temp;

      temp = string(i);
      string(i) = string(j);
      string(j) = temp;

      temp(1:2) = p1(1:2,i);
      p1(1:2,i) = p1(1:2,j);
      p1(1:2,j) = temp(1:2)';

      temp(1:2) = p2(1:2,i);
      p2(1:2,i) = p2(1:2,j);
      p2(1:2,j) = temp(1:2)';

    elseif ( indx < 0 )

      if ( ( string(i) < string(j) ) | ...
           ( string(i) == string(j) & order(i) < order(j) ) )

        isgn = -1;

      else

        isgn = +1;

      end

    elseif ( indx == 0 )

      break

    end

  end

  return
end
