function b = r8vec_bracket6 ( nd, xd, ni, xi )

%*****************************************************************************80
%
%% R8VEC_BRACKET6 brackets data between successive entries of a sorted R8VEC.
%
%  Discussion:
%
%    We assume XD is sorted.
%
%    If XI(I) is contained in the interval [XD(1),XD(N)], then the value of
%    B(I) indicates that XI(I) is contained in [ XD(B(I)), XD(B(I)+1) ].
%
%    If XI(I) is not contained in the interval [XD(1),XD(N)], then B(I) = -1.
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
%    Input, real XD(N,1), the sorted data.
%
%    Input, integer NI, the number of inquiry values.
%
%    Input, real XI(NI,1), the query values.
%
%    Output, integer B(NI,1), the bracket information.
%
  xd = xd(:);
  xi = xi(:);
  b = zeros ( ni, 1 );

  for i = 1 : ni

    if ( xi(i) < xd(1) || xd(nd) < xi(i) )

      b(i) = -1;

    else

      l = 1;
      r = nd;

      while ( l + 1 < r )
        m = floor ( ( l + r ) / 2 );
        if ( xi(i) < xd(m) )
          r = m;
        else
          l = m;
        end
      end

      b(i) = l;

    end

  end

  return
end
