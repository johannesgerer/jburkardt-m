function check = sudoku_check ( s )

%*****************************************************************************80
%
%% SUDOKU_CHECK checks a partial or filled-in Sudoku puzzle.
%
%  Discussion:
%
%    The routine ensures that
%    1) each entry of S is either 0 (unfilled) or between 1 and 9.
%    2) each row contains no more than one occurrence of a digit.
%    3) each column contains no more than one occurrent of a digit.
%    4) each box contains no more than one occurrence of a digit.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer S(9,9) contains the Sudoku puzzle.  Unfilled
%    entries should be set to 0.
%    .
%    Output, integer CHECK, is
%    0, if no errors were detected.
%        10*I+J, if A(I,J) contains an illegal digit,
%    100+10*I+J, if A(I,J) violates the row condition.
%    200+10*I+J, if A(I,J) violates the column condition.
%    300+10*I+J, if A(I,J) violates the box condition.
%

%
%  Digit check.
%
  i = 0;
  for i3 = 1 : 3
    for i2 = 1 : 3
      i = i + 1;
      j = 0;
      for j3 = 1 : 3
        for j2 = 1 : 3
          j = j + 1;
          if ( s(i,j) < 0 | 9 < s(i,j) )
            check = 10 * i + j;
            return
          end
        end
      end
    end
  end
%
%  Row check.
%
  i = 0;
  for i3 = 1 : 3
    for i2 = 1 : 3
      i = i + 1;
      digit(1:9) = 0;
      j = 0;
      for j3 = 1 : 3
        for j2 = 1 : 3
          j = j + 1;
          k = s(i,j);
          if ( 1 <= k & k <= 9 )
            digit(k) = digit(k) + 1;
            if ( 1 < digit(k) )
              check = 100 + 10 * i + j;
              return
            end
          end
        end
      end
    end
  end
%
% Column check.
%
  j = 0;
  for j3 = 1 : 3
    for j2 = 1 : 3
      j = j + 1;
      digit(1:9) = 0;
      i = 0;
      for i3 = 1 : 3
        for i2 = 1 : 3
          i = i + 1;
          k = s(i,j);
          if ( 1 <= k & k <= 9 )
            digit(k) = digit(k) + 1;
            if ( 1 < digit(k) )
              check = 200 + 10 * i + j;
              return
            end
          end
        end
      end
    end
  end
%
%  Box check
%
  for i3 = 1 : 3
    for j3 = 1 : 3
      digit(1:9) = 0;
      i = ( i3 - 1 ) * 3;
      for i2 = 1 : 3
        j = ( j3 - 1 ) * 3;
        i = i + 1;
        for j2 = 1 : 3
          j = j + 1;
          k = s(i,j);
          if ( 1 <= k & k <= 9 )
            digit(k) = digit(k) + 1;
            if ( 1 < digit(k) )
              check = 300 + 10 * i + j;
              return
            end
          end
        end
      end
    end
  end
%
%  No errors discovered.
%
  check = 0;

  return
end
