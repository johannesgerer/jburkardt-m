function expa = mexp_expa ( test, n )

%*****************************************************************************80
%
%% MEXP_EXPA returns the "exact" exponential matrix for a given test.
%
%  Discussion:
%
%    In some cases, the "exact" value is given to six significant digits.
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
%    Thanks to Alex Griffing for correcting the value of matrix 3,
%    17 October 2012.
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
%    Output, real EXPA(N,N), the exponential of the test matrix.
%
  expa = [];

  if ( test == 1 )
    expa = [ ...
      2.718281828459046, 0; ...
      0,                 7.389056098930650 ];
  elseif ( test == 2 )
    expa = [ ...
      39.322809708033859,  46.166301438885753; ...
      46.166301438885768,  54.711576854329110 ];
  elseif ( test == 3 )
    expa = [ ...
       0.37756048,  0.00968104; ...
      -0.37756048, -0.00968104 ];
  elseif ( test == 4 )
    expa = [ ...
      -0.735759, 0.551819; ...
      -1.471518, 1.103638 ];
  elseif ( test == 5 )
    expa = [ ...
      1,  6, 18, 36; ...
      0,  1,  6, 18; ...
      0,  0,  1,  6; ...
      0,  0,  0,  1 ];
  elseif ( test == 6 )
    expa = [ ...
      2.718281828459046, 2.718281828459046; ...
      0,                 2.718281828459046 ];
  elseif ( test == 7 )
    expa = [ ...
      2.718309, 2.718282; ...
      0,        2.718255 ];
  elseif ( test == 8 )
    exp16 = exp ( 16.0 );
    exp4 = exp ( 4.0 );
    expa = 0.25 * [ ...
      13.0 * exp16 - exp4, 13.0 * exp16 - 5.0 * exp4,  2.0 * exp16 - 2.0 * exp4; ...
      -9.0 * exp16 + exp4, -9.0 * exp16 + 5.0 * exp4, -2.0 * exp16 + 2.0 * exp4; ...
      16.0 * exp16,        16.0 * exp16,               4.0 * exp16 ];
  elseif ( test == 9 )
    expa = [ ...
      740.7038, 610.8500, 542.2743, 549.1753; ...
      731.2510, 603.5524, 535.0884, 542.2743; ...
      823.7630, 679.4257, 603.5524, 610.8500; ...
      998.4355, 823.7630, 731.2510, 740.7038 ];
  elseif ( test == 10 )
    expa = [ ...
      147.8666224463699, 183.7651386463682,  71.79703239999647; ...
      127.7810855231823, 183.7651386463682,  91.88256932318415; ...
      127.7810855231824, 163.6796017231806, 111.9681062463718 ];
  elseif ( test == 11 )
    expa = [ 5.496313853692378E+15, -1.823188097200898E+16, -3.047577080858001E+16; ...
            -1.823188097200899E+16,  6.060522870222108E+16,  1.012918429302482E+17; ...
            -3.047577080858001E+16,  1.012918429302482E+17,  1.692944112408493E+17 ];
  elseif ( test == 12 )
    expa = [ -1.509644158793135, 0.3678794391096522, 0.1353352811751005; ...
             -5.632570799891469, 1.471517758499875,  0.4060058435250609; ...
             -4.934938326088363, 1.103638317328798,  0.5413411267617766 ];
  elseif ( test == 13 )
    expa = zeros ( n, n );
  elseif ( test == 14 )
    expa = [ 4.468494682831735D-01,  1.540441573839520D-09,  4.628114535587735D-01; ...
            -5.743067779479621D+06, -1.528300386868247D-02, -4.526542712784168D+06; ...
             4.477229778494929D-01,  1.542704845195912D-09,  4.634806488376499D-01 ];
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MEXP_EXPA - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'MEXP_EXPA - Fatal error!' );
  end

  return
end
