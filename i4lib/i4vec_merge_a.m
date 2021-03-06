function [ nc, c ] = i4vec_merge_a ( na, a, nb, b )

%*****************************************************************************80
%
%% I4VEC_MERGE_A merges two ascending sorted I4VEC's.
%
%  Discussion:
%
%    The elements of A and B should be sorted in ascending order.
%
%    The elements in the output array C will also be in ascending order,
%    and unique.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NA, the dimension of A.
%
%    Input, integer A(NA), the first sorted array.
%
%    Input, integer NB, the dimension of B.
%
%    Input, integer B(NB), the second sorted array.
%
%    Output, integer NC, the size of C.
%
%    Output, integer C(NC), the merged unique sorted array.
%
  na2 = na;
  nb2 = nb;

  ja = 0;
  jb = 0;
  nc = 0;

  order = i4vec_order_type ( na2, a );

  if ( order < 0 || 2 < order )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_MERGE_A - Fatal error!\n' );
    fprintf ( 1, '  The input array A is not ascending sorted!\n' );
    error ( 'I4VEC_MERGE_A - Fatal error!' );
  end

  order = i4vec_order_type ( nb2, b );

  if ( order < 0 || 2 < order )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_MERGE_A - Fatal error!\n' );
    fprintf ( 1, '  The input array B is not ascending sorted!\n' );
    error ( 'I4VEC_MERGE_A - Fatal error!' );
  end

  while ( 1 )
%
%  If we've used up all the entries of A, stick the rest of B on the end.
%
    if ( na2 <= ja )

      for j = 1 : nb2 - jb
        jb = jb + 1;
        if ( nc == 0 )
          nc = nc + 1;
          d(nc) = b(jb);
        elseif ( d(nc) < b(jb) )
          nc = nc + 1;
          d(nc) = b(jb);
        end
      end

      c(1:nc) = d(1:nc);

      break
%
%  If we've used up all the entries of B, stick the rest of A on the end.
%
    elseif ( nb2 <= jb )

      for j = 1 : na2 - ja
        ja = ja + 1;
        if ( nc == 0 )
          nc = nc + 1;
          d(nc) = a(ja);
        elseif ( d(nc) < a(ja) )
          nc = nc + 1;
          d(nc) = a(ja);
        end
      end

      c(1:nc) = d(1:nc);

      break
%
%  Otherwise, if the next entry of A is smaller, that's our candidate.
%
    elseif ( a(ja+1) <= b(jb+1) )

      ja = ja + 1;
      if ( nc == 0 )
        nc = nc + 1;
        d(nc) = a(ja);
      elseif ( d(nc) < a(ja) )
        nc = nc + 1;
        d(nc) = a(ja);
      end
%
%  ...or if the next entry of B is the smaller, consider that.
%
    else

      jb = jb + 1;
      if ( nc == 0 )
        nc = nc + 1;
        d(nc) = b(jb);
      elseif ( d(nc) < b(jb) )
        nc = nc + 1;
        d(nc) = b(jb);
      end
    end

  end

  return
end
