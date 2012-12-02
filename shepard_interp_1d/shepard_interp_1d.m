function yi = shepard_interp_1d ( nd, xd, yd, p, ni, xi )

%*****************************************************************************80
%
%% SHEPARD_INTERP_1D evaluates a 1D Shepard interpolant.
%
%  Discussion:
%
%    It's possible to write this calculation in a vectorized format.
%    However, the calculation is slightly complicated by the fact that some
%    care must be taken when an interpolation point exactly equals a data point,
%    in which case division by zero will occur.  The FIND command can help
%    here, but FIND returns vector or array indices, and you sort of need
%    both in order to deal with entries and columns of the array.  The 
%    requirements for getting and using this information correctly are
%    beyond my patience to deal with at this point.
%
%    After almost getting it right several times, I gave up and tossed the
%    vectorized code out.  Correct, readable, slow code is better than
%    efficient, unreadable, and delicate code.  Once I have to solve huge
%    problems with this code, I will come back and think about the error
%    of my ways once again.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Shepard,
%    A two-dimensional interpolation function for irregularly spaced data,
%    ACM '68: Proceedings of the 1968 23rd ACM National Conference,
%    ACM, pages 517-524, 1969.
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(ND,1), the data points.
%
%    Input, real YD(ND,1), the data values.
%
%    Input, real P, the power.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points.
%
%    Output, real YI(NI,1), the interpolated values.
% 
  yi = zeros ( ni, 1 );

  for i = 1 : ni

    if ( p == 0.0 )

      w(1:nd,1) = 1.0 / nd;

    else

      w = zeros ( nd, 1 );

      z = -1;
      for j = 1 : nd
        w(j) = abs ( xi(i) - xd(j) );
        if ( w(j) == 0.0 )
          z = j;
          break
        end
      end

      if ( z ~= -1 )
        w = zeros ( nd, 1 );
        w(z) = 1.0;
      else
        w(1:nd,1) = 1.0 ./ w(1:nd,1) .^ p;
        s = sum ( w );
        w(1:nd,1) = w(1:nd,1) / s;
      end

    end

    yi(i) = w' * yd;

  end

  return
end
