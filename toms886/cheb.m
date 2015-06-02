function tcheb = cheb ( deg, pt )

%*****************************************************************************80
%
%% CHEB computes normalized Chebyshev polynomials.
%
%  Discussion:
%
%    This subroutine computes the array TCHEB of normalized Chebyshev
%    polynomials from degree 0 to DEG:
%      T_0(x)=1,
%      T_j(x) = sqrt(2) * cos ( j * acos(x) )
%    at the point x = PT.
%
%    Although we prefer to index this information starting at 0, MATLAB
%    arrays must start with index 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Input, integer  DEG, the degree.
%    0 <= DEG.
%
%    Input, real PT, the evaluation point.
%
%    Output, real TCHEB(1:DEG+1,1), the value of the normalized
%    Chebyshev polynomials of degrees 0 through DEG at the point PT.
%
  BASE = 1;

  if ( deg < 0 )
    tcheb = [];
    return
  end

  tcheb = zeros ( deg + 1, 1 );

  tcheb(0+BASE) = 1.0;

  if ( deg < 1 )
    return
  end

  tcheb(1+BASE) = sqrt ( 2.0 ) * pt;

  if ( deg < 2 )
    return
  end

  tcheb(2+BASE) = 2.0 * pt * tcheb(1+BASE) - sqrt ( 2.0 ) * tcheb(0+BASE);
%
%  Chebyshev recurrence.
%
  for j = 3 : deg
    tcheb(j+BASE) = 2.0 * pt * tcheb(j-1+BASE) - tcheb(j-2+BASE);
  end

  return
end
