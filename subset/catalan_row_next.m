function row_new = catalan_row_next ( ido, n, row_old )

%*****************************************************************************80
%
%% CATALAN_ROW_NEXT computes row N of Catalan's triangle.
%
%  Example:
%
%    I\J 0   1   2   3   4   5   6
%
%    0   1
%    1   1   1
%    2   1   2   2
%    3   1   3   5   5
%    4   1   4   9  14  14
%    5   1   5  14  28  42  42
%    6   1   6  20  48  90 132 132
%
%  Recursion:
%
%    C(0,0) = 1
%    C(I,0) = 1
%    C(I,J) = 0 for I < J
%    C(I,J) = C(I,J-1) + C(I-1,J)
%    C(I,I) is the I-th Catalan number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IDO, indicates whether this is a call for
%    the 'next' row of the triangle.
%    IDO = 0, this is a startup call.  Row N is desired, but
%    presumably this is a first call, or row N-1 was not computed
%    on the previous call.
%    IDO = 1, this is not the first call, and row N-1 was computed
%    on the previous call.  In this case, much work can be saved
%    by using the information from the previous values of IROW
%    to build the next values.
%
%    Input, integer N, the index of the row of the triangle desired.  
%
%    Input, integer ROW_OLD(1:N), the row of coefficients.
%    If IDO = 0, then ROW_OLD is not required to be set on input.
%    If IDO = 1, then ROW_OLD must be set on input to the value of
%    row N-1.
%
%    Output, integer ROW_NEW(1:N+1), the next row of coefficients.
%
  if ( n < 0 )
    row_new = [];
    return
  end

  if ( ido == 0 )
 
    row_new(1) = 1;
    row_new(2:n+1) = 0;
 
    for i = 1 : n

      row_new(1) = 1;

      for j = 1 : i-1
        row_new(j+1) = row_new(j+1) + row_new(j);
      end

      row_new(i+1) = row_new(i);

    end
 
  else
 
    row_new(1:n) = row_old(1:n);
    row_new(n+1) = 0;

    row_new(1) = 1;

    for j = 1 : n-1
      row_new(j+1) = row_new(j+1) + row_new(j);
    end

    if ( 1 <= n )
      row_new(n+1) = row_new(n);
    end
 
  end

  return
end
