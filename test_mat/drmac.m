function a = drmac ( scale, permute )

%*****************************************************************************80
%
%% DRMAC returns the DRMAC matrix.
%
%  Discussion:
%
%    This matrix was discussed in a seminar given by Zlatko Drmac.
%
%    The matrix is available in a "badly scaled" or "well scaled" version.
%
%    It is also interesting to consider the 6 symmetric permutations of
%    the matrix.
%
%  Formula (Badly Scaled):
%
%    10^40  10^29  10^19
%    10^29  10^20  10^9
%    10^19  10^9   10^0
%
%  Properties of the "Badly Scaled Matrix":
%
%    A is nonsingular.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is positive definite.
%
%    A is very badly scaled.  MATLAB's "eigs" function, for computing
%    eigenvalues, will return two negative eigenvalues for A, despite
%    the fact that A is positive definite symmetric.
%
%    Pre- and post-multiplying A by the scaling matrix
%    with diagonal [ 10^(-20), 10^(-10), 1 ] results in a well-scaled
%    matrix.
%
%  Formula (Well Scaled):
%
%    1.0  0.1  0.1
%    0.1  1.0  0.1
%    0.1  0.1  1.0
%
%  Properties of the Well Scaled Matrix:
%
%    A is still nonsingular, symmetric, normal, diagonalizable, and 
%    positive definite,
%
%    The well-scaled matrix is a particular example of the combinatorial matrix,
%    with ALPHA = 0.9 and BETA = 0.1.  Therefore,
%    there is one eigenvalue with multiplicity 2 and value ALPHA,
%    and one eigenvalue with multiplicity 1 and value BETA + N * ALPHA.
%    (That is, LAMBDA(1) = LAMBDA(2) = 0.9, and LAMBDA(3) = 1.2).
%
%    The eigenvector corresponding to 1.2 is (1, 1, 1).
%    The eigenvectors corresponding to 0.9 are somewhat arbitrary.
%    Two orthonormal eigenvectors are ( 0.8159, -0.2802, -0.4357 )
%    and ( -0.0320, 0.7226, -0.6905 ) but any linear combination
%    of these two vectors will also be an eigenvector for 0.9.
%
%    The determinant is ALPHA^(N-1) * ( BETA + N * ALPHA ) 
%    = 0.9*0.9*1.2 = 0.9720
%
%    The inverse has diagonal elements equal to 1.1 / ( 0.9 * 1.2) and
%    off diagonal elements of -0.1 / ( 0.9 * 1.2 ).
%
%    From this information, and using the scaling matrix, it is possible
%    to determine the determinant, inverse, eigenvalues and eigenvectors
%    of the badly scaled matrix as well.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SCALE:
%    0, return the badly scaled matrix.
%    1, return the well scaled matrix.
%
%    Input, integer PERMUTE:
%    0, output the matrix as it is (with rows and columns in the order (1,2,3) ).
%    1, output the matrix with rows and columns in the order (1,3,2).
%    2, output the matrix with rows and columns in the order (2,1,3).
%    3, output the matrix with rows and columns in the order (2,3,1).
%    4, output the matrix with rows and columns in the order (3,1,2).
%    5, output the matrix with rows and columns in the order (3,2,1).
%
%    Output, real A(3,3), the matrix.
%
  if ( scale == 0 ) 
  
    a(1:3,1:3) = [ ...
      1.0E+40, 1.0E+29, 1.0E+19; ...
      1.0E+29, 1.0E+20, 1.0E+09; ...
      1.0E+19, 1.0E+09, 1.0E+00 ];
	  
  elseif ( scale == 1 )
  
    a(1:3,1:3) = [ ...
      1.0E+00, 1.0E-01, 1.0E-01; ...
      1.0E-01, 1.0E+00, 1.0E-01; ...
      1.0E-01, 1.0E-01, 1.0E+00 ];
	  
  else
  
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DRMAC - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of SCALE = %d\n', scale );
    error ( 'DRMAC - Fatal error!' );
	
  end

  if ( permute == 0 )
    perm(1:3) = [ 1, 2, 3 ];
  elseif ( permute == 1 )
    perm(1:3) = [ 1, 3, 2 ];
  elseif ( permute == 2 )
    perm(1:3) = [ 2, 1, 3 ];
  elseif ( permute == 3 )
    perm(1:3) = [ 2, 3, 1 ];
  elseif ( permute == 4 )
    perm(1:3) = [ 3, 1, 2 ];
  elseif ( permute == 5 )
    perm(1:3) = [ 3, 2, 1 ];
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DRMAC - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PERMUTE = %d\n', permute );
    error ( 'DRMAC - Fatal error!' );
  end
  
  a(1:3,1:3) = a( perm(1:3), perm(1:3) );
  
  return
end
