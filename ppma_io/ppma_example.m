function [ r, g, b ] = ppma_example ( nrow, ncol )

%*****************************************************************************80
%
%% PPMA_EXAMPLE sets up sample RGB data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   06 August 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NROW, NCOL, the size of the arrays to create.
%
%    Output, integer R(NROW,NCOL), G(NROW,NCOL), B(NROW,NCOL), the R, G, B data.
%
  r = zeros ( nrow, ncol );
  g = zeros ( nrow, ncol );
  b = zeros ( nrow, ncol );

  for i = 1 : nrow
    y = ( nrow - i ) / ( nrow - 1 );
    for j = 1 : ncol
      x = ( j - 1 ) / ( ncol - 1 );
      f1 = 4.0 * ( x - 0.5 )^2;
      f2 = sin ( pi * x );
      f3 = x;

      if ( y <= f1 )
        r(i,j) = fix ( 255.0 * f1 );
      else
        r(i,j) = 50;
      end

      if ( y <= f2 )
        g(i,j) = fix ( 255 * f2 );
      else
        g(i,j) = 150;
      end

      if ( y <= f3 )
        b(i,j) = fix ( 255 * f3 );
      else
        b(i,j) = 250;
      end

    end 
  end

  return
end
