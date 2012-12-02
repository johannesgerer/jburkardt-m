function zi = shepard_interp_nd ( m, nd, xd, zd, p, ni, xi )

%*****************************************************************************80
%
%% SHEPARD_INTERP_ND evaluates a Shepard interpolant in M dimensions.
%
%  Discussion:
%
%    This code should be vectorized.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2012
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(M,ND), the data points.
%
%    Input, real ZD(ND,1), the data values.
%
%    Input, real P, the power.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(M,NI), the interpolation points.
%
%    Output, real ZI(NI,1), the interpolated values.
% 
  zi = zeros ( ni, 1 );

  for i = 1 : ni

    if ( p == 0.0 )

      w = ones ( nd, 1 ) / nd;

    else

      w = zeros ( nd, 1 );

      z = -1;
      for j = 1 : nd
        w(j) = norm ( xi(1:m,i) - xd(1:m,j) );
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

    zi(i) = w' * zd;

  end

  return
end
