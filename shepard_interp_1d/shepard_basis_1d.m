function bk = shepard_basis_1d ( nd, xd, k, p, ni, xi )

%*****************************************************************************80
%
%% SHEPARD_BASIS_1D evaluates a 1D Shepard basis function.
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
%    Input, integer K, the index of the desired basis function,
%    1 <= K <= ND.
%
%    Input, real P, the power.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points.
%
%    Output, real BK(NI,1), the basis function at the interpolation points.
% 
  bk = zeros ( ni, 1 );

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

    bk(i,1) = w(k,1);

  end

  return
end
