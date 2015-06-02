function [ pd1, pd2, wpd, npd ] = pdpts ( deg )

%*****************************************************************************80
%
%% PDPTS returns the points and weights for Padua interpolation.
%
%  Discussion:
%
%    This function computes the first family of Padua points and
%    weights corresponding to degree DEG.
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
%    Input, integer DEG, the degree of approximation.
%
%    Output, real PD1(NPD), PD2(NPD), the first and second
%    coordinates of the Padua points
%
%    Output, real WPD(NPD), the weights.
%
%    Output, integer NPD, the number of Padua points.
%    NPD = ( DEG + 1 ) * ( DEG + 2 ) / 2.
%
  if ( deg < 0 )
    pd1 = [];
    pd2 = [];
    wpd = [];
    npd = 0;
    return
  end

  if ( deg == 0 )
    pd1(1) = -1.0;
    pd2(1) = -1.0;
    wpd(1) = 2.0;
    npd = 1;
    return
  end

  npd = 0;

  for j = 0 : deg + 1
    for k = mod ( j, 2 ) : 2 : deg
      npd = npd + 1;
    end
  end

  pd1 = zeros ( npd, 1 );
  pd2 = zeros ( npd, 1 );
  wpd = zeros ( npd, 1 );
%
%  Compute the Padua points of the first family at degree DEG.
%
  npd = 0;
  itemp0 = deg * ( deg + 1 );
  rtemp0 = pi / itemp0;

  for j = 0 : deg + 1
    for k = mod ( j, 2 ) : 2 : deg

      npd = npd + 1;
      pd1(npd) = - cos ( ( deg + 1 ) * k * rtemp0 );
      pd2(npd) = - cos ( deg * j * rtemp0 );
      wpd(npd) = 2.0 / itemp0;

      if ( k == 0 || k == deg )
        wpd(npd) = wpd(npd) / 2.0;
      end

      if ( j == 0 || j == deg + 1 )
        wpd(npd) = wpd(npd) / 2.0;
      end

    end
  end

  return
end
