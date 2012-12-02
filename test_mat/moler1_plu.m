function [ p, l, u ] = moler1_plu ( alpha, n )

%*****************************************************************************80
%
%% MOLER1_PLU returns the PLU factors of the MOLER1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Nash,
%    Compact Numerical Methods for Computers: Linear Algebra and
%    Function Minimisation,
%    Second Edition,
%    Taylor & Francis, 1990,
%    ISBN: 085274319X,
%    LC: QA184.N37.
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real P(N,N), L(N,N), U(N,N), the PLU factors.
%
  for j = 1 : n
    for i = 1 : n
      if ( i == j )
        p(i,j) = 1.0;
      else
        p(i,j) = 0.0;
      end
    end
  end

  for j = 1 : n
    for i = 1 : n
      if ( i == j )
        l(i,j) = 1.0;
      elseif ( j < i )
        l(i,j) = alpha;
      else
        l(i,j) = 0.0;
      end
    end
  end

  for j = 1 : n
    for i = 1 : n
      if ( i == j )
        u(i,j) = 1.0;
      elseif ( i < j )
        u(i,j) = alpha;
      else
        u(i,j) = 0.0;
      end
    end
  end

  return
end
