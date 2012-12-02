function mexp_story ( test )

%*****************************************************************************80
%
%% MEXP_STORY prints explanatory text for each problem.
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
  if ( test == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This matrix is diagonal.\n' );
    fprintf ( 1, '  The calculation of the matrix exponential is simple.\n' );
  elseif ( test == 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This matrix is symmetric.\n' );
    fprintf ( 1, '  The calculation of the matrix exponential is straightforward.\n' );
  elseif ( test == 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This example is due to Laub.\n' );
    fprintf ( 1, '  This matrix is ill-suited for the Taylor series approach.\n' );
    fprintf ( 1, '  As powers of A are computed, the entries blow up too quickly.\n' );
  elseif ( test == 4 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This example is due to Moler and Van Loan.\n' );
    fprintf ( 1, '  The example will cause problems for the series summation approach,\n' );
    fprintf ( 1, '  as well as for diagonal Pade approximations.\n' );
  elseif ( test == 5 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This example is due to Moler and Van Loan.\n' );
    fprintf ( 1, '  This matrix is strictly upper triangular\n' );
    fprintf ( 1, '  All powers of A are zero beyond some (low) limit.\n' ); 
    fprintf ( 1, '  This example will cause problems for Pade approximations.\n' );
  elseif ( test == 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This example is due to Moler and Van Loan.\n' );
    fprintf ( 1, '  This matrix does not have a complete set of eigenvectors.\n' );
    fprintf ( 1, '  That means the eigenvector approach will fail.\n' );
  elseif ( test == 7 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This example is due to Moler and Van Loan.\n' );
    fprintf ( 1, '  This matrix is very close to example 5.\n' );
    fprintf ( 1, '  Mathematically, it has a complete set of eigenvectors.\n' );
    fprintf ( 1, '  Numerically, however, the calculation will be suspect.\n' );
  elseif ( test == 8 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This matrix was an example in Wikipedia.\n' );
  elseif ( test == 9 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This example is due to the NAG Library.\n' );
    fprintf ( 1, '  It is an example for function F01ECF.\n' );
  elseif ( test == 10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This is Ward''s example #1.\n' );
    fprintf ( 1, '  It is defective and nonderogatory.\n' );
    fprintf ( 1, '  The eigenvalues are 3, 3 and 6.\n' );
  elseif ( test == 11 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This is Ward''s example #2.\n' );
    fprintf ( 1, '  It is a symmetric matrix.\n' );
    fprintf ( 1, '  The eigenvalues are 20, 30, 40.\n' );
  elseif ( test == 12 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This is Ward''s example #3.\n' );
    fprintf ( 1, '  Ward''s algorithm has difficulty estimating the accuracy\n' );
    fprintf ( 1, '  of its results.  The eigenvalues are -1, -2, -20.\n' );
  elseif ( test == 13 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This is Ward''s example #4.\n' );
    fprintf ( 1, '  This is a version of the Forsythe matrix.\n' );
    fprintf ( 1, '  The eigenvector problem is badly conditioned.\n' );
    fprintf ( 1, '  Ward''s algorithm has difficulty estimating the accuracy\n' );
    fprintf ( 1, '  of its results for this problem.\n' );
  elseif ( test == 14 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  This is Moler''s example.\n' );
    fprintf ( 1, '  This badly scaled matrix caused problems for MATLAB''s expm().\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MEXP_STORY - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of TEST = %d\n', test );
    error ( 'MEXP_STORY - Fatal error!' );
  end

  return
end
