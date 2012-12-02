function a = mexp_a ( test, n )

%*****************************************************************************80
%
%% MEXP_A returns the matrix for a given test.
%
%  Discussion:
%
%     1) Diagonal example
%     2) Symmetric example
%     3) Laub
%     4) Moler and Van Loan
%     5) Moler and Van Loan
%     6) Moler and Van Loan
%     7) Moler and Van Loan
%     8) Wikipedia example
%     9) NAG F01ECF
%    10) Ward #1
%    11) Ward #2
%    12) Ward #3
%    13) Ward #4
%    14) Moler example
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Laub,
%    Review of "Linear System Theory" by Joao Hespanha,
%    SIAM Review,
%    Volume 52, Number 4, December 2010, page 779-781.
%
%    Cleve Moler, Charles VanLoan,
%    Nineteen Dubious Ways to Compute the Exponential of a Matrix,
%    Twenty-Five Years Later,
%    SIAM Review,
%    Volume 45, Number 1, March 2003, pages 3-49.
%
%    Cleve Moler,
%    Cleve's Corner: A Balancing Act for the Matrix Exponential,
%    July 23rd, 2012.
%
%    Robert Ward,
%    Numerical computation of the matrix exponential with accuracy estimate,
%    SIAM Journal on Numerical Analysis,
%    Volume 14, Number 4, September 1977, pages 600-610.
%
%  Parameters:
%
%    Input, integer TEST, the index of the test case.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  if ( test == 1 )
    a = [ 1,  0;
          0,  2 ];
  elseif ( test == 2 )
    a = [  1,  3;
           3,  2 ];
  elseif ( test == 3 )
    a = [  0,    1;
         -39,  -40 ];
  elseif ( test == 4 )
    a = [ -49, 24;
          -64, 31 ];
  elseif ( test == 5 )
    a = [ 0, 6, 0, 0; ...
          0, 0, 6, 0; ...
          0, 0, 0, 6; ...
          0, 0, 0, 0 ];
  elseif ( test == 6 )
    a = [ 1, 1; ...
          0, 1 ];
  elseif ( test == 7 )
    a = [ 1 + eps, 1; ...
          0, 1 - eps ];
  elseif ( test == 8 )
    a = [ 21, 17,  6; ...
          -5, -1, -6; ...
           4,  4, 16 ];
  elseif ( test == 9 )
    a = [ 1, 2, 2, 2; ...
          3, 1, 1, 2; ...
          3, 2, 1, 2; ...
          3, 3, 3, 1 ];
  elseif ( test == 10 )
    a = [ 4, 2, 0; ...
          1, 4, 1; ...
          1, 1, 4 ];
  elseif ( test == 11 )
    a = [ 29.87942128909879,    0.7815750847907159, -2.289519314033932; ...
           0.7815750847907159, 25.72656945571064,    8.680737820540137; ...
          -2.289519314033932,   8.680737820540137,  34.39400925519054 ];
  elseif ( test == 12 )
    a = [ -131, 19, 18; ...
          -390, 56, 54; ...
          -387, 57, 52 ];
  elseif ( test == 13 )
    a = zeros ( n, n );
    for i = 1 : n - 1
      a(i,i+1) = 1.0;
    end
    a(n,1) = 1.0E-10;
  elseif ( test == 14 )
    a(1,1) = 0.0;
    a(1,2) = 1.0E-08;
    a(1,3) = 0.0;
    a(2,1) = - 2.0E+10 - 2.0E+08 / 3.0;
    a(2,2) = - 3.0;
    a(2,3) = 2.0E+10;
    a(3,1) = 200.0 / 3.0;
    a(3,2) = 0.0;
    a(3,3) = - 200.0 / 3.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MEXP_A - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'MEXP_A - Fatal error!' );
  end

  return
end
