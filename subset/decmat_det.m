function [ dtop, dbot ] = decmat_det ( n, atop, abot, dec_digit )

%*****************************************************************************80
%
%% DECMAT_DET finds the determinant of an N by N matrix of decimal entries.
%
%  Discussion:
%
%    The brute force method is used.  The routine should only be used for
%    small matrices, since this calculation requires the summation of N!
%    products of N numbers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Input, integer ATOP(N,N), ABOT(N,N), the decimal
%    representation of the matrix.
%
%    Input, integer DEC_DIGIT, the number of decimal digits.
%
%    Output, integer DTOP, DBOT, the decimal determinant of the matrix.
%
  dtop = 0;
  dbot = 1;
  p = [];
  even = [];
  more = 0;
%
%  Compute the next permutation.
%
  while ( 1 )

    [ p, more, even ] = perm_next ( n, p, more, even );
%
%  The sign of this term depends on the sign of the permutation.
%
    if ( even )
      top = 1;
    else
      top = -1;
    end
%
% Choose one item from each row, as specified by the permutation,
% and multiply them
%
    bot = 0;

    for i = 1 : n

      top2 = atop(i,p(i));
      bot2 = abot(i,p(i));

      [ top, bot ] = dec_mul ( top, bot, top2, bot2, dec_digit );

    end
%
%  Add this term to the total.
%
    [ dtop, dbot ] = dec_add ( top, bot, dtop, dbot, dec_digit );

    if ( ~more )
      break
    end

  end

  return
end
