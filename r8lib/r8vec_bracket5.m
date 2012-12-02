function b = r8vec_bracket5 ( nd, xd, xi )

%*****************************************************************************80
%
%% R8VEC_BRACKET5 brackets data between successive entries of a sorted R8VEC.
%
%  Discussion:
%
%    We assume XD is sorted.
%
%    If XI is contained in the interval [XD(1),XD(N)], then the returned 
%    value B indicates that XI is contained in [ XD(B), XD(B+1) ].
%
%    If XI is not contained in the interval [XD(1),XD(N)], then B = -1.
%
%    This code implements a version of binary search which is perhaps more
%    understandable than the usual ones.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data values.
%
%    Input, real XD(N), the sorted data.
%
%    Input, real XD, the query value.
%
%    Output, integer B, the bracket information.
%
  if ( xi < xd(1) || xd(nd) < xi )

    b = -1;

  else

    l = 1;
    r = nd;

    while ( l + 1 < r )
      m = floor ( ( l + r ) / 2 );
      if ( xi < xd(m) )
        r = m;
      else
        l = m;
      end
    end

    b = l;

  end

  return
end
